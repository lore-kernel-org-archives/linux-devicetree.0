From: Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] gpio: rcar: Add R8A7743 (RZ/G1M) support
Date: Mon, 19 Jun 2017 11:17:30 +0000
Message-ID: <KL1PR06MB170245DC49AB2DF041FC97E9B8C40@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <1497619944-61410-1-git-send-email-biju.das@bp.renesas.com>
 <d7242a3b-bf30-1683-29e0-90c847ce8eaf@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <d7242a3b-bf30-1683-29e0-90c847ce8eaf@cogentembedded.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBncGlvOiByY2FyOiBBZGQgUjhBNzc0MyAoUlovRzFNKSBz
dXBwb3J0DQo+DQo+IEhlbGxvIQ0KPg0KPiBPbiAwNi8xNi8yMDE3IDA0OjMyIFBNLCBCaWp1IERh
cyB3cm90ZToNCj4NCj4gPiBSZW5lc2FzIFJaL0cxTSAoUjhBNzc0MyBTb0MpIEdQSU8gYmxvY2tz
IGFyZSBpZGVudGljYWwgdG8gdGhlIFItQ2FyDQo+IEdlbjINCj4NCj4gICAgIFNvQyBzaG91bGQg
YmUgb3V0c2lkZSB0aGUgcGFyZW5zLg0KDQpUaGFua3MuIEkgd2lsbCBjb3JyZWN0IGl0Lg0KDQo+
DQo+ID4gZmFtaWx5LiBBZGQgc3VwcG9ydCBmb3IgaXRzIEdQSU8gY29udHJvbGxlcnMuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXNAYnAucmVuZXNhcy5jb20+DQo+
ID4gUmV2aWV3ZWQtYnk6IENocmlzIFBhdGVyc29uIDxjaHJpcy5wYXRlcnNvbjJAcmVuZXNhcy5j
b20+DQo+ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlv
L3JlbmVzYXMsZ3Bpby1yY2FyLnR4dCB8IDEgKw0KPiA+ICBkcml2ZXJzL2dwaW8vZ3Bpby1yY2Fy
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrKysNCj4gPiAgMiBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9yZW5lc2FzLGdwaW8tcmNhci50eHQN
Cj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9yZW5lc2FzLGdwaW8t
cmNhci50eHQNCj4gPiBpbmRleCA3YzFhYjNiLi4xY2MzY2ZlIDEwMDY0NA0KPiA+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3JlbmVzYXMsZ3Bpby1yY2FyLnR4
dA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3JlbmVz
YXMsZ3Bpby1yY2FyLnR4dA0KPiA+IEBAIC0zLDYgKzMsNyBAQA0KPiA+ICBSZXF1aXJlZCBQcm9w
ZXJ0aWVzOg0KPiA+DQo+ID4gICAgLSBjb21wYXRpYmxlOiBzaG91bGQgY29udGFpbiBvbmUgb2Yg
dGhlIGZvbGxvd2luZy4NCj4gPiArICAgIC0gInJlbmVzYXMsZ3Bpby1yOGE3NzQzIjogZm9yIFI4
QTc3NDMgKFJaLUcxTSkgY29tcGF0aWJsZSBHUElPDQo+IGNvbnRyb2xsZXIuDQo+DQo+ICAgICBO
b3QgUlovRzFNPw0KDQpJIHdpbGwgY2hhbmdlIHRoaXMgdG8gUlovRzFNIGFuZCB3aWxsIHB1c2gg
VjIuDQoNClJlZ2FyZHMsDQpCaWp1DQoNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBM
dGQsIER1a2VzIE1lYWRvdywgTWlsbGJvYXJkIFJvYWQsIEJvdXJuZSBFbmQsIEJ1Y2tpbmdoYW1z
aGlyZSwgU0w4IDVGSCwgVUsuIFJlZ2lzdGVyZWQgaW4gRW5nbGFuZCAmIFdhbGVzIHVuZGVyIFJl
Z2lzdGVyZWQgTm8uIDA0NTg2NzA5Lg0K
