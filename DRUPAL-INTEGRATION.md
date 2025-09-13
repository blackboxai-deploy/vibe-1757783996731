# Integrasi Website Zathaya Soft dengan Drupal CMS

## Overview Integrasi

Website frontend Next.js yang telah dibuat akan diintegrasikan dengan Drupal sebagai headless CMS untuk manajemen konten. Drupal akan berfungsi sebagai backend API yang menyediakan data untuk website.

## Arsitektur Integrasi

```
[Drupal CMS Backend] ←→ [REST/GraphQL API] ←→ [Next.js Frontend]
```

### 1. **Drupal sebagai Headless CMS**
- Drupal akan menyediakan admin interface untuk mengelola konten
- Data akan diekspos melalui REST API atau GraphQL
- Admin dapat mengelola: services, portfolio, team members, testimonials, dll.

### 2. **Next.js sebagai Frontend**
- Mengkonsumsi data dari Drupal API
- Melakukan server-side rendering untuk SEO
- Tetap menggunakan komponen UI yang sudah dibuat

## Step-by-Step Integrasi

### Phase 1: Setup Drupal Backend

#### 1.1 Install Drupal dengan Modules yang Diperlukan
```bash
# Install Drupal
composer create-project drupal/recommended-project zathaya-drupal
cd zathaya-drupal

# Install required modules
composer require drupal/restui drupal/serialization drupal/hal
composer require drupal/jsonapi drupal/graphql drupal/cors
composer require drupal/admin_toolbar drupal/pathauto
```

#### 1.2 Configure Content Types

**Content Types yang perlu dibuat:**

1. **Services** (machine_name: service)
   - Title (text)
   - Description (text_long)
   - Features (text_long, multiple values)
   - Image (image)
   - Packages (paragraph reference)
   - Category (taxonomy reference)

2. **Portfolio Projects** (machine_name: portfolio)
   - Title (text)
   - Description (text_long)
   - Category (taxonomy reference)
   - Client (text)
   - Completed Date (date)
   - Results (text_long, multiple values)
   - Tags (taxonomy reference, multiple)
   - Image (image)
   - Project URL (link)

3. **Team Members** (machine_name: team)
   - Name (text)
   - Role (text)
   - Description (text_long)
   - Skills (text, multiple values)
   - Image (image)
   - Social Links (link, multiple)

4. **Testimonials** (machine_name: testimonial)
   - Client Name (text)
   - Company (text)
   - Content (text_long)
   - Rating (number)
   - Image (image)

5. **Company Info** (machine_name: company_info)
   - Field (text)
   - Value (text_long)
   - Type (taxonomy reference: contact, about, stats)

#### 1.3 Configure REST/JSON:API Endpoints

Enable REST resources untuk setiap content type:
- `/jsonapi/node/service`
- `/jsonapi/node/portfolio`
- `/jsonapi/node/team`
- `/jsonapi/node/testimonial`
- `/jsonapi/node/company_info`

### Phase 2: Update Next.js Frontend

#### 2.1 Install API Client Dependencies
```bash
npm install axios swr
# atau
npm install @apollo/client graphql (jika menggunakan GraphQL)
```

#### 2.2 Create API Service Layer

**File: `src/lib/drupal-api.ts`**
```typescript
import axios from 'axios';

const DRUPAL_BASE_URL = process.env.NEXT_PUBLIC_DRUPAL_URL || 'http://localhost:8000';

const api = axios.create({
  baseURL: `${DRUPAL_BASE_URL}/jsonapi`,
  headers: {
    'Content-Type': 'application/vnd.api+json',
    'Accept': 'application/vnd.api+json',
  },
});

// Services
export const getServices = async () => {
  const response = await api.get('/node/service?include=field_image');
  return response.data.data;
};

// Portfolio
export const getPortfolio = async () => {
  const response = await api.get('/node/portfolio?include=field_image,field_tags');
  return response.data.data;
};

// Team Members
export const getTeamMembers = async () => {
  const response = await api.get('/node/team?include=field_image');
  return response.data.data;
};

// Testimonials
export const getTestimonials = async () => {
  const response = await api.get('/node/testimonial?include=field_image');
  return response.data.data;
};

// Company Info
export const getCompanyInfo = async (type?: string) => {
  const url = type ? `/node/company_info?filter[field_type.name]=${type}` : '/node/company_info';
  const response = await api.get(url);
  return response.data.data;
};
```

