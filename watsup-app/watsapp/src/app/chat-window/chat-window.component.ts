import { Component, OnInit, ChangeDetectionStrategy } from '@angular/core';
import { DataproviderService } from '../dataprovider.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-chat-window',
  templateUrl: './chat-window.component.html',
  styleUrls: ['./chat-window.component.css']
})
export class ChatWindowComponent implements OnInit {

  public messageFrom = [];
  public receiver_id: Number = 0;
  constructor(private _dataProvider: DataproviderService, private route: ActivatedRoute ) { }

  ngOnInit() {
    this.receiver_id = parseInt(this.route.snapshot.paramMap.get('id'));
    this.messagesFrom(this.receiver_id);
  }

  messagesFrom(id){
    this._dataProvider.fetchMessages(id)
    .subscribe(data => this.messageFrom = data)
  }
  
  postMessage(inputElmt){
    this._dataProvider.saveMessage(inputElmt.value, this.receiver_id)
    .subscribe();
    this.messageFrom.push({thread: inputElmt.value});
    inputElmt.value = '';
    inputElmt.focus();
  }

}
