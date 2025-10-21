import { Body, Controller, Post } from '@nestjs/common';

type GeneratePlanRequest = {
  goalType: 'fitness'|'income'|'routine';
  constraints?: { availability?: Record<string, string[]>; equipment?: string[]; skill?: string; };
  targets?: { muscleKg?: number; weightLossKg?: number; monthlyIncomeINR?: number; };
  currentLevel?: 'beginner'|'intermediate'|'advanced';
  startDate?: string;
  weeks?: number;
};

@Controller('ai')
export class AiController {
  @Post('plan/generate')
  generate(@Body() body: GeneratePlanRequest) {
    const today = new Date();
    const days = Array.from({length: 7}).map((_, i) => {
      const d = new Date(today); d.setDate(today.getDate()+i);
      const date = d.toISOString().slice(0,10);
      if (body.goalType === 'fitness') {
        return { date, blocks: [
          { title: 'Push Day', start: '19:30', end: '20:30', notes: 'Reduced volume if fatigue high' },
          { title: 'Pipeline sprint', start: '20:45', end: '21:05', notes: '3 leads outreach' },
        ]};
      }
      if (body.goalType === 'income') {
        return { date, blocks: [
          { title: 'Prospect 10 leads', start: '19:30', end: '20:00', notes: 'Template A' },
          { title: 'Portfolio polish', start: '20:05', end: '20:35', notes: 'Case study WIP' },
        ]};
      }
      return { date, blocks: [
        { title: 'Plan review', start: '09:00', end: '09:30', notes: 'Auto-reflow' },
        { title: 'Deep work', start: '10:00', end: '11:00', notes: 'Priority 1' },
      ]};
    });
    return { weeks: 1, schedule: days, rationale: 'Template-based mock for MVP' };
  }
          }
