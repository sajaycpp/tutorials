import { Component, OnInit } from '@angular/core';
import { DataproviderService } from '../dataprovider.service';
import { ThrowStmt } from '@angular/compiler';
import { IContact } from '../contactsTemplate';
import { Route } from '@angular/compiler/src/core';
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-contacts',
  templateUrl: './contacts.component.html',
  styleUrls: ['./contacts.component.css']
})
export class ContactsComponent implements OnInit {

  public contacts = [];
  constructor(private _dataProvider: DataproviderService, private activatedroute: ActivatedRoute, private router: Router) { }

  ngOnInit() {
    this._dataProvider.getAllContacts()
    .subscribe(data => this.contacts = data);  
  }

  onSelect(user: IContact){
    this.router.navigate(['/chats', user.name.replace(/ /g, ''), {id: user.u_id}], {relativeTo: this.activatedroute});
  }
}