#### 2.3 Create Data Hooks

**File: `src/hooks/useDrupalData.ts`**
```typescript
import useSWR from 'swr';
import { getServices, getPortfolio, getTeamMembers, getTestimonials } from '@/lib/drupal-api';

export const useServices = () => {
  const { data, error, isLoading } = useSWR('services', getServices);
  return { services: data, isLoading, error };
};

export const usePortfolio = () => {
  const { data, error, isLoading } = useSWR('portfolio', getPortfolio);
  return { portfolio: data, isLoading, error };
};

export const useTeamMembers = () => {
  const { data, error, isLoading } = useSWR('team', getTeamMembers);
  return { team: data, isLoading, error };
};

export const useTestimonials = () => {
  const { data, error, isLoading } = useSWR('testimonials', getTestimonials);
  return { testimonials: data, isLoading, error };
};
```

#### 2.4 Update Components to Use Drupal Data

**File: `src/app/page.tsx` (Update Homepage)**
```typescript
'use client';
import { useServices, useTestimonials } from '@/hooks/useDrupalData';

const Homepage = () => {
  const { services, isLoading: servicesLoading } = useServices();
  const { testimonials, isLoading: testimonialsLoading } = useTestimonials();

  if (servicesLoading || testimonialsLoading) {
    return <div>Loading...</div>;
  }

  return (
    <div>
      {/* Hero Section - Static content */}
      
      {/* Services Section - Dynamic from Drupal */}
      <section className="py-20 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid md:grid-cols-3 gap-8">
            {services?.map((service: any) => (
              <ServiceCard key={service.id} service={service} />
            ))}
          </div>
        </div>
      </section>

      {/* Testimonials Section - Dynamic from Drupal */}
      <section className="py-20 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="grid md:grid-cols-3 gap-8">
            {testimonials?.map((testimonial: any) => (
              <TestimonialCard key={testimonial.id} testimonial={testimonial} />
            ))}
          </div>
        </div>
      </section>
    </div>
  );
};
```

### Phase 3: Component Adaptations

#### 3.1 Create Drupal Data Adapters

**File: `src/lib/drupal-adapters.ts`**
```typescript
// Transform Drupal data structure to match component props
export const transformService = (drupalService: any) => {
  return {
    id: drupalService.id,
    title: drupalService.attributes.title,
    description: drupalService.attributes.field_description,
    features: drupalService.attributes.field_features || [],
    image: drupalService.relationships?.field_image?.data?.attributes?.uri?.url,
    packages: drupalService.attributes.field_packages || [],
  };
};

export const transformPortfolio = (drupalProject: any) => {
  return {
    id: drupalProject.id,
    title: drupalProject.attributes.title,
    description: drupalProject.attributes.field_description,
    category: drupalProject.attributes.field_category,
    client: drupalProject.attributes.field_client,
    completedDate: drupalProject.attributes.field_completed_date,
    results: drupalProject.attributes.field_results || [],
    tags: drupalProject.attributes.field_tags || [],
    image: drupalProject.relationships?.field_image?.data?.attributes?.uri?.url,
  };
};

export const transformTeamMember = (drupalMember: any) => {
  return {
    id: drupalMember.id,
    name: drupalMember.attributes.title,
    role: drupalMember.attributes.field_role,
    description: drupalMember.attributes.field_description,
    skills: drupalMember.attributes.field_skills || [],
    image: drupalMember.relationships?.field_image?.data?.attributes?.uri?.url,
  };
};
```

#### 3.2 Update Components with Loading States

