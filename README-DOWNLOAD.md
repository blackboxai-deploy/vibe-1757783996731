# Zathaya Soft - Professional Website

[![Next.js](https://img.shields.io/badge/Next.js-15.3.2-black)](https://nextjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.9.2-blue)](https://www.typescriptlang.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-4.1.13-38B2AC)](https://tailwindcss.com/)
[![shadcn/ui](https://img.shields.io/badge/shadcn%2Fui-latest-000000)](https://ui.shadcn.com/)

Modern, responsive website untuk Zathaya Soft - perusahaan jasa pembuatan website profesional.

## 🌐 Live Demo

**Website URL:** [https://sb-2rkbgt3osn33.vercel.run](https://sb-2rkbgt3osn33.vercel.run)

## ✨ Features

### 🎨 Design & UI
- **Modern Design**: Clean, professional dengan gradient blue theme
- **Fully Responsive**: Perfect di desktop, tablet, dan mobile
- **Component Library**: shadcn/ui untuk konsistensi design
- **Animations**: Smooth transitions dan hover effects
- **Typography**: Inter font untuk optimal readability

### 📱 Pages & Functionality
- **Homepage**: Hero section, services showcase, testimonials, stats
- **Services**: Detailed service packages dengan pricing
- **Portfolio**: Project showcase dengan filtering dan case studies  
- **About**: Team profiles, company values, achievements
- **Contact**: Interactive form dengan validation
- **Responsive Navigation**: Mobile-friendly hamburger menu

### 🚀 Technical Features
- **Next.js 15**: Latest features dengan App Router
- **TypeScript**: Type-safe development
- **Tailwind CSS**: Utility-first styling
- **Performance Optimized**: Fast loading dengan static generation
- **SEO Ready**: Proper meta tags dan structured data
- **Form Validation**: React Hook Form dengan Zod validation

## 🛠️ Tech Stack

### Frontend
- **Framework**: Next.js 15 with App Router
- **Language**: TypeScript 5.9
- **Styling**: Tailwind CSS 4.1
- **UI Components**: shadcn/ui + Radix UI
- **Forms**: React Hook Form + Zod validation
- **Icons**: Custom SVG icons (no external libraries)
- **Images**: AI-generated content (via placeholder processing)

### Development Tools
- **Linting**: ESLint with Next.js config
- **Formatting**: Built-in Prettier support
- **Type Checking**: TypeScript strict mode
- **Package Manager**: npm/pnpm support

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ installed
- npm atau pnpm package manager

### Installation

#### Method 1: Automated Setup (Recommended)
```bash
# Run the setup script
chmod +x setup-project.sh
./setup-project.sh
```

#### Method 2: Manual Setup
```bash
# Create new Next.js project
npx create-next-app@latest zathaya-soft --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"
cd zathaya-soft

# Install dependencies
npm install @radix-ui/react-accordion @radix-ui/react-alert-dialog @radix-ui/react-aspect-ratio @radix-ui/react-avatar @radix-ui/react-checkbox @radix-ui/react-collapsible @radix-ui/react-context-menu @radix-ui/react-dialog @radix-ui/react-dropdown-menu @radix-ui/react-hover-card @radix-ui/react-label @radix-ui/react-menubar @radix-ui/react-navigation-menu @radix-ui/react-popover @radix-ui/react-progress @radix-ui/react-radio-group @radix-ui/react-scroll-area @radix-ui/react-select @radix-ui/react-separator @radix-ui/react-slider @radix-ui/react-switch @radix-ui/react-tabs @radix-ui/react-toggle @radix-ui/react-toggle-group @radix-ui/react-tooltip class-variance-authority clsx cmdk input-otp lucide-react next-themes react-hook-form tailwind-merge vaul zod @hookform/resolvers date-fns embla-carousel-react recharts sonner react-day-picker react-resizable-panels axios swr

# Setup shadcn/ui
npx shadcn@latest init
npx shadcn@latest add button card input textarea label select badge accordion alert-dialog aspect-ratio avatar checkbox collapsible command context-menu dialog dropdown-menu form hover-card menubar navigation-menu popover progress radio-group scroll-area separator sheet slider switch tabs toggle tooltip
```

### Development

```bash
# Start development server
npm run dev

# Build for production
npm run build

# Start production server
npm run start

# Type checking
npm run type-check

# Linting
npm run lint
```

## 📁 Project Structure

```
zathaya-soft/
├── src/
│   ├── app/                    # App Router pages
│   │   ├── layout.tsx         # Root layout
│   │   ├── page.tsx           # Homepage
│   │   ├── globals.css        # Global styles
│   │   ├── services/          # Services page
│   │   ├── portfolio/         # Portfolio page
│   │   ├── about/            # About page
│   │   └── contact/          # Contact page
│   ├── components/           # Reusable components
│   │   ├── Header.tsx        # Navigation header
│   │   ├── Footer.tsx        # Footer component
│   │   └── ui/              # shadcn/ui components
│   ├── lib/                 # Utilities
│   │   └── utils.ts         # Utility functions
│   └── hooks/               # Custom hooks
│       └── use-mobile.ts    # Mobile detection
├── public/                  # Static assets
├── package.json            # Dependencies
├── tailwind.config.ts      # Tailwind configuration
├── tsconfig.json          # TypeScript configuration
└── next.config.ts         # Next.js configuration
```

## 🎨 Design System

### Colors
- **Primary**: Blue gradient (#3B82F6 to #4F46E5)
- **Secondary**: Gray scale (#F9FAFB to #111827)
- **Accent**: Success green, Warning yellow

### Typography
- **Font Family**: Inter (Google Fonts)
- **Headings**: Font weights 600-700
- **Body**: Font weight 400
- **Small Text**: Font weight 400

### Components
- **Cards**: Shadow-lg dengan hover effects
- **Buttons**: Gradient backgrounds dengan smooth transitions
- **Forms**: Proper validation states dan error handling
- **Navigation**: Responsive dengan mobile hamburger menu

## 📱 Responsive Design

### Breakpoints
- **Mobile**: < 768px
- **Tablet**: 768px - 1024px  
- **Desktop**: > 1024px

### Mobile Features
- Hamburger navigation menu
- Touch-friendly button sizes
- Optimized image sizes
- Readable typography scales

## 🔧 Customization

### Environment Variables
Create `.env.local` file:
```
NEXT_PUBLIC_SITE_URL=https://yourdomain.com
NEXT_PUBLIC_COMPANY_NAME="Your Company Name"
NEXT_PUBLIC_CONTACT_EMAIL="info@yourcompany.com"
NEXT_PUBLIC_CONTACT_PHONE="+62 812-3456-7890"
```

### Content Updates
1. **Services**: Update `src/app/services/page.tsx`
2. **Portfolio**: Update `src/app/portfolio/page.tsx`
3. **Team Info**: Update `src/app/about/page.tsx`
4. **Contact Info**: Update `src/components/Footer.tsx`

### Styling Customization
- **Colors**: Update `tailwind.config.ts`
- **Fonts**: Update Google Fonts import in `layout.tsx`
- **Components**: Modify shadcn components in `src/components/ui/`

## 🔗 Drupal Integration

Website ini dirancang untuk diintegrasikan dengan Drupal sebagai headless CMS. Lihat `DRUPAL-INTEGRATION.md` untuk panduan lengkap integrasi.

### Key Integration Points
- Content management melalui Drupal admin
- REST/GraphQL API untuk data fetching
- Dynamic content rendering
- SEO optimization dengan Drupal meta fields

## 🚀 Deployment

### Vercel (Recommended)
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel

# Production deployment
vercel --prod
```

### Netlify
```bash
# Build command
npm run build

# Publish directory
out/
```

### Traditional Hosting
```bash
# Build static export
npm run build
npm run export

# Upload 'out' directory to your web server
```

## 📊 Performance

### Core Web Vitals
- **LCP (Largest Contentful Paint)**: < 2.5s
- **FID (First Input Delay)**: < 100ms
- **CLS (Cumulative Layout Shift)**: < 0.1

### Optimization Features
- Static Site Generation (SSG)
- Image optimization dengan Next.js Image
- CSS optimization dengan Tailwind
- Bundle optimization dengan Next.js
- Lazy loading untuk components

## 🔍 SEO Features

### Meta Tags
- Title tags yang optimized
- Meta descriptions untuk setiap halaman
- Open Graph tags untuk social sharing
- Twitter Card meta tags
- Canonical URLs

### Structured Data
- Organization schema
- Service schema
- Review schema
- Contact schema

### Performance SEO
- Fast loading times
- Mobile-friendly design
- Proper heading structure
- Image alt texts
- Clean URL structure

## 🤝 Contributing

### Development Workflow
1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push to branch: `git push origin feature/amazing-feature`
5. Open Pull Request

### Code Style
- Use TypeScript untuk type safety
- Follow ESLint rules
- Use Prettier untuk formatting
- Write meaningful commit messages
- Add comments untuk complex logic

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 💬 Support

### Documentation
- `project-structure.md` - File structure overview
- `DRUPAL-INTEGRATION.md` - Drupal CMS integration guide
- `TODO.md` - Development progress tracking

### Contact
- **Website**: [https://sb-2rkbgt3osn33.vercel.run](https://sb-2rkbgt3osn33.vercel.run)
- **Email**: info@zathayasoft.com
- **Phone**: +62 812-3456-7890

## 🎯 Roadmap

### Phase 1 (Completed ✅)
- [x] Modern responsive design
- [x] All main pages (Home, Services, Portfolio, About, Contact)
- [x] Interactive components
- [x] Mobile optimization
- [x] SEO implementation

### Phase 2 (Next)
- [ ] Drupal CMS integration
- [ ] Content management system
- [ ] Multi-language support
- [ ] Advanced analytics
- [ ] Performance monitoring

### Phase 3 (Future)
- [ ] PWA implementation
- [ ] Advanced animations
- [ ] Blog system
- [ ] Customer portal
- [ ] E-commerce integration

---

**Dibuat dengan ❤️ untuk Zathaya Soft**

© 2024 Zathaya Soft. All rights reserved.