From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH v6 2/6] dt-bindings: Add the rzn1-clocks.h file
Date: Wed, 30 May 2018 13:49:09 +0000
Message-ID: <TY1PR01MB1769BE183DE5BC2CAC719663F56C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1526983321-41949-1-git-send-email-michel.pollet@bp.renesas.com>
 <1526983321-41949-3-git-send-email-michel.pollet@bp.renesas.com>
 <CAMuHMdW-HUBRF4rLdfzixcyMUBg7+4XU+-3zayePoyeQiBZ8ZA@mail.gmail.com>
 <CAMMfpEyTORirKiE417AQzCLzxDTKmy83bwivpfJaHQsKUKMc_w@mail.gmail.com>
 <CAMuHMdWAU9wZkA+Z0BNAGrLV1WrCO3PgCTo2p=q3Mq9Tm6JBGA@mail.gmail.com>
 <CAMMfpEwKa90XHu_igCxRQLy_CSVHTkN8eD8f7o=wgtttSn=FqA@mail.gmail.com>
 <CAMuHMdWVde-DfbLVbvZT4rQfsVz1z7AMyQVgbO2DXrQKsEdVcw@mail.gmail.com>
 <TY1PR01MB1769DFD4CD9803D10CE1CA4BF56C0@TY1PR01MB1769.jpnprd01.prod.outlook.com>
 <CAMuHMdV8Hey=L6jv7HFyTUbeKdcC8ygn7PFjW2akETHe44MjeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdV8Hey=L6jv7HFyTUbeKdcC8ygn7PFjW2akETHe44MjeQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: M P <buserror@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Michel Pollet <buserror+upstream@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIDMwIE1heSAyMDE4IDE0OjM3IEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90
ZToNCj4gT24gV2VkLCBNYXkgMzAsIDIwMTggYXQgMzozMCBQTSwgUGhpbCBFZHdvcnRoeSB3cm90
ZToNCj4gPiBPbiAyNSBNYXkgMjAxOCAxMDoxMyBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+
ID4gIFtzbmlwXQ0KPiA+DQo+ID4+IE5vdywgZ2l2ZW4gdGhlIGNsb2NrIGRlZmluaXRpb25zIGZv
ciBSWi9OMVtEU0xdIGFyZSB0aGUgc2FtZQ0KPiA+PiAoYWx0aG91Z2ggc29tZSBkb24ndCBleGlz
dCBvbiBzb21lIHZhcmlhbnRzKSwgeW91IGNvdWxkIGtlZXAgb24gdXNpbmcNCj4gPj4gUlpOMV9D
TEtfRk9PIGZvciB0aGUgbmFtZXMgb2YgdGhlIGRlZmluZXMsIGFuZCBzdG9yZSB0aGVtIGluIGEN
Cj4gY29tbW9uDQo+ID4+IGZpbGUsIGluY2x1ZGVkIGJ5IHRoZSBzb2Mtc3BlY2lmaWMgZmlsZS4g
QnV0IHBsZWFzZSBtYWtlIGNsZWFyIHRoZQ0KPiA+PiBjb21tb24gZmlsZSBjYW5ub3QgYmUgaW5j
bHVkZWQgZGlyZWN0bHksIHNvIHRoZSBmaWxlbmFtZSBkb2VzIG5vdA0KPiA+PiBiZWNvbWUgcGFy
dCBvZiB0aGUgRFQgQUJJLCBhbmQgeW91IGFyZSBzaGllbGRlZCBmcm9tIGZ1dHVyZSBtYXJrZXRp
bmcNCj4gPj4gc2lsbGluZXNzIChlLmcuIG5leHQgcXVhcnRlcidzIFJaL04xWCBiZWluZyB0b3Rh
bGx5IGRpZmZlcmVudCkuDQo+ID4gSG93IGRvZXMgYW4gaW5jbHVkZSBmaWxlbmFtZSBiZWNvbWUg
cGFydCBvZiB0aGUgRFQgQUJJPw0KPiA+IEkgdGhvdWdodCB0aGUgZHRiIGlzIHRoZSBBQkksIG5v
dCB0aGUgZHRzLiBBbSBJIHdyb25nPw0KPiANCj4gWW91J3JlIHJpZ2h0LiBJbiBzZSB0aGUgRFQg
QUJJIGFwcGxpZXMgdG8gdGhlIERUQiwgbm90IHRvIHRoZSBEVFMuDQo+IA0KPiBUaGUgZGVmaW5p
dGlvbnMgaW5zaWRlIHRoZSBpbmNsdWRlIGZpbGUgYXJlIHBhcnQgb2YgdGhlIERUIGJpbmRpbmdz
LCBhbmQgdGh1cw0KPiBjYW5ub3QgYmUgY2hhbmdlZC4gIFlvdXIgRFRTIGZpbGVzIGdldCB0aGVz
ZSBkZWZpbml0aW9ucyBieSBpbmNsdWRpbmcgdGhlDQo+IGhlYWRlciBmaWxlLCBzbyB0aGUgaGVh
ZGVyIGZpbGVuYW1lIGlzIGFsc28gcGFydCBvZiB0aGUgYmluZGluZ3MsIGFuZCB0aHVzIGNhbid0
DQo+IGJlIGNoYW5nZWQgdGhhdCBlYXNpbHkuDQpUaGF0IHNlZW1zIGEgYml0IG9uZXJvdXMuLi4g
DQpJdCBtYWtlcyBzZW5zZSB0aGF0IGJpbmRpbmdzIHRoYXQgYWZmZWN0IHRoZSBkdGIgY2FuIG9u
bHkgYmUgYWRkZWQgdG8sIHNvIHRoYXQNCmFuIG9sZCBkdGIgc3RpbGwgd29ya3MuIEhvd2V2ZXIs
IEkgd291bGQgaGF2ZSB0aG91Z2h0IGl0J3MgdGhlIHZhbHVlIG9mIHRoZQ0KY29uc3RhbnQgdGhh
dCBpcyB0aGUgQUJJLCBub3QgdGhlIHN5bWJvbCBuYW1lIHVzZWQgdG8gc3BlY2lmeSBpdC4NCg0K
VGhhbmtzIGZvciB5b3UgZmVlZGJhY2shDQpQaGlsDQo=
