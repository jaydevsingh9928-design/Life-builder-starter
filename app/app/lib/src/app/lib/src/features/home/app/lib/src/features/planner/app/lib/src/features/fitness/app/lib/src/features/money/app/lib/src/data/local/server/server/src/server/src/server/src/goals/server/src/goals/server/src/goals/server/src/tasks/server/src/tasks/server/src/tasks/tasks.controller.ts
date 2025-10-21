import { Body, Controller, Get, Post } from '@nestjs/common';
import { TasksService, Task } from './tasks.service.js';

@Controller('tasks')
export class TasksController {
  constructor(private readonly svc: TasksService) {}
  @Get() list(): Task[] { return this.svc.list(); }
  @Post() create(@Body() t: Omit<Task,'id'>) { return this.svc.create(t); }
}
