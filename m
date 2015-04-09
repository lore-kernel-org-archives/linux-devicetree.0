From: "Igal.Liberman@freescale.com" <Igal.Liberman@freescale.com>
Subject: RE: [v2] dt/bindings: qoriq-clock: Add binding for FMan clock mux
Date: Thu, 9 Apr 2015 07:18:23 +0000
Message-ID: <DM2PR03MB383D9FD2888970950261FB2E6FB0@DM2PR03MB383.namprd03.prod.outlook.com>
References: <1428479031-26597-1-git-send-email-igal.liberman@freescale.com>
 <1428527516.22867.509.camel@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1428527516.22867.509.camel@freescale.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Scott Wood <scottwood@freescale.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

DQoNClJlZ2FyZHMsDQpJZ2FsIExpYmVybWFuLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IFdvb2QgU2NvdHQtQjA3NDIxDQo+IFNlbnQ6IFRodXJzZGF5LCBBcHJpbCAw
OSwgMjAxNSAxMjoxMiBBTQ0KPiBUbzogTGliZXJtYW4gSWdhbC1CMzE5NTANCj4gQ2M6IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0KPiBT
dWJqZWN0OiBSZTogW3YyXSBkdC9iaW5kaW5nczogcW9yaXEtY2xvY2s6IEFkZCBiaW5kaW5nIGZv
ciBGTWFuIGNsb2NrIG11eA0KPiANCj4gT24gV2VkLCAyMDE1LTA0LTA4IGF0IDEwOjQzICswMzAw
LCBJZ2FsLkxpYmVybWFuIHdyb3RlOg0KPiA+IEBAIC03Niw2ICs3Nyw1MiBAQCBSZXF1aXJlZCBw
cm9wZXJ0aWVzOg0KPiA+DQo+ID4gIFJlY29tbWVuZGVkIHByb3BlcnRpZXM6DQo+ID4gIC0gY2xv
Y2tzOiBTaG91bGQgYmUgdGhlIHBoYW5kbGUgb2YgaW5wdXQgcGFyZW50IGNsb2NrDQo+ID4gKwlG
b3IgImZzbCxmbWFuLWNsay1tdXgiIGNsb2NrIHRoZXJlIGFyZSBzZXZlcmFsIG9wdGlvbnMgZm9y
IHBhcmVudA0KPiA+ICsJY2xvY2sgKGNsb2NrIHByb3ZpZGVyKSwgdGhlIHBhcmVudCBpcyBkZXRl
cm1pbmVkIGFjY29yZGluZyB0byB0aGUNCj4gPiArCVJlc2V0IENvbmZpZ3VyYXRpb24gV29yZCBv
ZiB0aGUgc3BlY2lmaWMgZGV2aWNlOg0KPiA+ICsJCSogUDIwNDEsIFAzMDQxOg0KPiA+ICsJCQkq
IDAgLSBlcXVhbCB0byBwbGF0Zm9ybSBQTEwgZGl2aWRlZCBieSAyDQo+ID4gKwkJCSogMSAtIGVx
dWFsIHRvIFBMTDIgZGl2aWRlZCBieSAyDQo+ID4gKwkJKiBQNDA4MCAoQm90aCBGTWFucyk6DQo+
ID4gKwkJCSogMCAtIGVxdWFsIHRvIHBsYXRmb3JtIFBMTCBkaXZpZGVkIGJ5IDINCj4gPiArCQkJ
KiAxIC0gZXF1YWwgdG8gUExMMyBkaXZpZGVkIGJ5IDINCj4gLi4uDQo+IA0KPiANCj4gQWdhaW4s
IHRoZSBjbG9jayBzcGVjaWZpZXIgZm9ybWF0IGlzIGRldGVybWluZWQgYnkgdGhlIGNsb2NrIHBy
b3ZpZGVyLCBub3QgdGhlDQo+IGNsb2NrIGNvbnN1bWVyLg0KPiANCg0KU2NvdHQsDQpUaGUgImNs
b2NrcyIgcHJvcGVydHkgY29udGFpbnMgYWxsIHBvc3NpYmxlIGNsb2NrIHByb3ZpZGVycywgcmln
aHQ/DQpJbiB0aGUgdGV4dCBhYm92ZSBJJ20gdHJ5aW5nIHRvIGV4cGxhaW4gaG93IHRoZSBGTWFu
IGNsb2NrIHByb3ZpZGVyIGlzIGRldGVybWluZWQgYW5kIHdoYXQgYXJlIHRoZSBvcHRpb25zIGZv
ciBlYWNoIFNvQy4NCkRvIHlvdSB0aGluayB0aGF0IHdlIHNob3VsZG4ndCBoYXZlIHRoaXMgZXhw
bGFuYXRpb24/IENhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZT8NCg0KSWdhbC4NCg0KPiAtU2NvdHQN
Cj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4cHBjLWRldiBtYWlsaW5nIGxpc3QKTGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKaHR0
cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2xpbnV4cHBjLWRldg==
