# MediBill Pro - Medical Billing Automation Dashboard

A **fully open-source, self-hostable** medical billing automation web application with AI-powered denial resolution, team performance tracking, and collections forecasting.

## 🎯 What It Does

For **Medical Billing Supervisors**:
- **Live Dashboard** - Real-time team performance, claims aging, collections metrics
- **Collections Forecasting** - Predictive revenue analytics
- **Team Performance** - Track individual agent efficiency and QA scores
- **Google Sheets Sync** - Connect your existing aging claims data

For **Billing Agents**:
- **AI Denial Explainer** - Describe a denial scenario → get root cause analysis, success probability, and recommended actions
- **AI Appeal Generator** - Generate professional denial appeal letters using AI
- **Performance Tracking** - View personal metrics and goals

## 🤖 Open-Source AI Support

This app is designed to work with **open-source, self-hosted AI models**. You are not locked into OpenAI.

### Supported AI Providers

| Provider | Type | Setup |
|----------|------|-------|
| **Ollama** | Open-source, self-hosted | `docker run -d -v ollama:/root/.ollama -p 11434:11434 ollama/ollama` |
| **Hugging Face** | Open-source models | Free API at huggingface.co |
| **Local AI** | Custom endpoint | Your own inference server |
| **OpenAI** | Commercial | Fallback option |

### Default Configuration (Ollama)

The app is pre-configured to use **Ollama** with **Llama 3.1:8b** - a powerful open-source model you can run locally for free.

## 🚀 Quick Start (Docker - Recommended)

The easiest way to run this application is with Docker Compose:

### 1. Clone the Repository

```bash
git clone https://github.com/YOURUSERNAME/medical-billing-dashboard.git
cd medical-billing-dashboard
```

### 2. Configure Environment

```bash
cp .env.example .env
```

Edit `.env` with your settings. The defaults use Ollama (open-source, no API key needed).

### 3. Start with Docker Compose

```bash
docker compose up -d
```

This starts:
- **PostgreSQL** database (port 5432)
- **Ollama** AI server (port 11434) with Llama 3.1
- **MediBill Pro** app (port 3000)

### 4. Access the Application

Open http://localhost:3000

## 🛠 Manual Installation (Without Docker)

### Prerequisites

- Node.js 18+
- PostgreSQL 14+
- Ollama (for open-source AI) or OpenAI API key

### 1. Install Dependencies

```bash
npm install
```

### 2. Set Up Environment

```bash
cp .env.example .env
# Edit .env with your database URL and AI provider settings
```

### 3. Set Up Database

```bash
npx prisma generate
npx prisma db push

## 📋 Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `DATABASE_URL` | PostgreSQL connection string | Required |
| `NEXTAUTH_SECRET` | Session encryption secret | Required (run `openssl rand -base64 32`) |
| `NEXTAUTH_URL` | Your app URL | `http://localhost:3000` |
| `AI_PROVIDER` | `openai`, `ollama`, `huggingface`, or `local` | `ollama` |
| `OLLAMA_BASE_URL` | Ollama server URL | `http://localhost:11434` |
| `OLLAMA_MODEL` | Ollama model name | `llama3.1:8b` |
| `OPENAI_API_KEY` | OpenAI API key (optional fallback) | - |
| `GOOGLE_SHEET_ID` | Your Google Sheet ID | `17beKZ1euW_ixmW2AGC-VC4bLsYgE0BpmKtKYWvPQKzc` |
| `GOOGLE_SHEETS_API_KEY` | Google Sheets API key | - |
```

### 4. Start Ollama (for open-source AI)

## 📁 Project Structure

```
medical-billing-dashboard/
├── docker-compose.yml          # One-command deployment
├── Dockerfile                  # Container definition
├── .env.example                # Environment variables template
├── README.md                   # This file
├── prisma/
│   └── schema.prisma           # Database schema
├── src/
│   ├── app/
│   │   ├── (auth)/login/       # Sign-in page
│   │   ├── (dashboard)/        # Protected dashboard routes
│   │   ├── api/                # REST API routes
│   │   ├── layout.tsx          # Root layout
│   │   └── page.tsx            # Landing page
│   ├── components/
│   ├── lib/
│   └── types/
```

## 🔐 Demo Login

- **Email**: `admin@medicalbilling.com`
- **Password**: `password123`

## 🔄 How to Contribute

This is an open-source project. Contributions are welcome:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Commit your changes: `git commit -m "Add your feature"`
4. Push to the branch: `git push origin feature/your-feature`
5. Open a Pull Request

## 📄 License

MIT License - free to use, modify, and distribute.

```bash
# Install Ollama from https://ollama.com
ollama pull llama3.1:8b
ollama serve
```

### 5. Run the Application

```bash
npm run dev
```

Open http://localhost:3000

### 5. Initialize the Database

The database is auto-created on first start. Prisma migrations run automatically.