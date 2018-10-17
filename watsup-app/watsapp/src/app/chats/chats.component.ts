import { Component, OnInit } from '@angular/core';
import { DataproviderService } from '../dataprovider.service';
import { Router, ActivatedRoute } from '@angular/router';
import { IMessageFrom } from '../messageFromTemplate';
import { ISenderList } from '../senderListTemplate';
import { IContact } from '../contactsTemplate';

@Component({
  selector: 'app-chats',
  templateUrl: './chats.component.html',
  styleUrls: ['./chats.component.css']
})
export class ChatsComponent implements OnInit {

  constructor(private _dataProvider: DataproviderService, private activatedroute: ActivatedRoute, private router: Router) { }

  public senders = [];
  ngOnInit() {
    this.listSenders();
  }

  listSenders(){
    this._dataProvider.getMessageSenders()
    .subscribe(data => this.senders = data); 
  }

  onSelect(sender: IContact){
    this.router.navigate([sender.name.replace(/ /g, ''), {id: sender.u_id}], {relativeTo: this.activatedroute})
  }
}