**File: `src/components/ServiceCard.tsx`**
```typescript
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Skeleton } from "@/components/ui/skeleton";

interface ServiceCardProps {
  service?: any;
  isLoading?: boolean;
}

const ServiceCard = ({ service, isLoading }: ServiceCardProps) => {
  if (isLoading) {
    return (
      <Card className="border-0 shadow-lg">
        <CardHeader>
          <Skeleton className="h-12 w-12 rounded-lg mb-4" />
          <Skeleton className="h-6 w-3/4" />
          <Skeleton className="h-4 w-full" />
        </CardHeader>
        <CardContent>
          <div className="space-y-2">
            <Skeleton className="h-3 w-full" />
            <Skeleton className="h-3 w-2/3" />
            <Skeleton className="h-3 w-full" />
          </div>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card className="border-0 shadow-lg hover:shadow-xl transition-shadow duration-300 group">
      <CardHeader className="pb-4">
        {service.image && (
          <img src={service.image} alt={service.title} className="w-12 h-12 object-cover rounded-lg mb-4" />
        )}
        <CardTitle className="text-xl font-bold text-gray-900">
          {service.title}
        </CardTitle>
        <p className="text-gray-600">{service.description}</p>
      </CardHeader>
      <CardContent>
        <ul className="space-y-2">
          {service.features?.map((feature: string, index: number) => (
            <li key={index} className="flex items-center text-sm text-gray-600">
              <div className="w-2 h-2 bg-blue-500 rounded-full mr-3" />
              {feature}
            </li>
          ))}
        </ul>
      </CardContent>
    </Card>
  );
};

export default ServiceCard;
```

### Phase 4: Content Management Workflow

#### 4.1 Drupal Admin Interface Setup
1. Configure admin permissions untuk content editors
2. Setup workflows untuk content approval
3. Configure image styles untuk berbagai ukuran
4. Setup media library untuk asset management

#### 4.2 Content Editor Training
- Panduan menggunakan Drupal admin interface
- Best practices untuk SEO content
- Image optimization guidelines
- Content structure guidelines

### Phase 5: Advanced Features

#### 5.1 Content Preview
```typescript
// Add preview mode untuk melihat content sebelum publish
export const getServerSideProps = async (context: any) => {
  const preview = context.preview || false;
  const services = await getServices(preview);
  
  return {
    props: {
      services,
      preview,
    },
  };
};
```

#### 5.2 ISR (Incremental Static Regeneration)
```typescript
export const getStaticProps = async () => {
  const services = await getServices();
  
  return {
    props: {
      services,
    },
    revalidate: 60, // Regenerate every 60 seconds
  };
};
```

#### 5.3 Search & Filtering
```typescript
// Add search functionality
export const searchContent = async (query: string, type?: string) => {
  const params = new URLSearchParams({
    'filter[title][operator]': 'CONTAINS',
    'filter[title][value]': query,
  });
  
  if (type) {
    params.append('filter[type]', type);
  }
  
  const response = await api.get(`/node?${params.toString()}`);
  return response.data.data;
};
```

## Environment Variables

**File: `.env.local`**
```
NEXT_PUBLIC_DRUPAL_URL=http://localhost:8000
DRUPAL_CLIENT_ID=your-client-id
DRUPAL_CLIENT_SECRET=your-client-secret
```

## Deployment Considerations

### 1. **Drupal Backend**
- Deploy di server dengan PHP 8.x support
- Configure database (MySQL/PostgreSQL)
- Setup cron jobs untuk content updates
- Configure CORS untuk frontend access

### 2. **Next.js Frontend**
- Deploy di Vercel/Netlify
- Configure environment variables
- Setup build hooks untuk auto-deployment saat content berubah

### 3. **Content Sync**
- Setup webhooks dari Drupal ke trigger rebuilds
- Configure cache invalidation
- Monitor API performance

## Migration Plan

### Week 1: Drupal Setup
- Install dan configure Drupal
- Create content types
- Setup API endpoints
- Migrate static content ke Drupal

### Week 2: Frontend Integration
- Update Next.js components
- Implement API calls
- Add loading states
- Test integration

### Week 3: Content Migration
- Migrate existing content
- Train content editors
- Setup workflows
- Test content management

### Week 4: Deployment & Testing
- Deploy to production
- Performance testing
- User acceptance testing
- Go-live

## Maintenance & Updates

### Regular Tasks
- Update Drupal core dan modules
- Monitor API performance
- Backup content database
- Review security updates

### Content Management
- Regular content audits
- SEO optimization
- Image optimization
- Performance monitoring

Integrasi ini akan memberikan kemudahan pengelolaan konten melalui interface Drupal yang user-friendly sambil mempertahankan performa dan design website Next.js yang sudah optimal.