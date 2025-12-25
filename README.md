# Clueso Clone

An AI-powered video creation platform that allows users to create instructional videos and documentation from screen recordings.

## Features

- 🎥 **Video Recording/Upload** - Record new videos or upload existing screen recordings
- 🤖 **AI Processing** - Automatic script improvement, AI voiceover generation, visual enhancement
- ✏️ **Video Editor** - Customizable editing interface for voice, flow, and visuals
- 📤 **Export & Share** - Download, embed, or share via links

## Tech Stack

- **Frontend**: React with TypeScript, TailwindCSS, shadcn/ui
- **Backend**: Node.js with Express
- **AI Integration**: Cohere AI API
- **Video Processing**: FFmpeg
- **Real-time**: Socket.IO

## Getting Started

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn
- FFmpeg installed on your system

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd clueso-clone
```

2. Install dependencies:
```bash
npm run install-deps
```

3. Set up environment variables:
```bash
cp .env.example .env
# Edit .env with your Cohere API key and other configurations
```

4. Start the development server:
```bash
npm run dev
```

The application will be available at:
- Frontend: http://localhost:3000
- Backend: http://localhost:5000

## Project Structure

```
clueso-clone/
├── client/                 # React frontend
├── server/                 # Node.js backend
├── uploads/               # File upload directory
├── package.json           # Root package.json
└── README.md             # This file
```

## API Endpoints

- `POST /api/upload` - Upload video files
- `POST /api/process` - Process video with AI
- `GET /api/videos/:id` - Get video details
- `POST /api/export/:id` - Export processed video

