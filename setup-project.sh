#!/bin/bash

# Zathaya Soft Website Setup Script
echo "🚀 Setting up Zathaya Soft Website..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

echo "✅ Node.js and npm are installed"

# Create project directory
PROJECT_NAME="zathaya-soft-website"
if [ -d "$PROJECT_NAME" ]; then
    echo "⚠️  Directory $PROJECT_NAME already exists"
    read -p "Do you want to continue? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    mkdir "$PROJECT_NAME"
fi

cd "$PROJECT_NAME"

echo "📦 Installing dependencies..."

# Copy package.json (assuming it's available)
if [ -f "../package-download.json" ]; then
    cp ../package-download.json package.json
else
    echo "⚠️  package.json not found, creating basic Next.js setup..."
    npx create-next-app@latest . --typescript --tailwind --eslint --app --src-dir --import-alias "@/*" --no-git
fi

# Install all dependencies
npm install

echo "🎨 Setting up shadcn/ui..."

# Initialize shadcn/ui
npx shadcn@latest init -y

# Add all required shadcn components
echo "Adding shadcn/ui components..."
npx shadcn@latest add button card input textarea label select badge accordion alert-dialog aspect-ratio avatar checkbox collapsible command context-menu dialog dropdown-menu form hover-card menubar navigation-menu popover progress radio-group scroll-area separator sheet slider switch tabs toggle tooltip

echo "📁 Creating project structure..."

# Create necessary directories
mkdir -p src/app/{services,portfolio,about,contact}
mkdir -p src/components
mkdir -p src/lib
mkdir -p src/hooks
mkdir -p public

echo "✅ Project setup completed!"
echo ""
echo "📝 Next steps:"
echo "1. Copy all source files to their respective directories"
echo "2. Update environment variables if needed"
echo "3. Run 'npm run dev' to start development server"
echo "4. Run 'npm run build' to build for production"
echo ""
echo "🌐 For Drupal integration, see DRUPAL-INTEGRATION.md"
echo ""
echo "Happy coding! 🎉"