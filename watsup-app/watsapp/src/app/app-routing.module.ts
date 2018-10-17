import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ChatsComponent } from './chats/chats.component';
import { ContactsComponent } from './contacts/contacts.component';
import { ChatWindowComponent } from './chat-window/chat-window.component';

const routes: Routes = [
  {path: '', redirectTo: '/chats', pathMatch: 'full'},
  {path: 'chats', component: ChatsComponent},
  {path: 'chats/:id', component: ChatWindowComponent},
  {path: 'contacts', component: ContactsComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { };
export const routingComponents = [ChatsComponent, ContactsComponent, ChatWindowComponent];
