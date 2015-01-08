From: =?gb2312?B?UGV0ZXIgUGFuIMXLtrAgKHBldGVycGFuZG9uZyk=?=
	<peterpandong@micron.com>
Subject: RE: [PATCH 3/3] mtd: spi-nand: add devicetree binding
Date: Thu, 8 Jan 2015 05:04:24 +0000
Message-ID: <87F60714EC601C4C83DFF1D2E3D390A04AB4EA@NTXXIAMBX02.xacn.micron.com>
References: <87F60714EC601C4C83DFF1D2E3D390A04AB425@NTXXIAMBX02.xacn.micron.com>
 <54ADF66F.7090400@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54ADF66F.7090400@imgtec.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?gb2312?B?UWkgV2FuZyDN9cbwIChxaXdhbmcp?= <qiwang@micron.com>, =?gb2312?B?RnJhbmsgTGl1IMH1yLogKGZyYW5rbGl1KQ==?= <frankliu@micron.com>, =?gb2312?B?TWVsYW5pZSBaaGFuZyDVxdHgIChtZWxhbmllemhhbmcp?= <melaniezhang@micron.com>
List-Id: devicetree@vger.kernel.org

PiA+IFRoaXMgY29tbWl0IGFkZHMgdGhlIGRldmljZXRyZWUgYmluZGluZyBkb2N1bWVudCB0aGF0
IHNwZWNpZmllcyB0aGUNCj4gPiBzcGkgbmFuZCBkZXZpY2VzIHN1cHBvcnQuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBQZXRlciBQYW4gPHBldGVycGFuZG9uZ0BtaWNyb24uY29tPg0KPiA+IC0t
LQ0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3NwaS1uYW5kLnR4
dCB8IDIyDQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIy
IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BpLQ0KPiBuYW5kLnR4dA0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvc3BpLW5hbmQudHh0DQo+
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9zcGktbmFuZC50eHQNCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAuLjlkZDNlZmQNCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9zcGktbmFuZC50eHQNCj4gPiBAQCAtMCwwICsxLDIyIEBADQo+ID4gKyogTkFORCBkcml2
ZXIgZm9yIE1UMjlGLCBHRDVGIGFuZCBzaW1pbGFyIFNQSSBOQU5EIGZsYXNoIGNoaXBzDQo+ID4g
Kw0KPiA+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiA+ICstICNhZGRyZXNzLWNlbGxzLCAjc2l6
ZS1jZWxscyA6IE11c3QgYmUgcHJlc2VudCBpZiB0aGUgZGV2aWNlIGhhcw0KPiBzdWItbm9kZXMN
Cj4gPiArICByZXByZXNlbnRpbmcgcGFydGl0aW9ucy4NCj4gPiArLSBjb21wYXRpYmxlIDogU2hv
dWxkIGJlIHRoZSBtYW51ZmFjdHVyZXIgYW5kIHRoZSBuYW1lIG9mIHRoZSBjaGlwLg0KPiBCZWFy
IGluIG1pbmQNCj4gPg0KPiANCj4gVW5sZXNzIEknbSBtaXN0YWtlbiwgd2UgZG9uJ3QgbmVlZCB0
aGUgY2hpcCBJRCBoZXJlLCBhcyBTUEkgTkFORCBhbGxvd3MNCj4gdG8gYXV0b2RldGVjdCB0aGUg
ZGV2aWNlLiBBbnkgcmVhc29uIHdoeSB3ZSBjYW4ndCBqdXN0IHVzZSBhIGdlbmVyaWMNCj4gY29t
cGF0aWJsZSAic3BpLW5hbmQiIGhlcmU/DQo+IC0tDQo+IEV6ZXF1aWVsDQoNCkluIGZhY3QsIEkg
ZG9uJ3Qga25vdyBob3cgdG8gYXV0b2RldGVjdCB0aGUgU1BJIE5BTkQgZGV2aWNlLiBNaWNyb24g
ZGV2aWNlIGFuZA0KR2lnYWRldmljZSBkZXZpY2UgaGF2ZSBkaWZmZXJlbnQgcmVhZCBJRCBmdW5j
dGlvbnMuIFRoZSBDaGlwIElEIGhlcmUgaXMgdXNlZCB0bw0KZGV0ZXJtaW5lIHdoaWNoIGZ1bmN0
aW9uIHRvIHVzZS4NCg0KDQpQZXRlciBQYW4NCg0K
