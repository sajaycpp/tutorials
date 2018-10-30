import { Component, Input } from '@angular/core';
import { ChatService } from './chat.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  @Input() public userJsonData;
  title = 'Wats-Up';
  constructor(public initialUserData: ChatService  ) { }

  ngOnInit(){
    this.initialUserData = this.userJsonData;
  }
}
