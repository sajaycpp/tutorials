import { Injectable, Input } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ChatService {
  @Input() public initialUserData;
  constructor() { }
}
