import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { IContact } from './contactsTemplate';
import { ISenderList } from './senderListTemplate';
import { IMessageFrom } from './messageFromTemplate';

@Injectable()
export class DataproviderService {

  private _contactUrl: string = "./../api/provider.php?subject=contacts";
  private _MessageUrl: string = "./../api/provider.php?subject=messages";
  private _messageFrom: string = './../api/provider.php?subject=messageFrom';
  private _messagePostUrl: string = "./../api/provider.php?subject=postMessage";
  constructor(private http: HttpClient) { }

  getAllContacts(): Observable<IContact[]>{
    return this.http.get<IContact[]>(this._contactUrl);
  }

  getMessageSenders(): Observable<ISenderList[]>{
    return this.http.get<ISenderList[]>(this._MessageUrl);
  }
  fetchMessages(uid): Observable<IMessageFrom[]>{
    return this.http.get<IMessageFrom[]>(this._messageFrom + '&sender_id=' + uid );
  }

  saveMessage(msg, receiver_id){
    return this.http.get(this._messagePostUrl + '&thread=' + msg + '&receiver_id=' + receiver_id );
  }
}
