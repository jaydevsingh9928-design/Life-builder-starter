import { Body, Controller, Get, Post } from '@nestjs/common';
import { GoalsService, Goal } from './goals.service.js';

@Controller('goals')
export class GoalsController {
  constructor(private readonly svc: GoalsService) {}
  @Get() list(): Goal[] { return this.svc.list(); }
  @Post() create(@Body() g: Omit<Goal,'id'>) { return this.svc.create(g); }
}
