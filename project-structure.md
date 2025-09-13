# Zathaya Soft Website - File Structure & Download Guide

## File Structure
```
zathaya-soft/
├── package.json
├── next.config.ts
├── tailwind.config.ts
├── tsconfig.json
├── components.json
├── postcss.config.mjs
├── eslint.config.mjs
├── TODO.md
├── src/
│   ├── app/
│   │   ├── layout.tsx
│   │   ├── page.tsx
│   │   ├── globals.css
│   │   ├── services/
│   │   │   └── page.tsx
│   │   ├── portfolio/
│   │   │   └── page.tsx
│   │   ├── about/
│   │   │   └── page.tsx
│   │   └── contact/
│   │       └── page.tsx
│   ├── components/
│   │   ├── Header.tsx
│   │   ├── Footer.tsx
│   │   └── ui/
│   │       ├── button.tsx
│   │       ├── card.tsx
│   │       ├── input.tsx
│   │       ├── textarea.tsx
│   │       ├── label.tsx
│   │       ├── select.tsx
│   │       ├── badge.tsx
│   │       └── [other shadcn components...]
│   ├── lib/
│   │   └── utils.ts
│   └── hooks/
│       └── use-mobile.ts
└── public/
    ├── next.svg
    ├── vercel.svg
    └── [other assets...]
```

## Download Instructions

Since the sandbox has file system limitations, here are the key files you need to recreate the project:

### 1. Create New Next.js Project
```bash
npx create-next-app@latest zathaya-soft --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"
cd zathaya-soft
```

### 2. Install Dependencies
```bash
npm install @radix-ui/react-accordion @radix-ui/react-alert-dialog @radix-ui/react-aspect-ratio @radix-ui/react-avatar @radix-ui/react-checkbox @radix-ui/react-collapsible @radix-ui/react-context-menu @radix-ui/react-dialog @radix-ui/react-dropdown-menu @radix-ui/react-hover-card @radix-ui/react-label @radix-ui/react-menubar @radix-ui/react-navigation-menu @radix-ui/react-popover @radix-ui/react-progress @radix-ui/react-radio-group @radix-ui/react-scroll-area @radix-ui/react-select @radix-ui/react-separator @radix-ui/react-slider @radix-ui/react-switch @radix-ui/react-tabs @radix-ui/react-toggle @radix-ui/react-toggle-group @radix-ui/react-tooltip class-variance-authority clsx cmdk input-otp lucide-react next-themes react-hook-form tailwind-merge vaul zod @hookform/resolvers date-fns embla-carousel-react recharts sonner react-day-picker react-resizable-panels
```

### 3. Install shadcn/ui
```bash
npx shadcn@latest init
npx shadcn@latest add button card input textarea label select badge accordion alert-dialog aspect-ratio avatar checkbox collapsible command context-menu dialog dropdown-menu form hover-card menubar navigation-menu popover progress radio-group scroll-area separator sheet slider switch tabs toggle tooltip
```

## Key Features Implemented

### ✅ Homepage
- Modern hero section with gradient backgrounds
- Animated statistics counter
- Services showcase with cards
- Client testimonials
- Call-to-action sections

### ✅ Services Page
- Detailed service descriptions
- Pricing packages with popular badges
- Process workflow visualization
- Feature comparisons

### ✅ Portfolio Page
- Project showcase with filters
- Interactive hover effects
- Case studies with results
- Technology stack display

### ✅ About Page
- Company vision & mission
- Team member profiles
- Core values presentation
- Technology expertise
- Awards & achievements

### ✅ Contact Page
- Interactive contact form with validation
- Service selection dropdown
- Budget range selection
- Contact information cards
- FAQ section

### ✅ Technical Features
- Fully responsive design
- TypeScript implementation
- Tailwind CSS styling
- shadcn/ui components
- SEO optimized
- Performance optimized
- AI-generated images

## Live Preview
Website URL: https://sb-2rkbgt3osn33.vercel.run

## Next Steps for Drupal Integration
See DRUPAL-INTEGRATION.md for detailed integration guide.