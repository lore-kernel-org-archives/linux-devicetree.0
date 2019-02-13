From: Trent Piepho <tpiepho@impinj.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add DMA properties for ECSPI
Date: Wed, 13 Feb 2019 01:10:03 +0000
Message-ID: <1550020202.3075.135.camel@impinj.com>
References: <20190107132226.16216-1-stefan@agner.ch>
         <20190107132226.16216-2-stefan@agner.ch>
         <1549573243.3075.72.camel@impinj.com> <20190211012305.GA21496@dragon>
         <1549916056.3075.102.camel@impinj.com>
         <CAOMZO5BrTLyg7Q51tPcHbN8S2VmA4HAENOVzNhw+Yx7Nniz3Gg@mail.gmail.com>
         <1549923727.3075.103.camel@impinj.com>
         <CAOMZO5Ccovx2hMU0SmPm9ToZDNXOdLWkoQ8QT7EOhLocL7GAEQ@mail.gmail.com>
         <1550016436.3075.127.camel@impinj.com>
         <CAOMZO5Ctp_p=j1G1DCaPxsyjWTK8dtKR9Ov59XGxYdiqE+1c2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5Ctp_p=j1G1DCaPxsyjWTK8dtKR9Ov59XGxYdiqE+1c2g@mail.gmail.com>
Content-Language: en-US
Content-ID: <621C6364E9CB144487460B453BFA5A37@namprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "festevam@gmail.com" <festevam@gmail.com>
Cc: "linux-imx@nxp.com" <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDE5LTAyLTEyIGF0IDIyOjU3IC0wMjAwLCBGYWJpbyBFc3RldmFtIHdyb3RlOg0K
PiBPbiBUdWUsIEZlYiAxMiwgMjAxOSBhdCAxMDowNyBQTSBUcmVudCBQaWVwaG8gPHRwaWVwaG9A
aW1waW5qLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IFRyaWVkIFNETUEgZmlybXdhcmUgNC4yLiAg
U3RpbGwgYnJva2VuLiAgTm8gYXBwYXJlbnQgY2hhbmdlLg0KPiA+IA0KPiA+IEdldCA0IGN5Y2xl
IHBhdXNlIGFmdGVyIGVhY2ggYnl0ZS4NCj4gPiANCj4gPiBBbmQgY3Jhc2ggd2hpbGUvYWZ0ZXIg
dXNpbmcgRE1BLiAgQ2xlYXJseSBzb21lIHNvcnQgb2YgbWVtb3J5DQo+ID4gY29ycnVwdGlvbiBn
b2luZyBvbi4gIEZvcnR1bmF0ZWx5LCBpdCdzIHZlcnkgcmVsaWFibGUgdGhhdCB1c2luZw0KPiA+
IERNQQ0KPiA+IGFsbW9zdCBpbW1lZGlhdGVseSBjYXVzZXMgYSBwcm9ibGVtIGFuZCB0aGlzIGlz
IGVhc3kgdG8NCj4gPiByZXByb2R1Y2UuICBJDQo+ID4gdGhpbmsgdGhhdCBpbmRpY2F0ZXMgaXQn
cyBlaXRoZXIgY2xvYmJlcnMgYSBsb3Qgb2YgUkFNLCBvcg0KPiA+IGNvbnNpc3RlbnRseQ0KPiA+
IG1hbmFnZXMgdG8gaGl0IGEgdmVyeSBpbXBvcnRhbnQgbG9jYXRpb24gZm9yIGtlcm5lbCBtZW1v
cnkNCj4gPiBhbGxvY2F0b3JzLg0KPiA+IA0KPiA+IEkndmUgZ290IGFuIGlkZWEgb2Ygd2hlcmUg
dGhhdCBtaWdodCBiZSBoYXBwZW5pbmcgdGhhdCBJJ20gbG9va2luZw0KPiA+IGludG8uDQo+IA0K
PiBPaywgdGhhbmtzIGZvciBpbnZlc3RpZ2F0aW5nIHRoaXMgaXNzdWUuDQo+IA0KPiA+IA0KPiA+
IEkgdGhpbmsgaXQncyByZWFzb25hYmxlIHRvIGFkZCB0aGUgZG1hIGF0dHJpYnV0ZXMsIGJ1dCBw
dXQgYSBjaGVjaw0KPiA+IGluDQo+ID4gdGhlIHNwaS1pbXggZHJpdmVyIHRvIGRpc2FibGUgRE1B
IG9uIGlteDdkIGF0IGxlYXN0Lg0KPiANCj4gU29tZXRoaW5nIGxpa2UgdGhpcz8NCmh0dHA6Ly9k
YXJrLWNvZGUuYnVsaXgub3JnL3VyZm9oOC01ODAxNzQNCg0KU29tZXRoaW5nIGxpa2UgdGhhdC4g
IEkgdGhvdWdodCBhIHByaW50ayBvbiBwcm9iZSwgdGhhdCBETUEgd2FzDQpkaXNhYmxlZCwgd291
bGQgYmUgbmljZSBzbyBubyBvbmUgYmVhdHMgdGhlaXIgaGVhZCBhZ2FpbnN0IHRoZSB3YWxsDQp0
cnlpbmcgdG8gZmlndXJlIG91dCB3aHkgRE1BIGlzbid0IGJlaW5nIHVzZWQuDQoNCkJ1dCBJIHRo
aW5rIEkndmUgZm91bmQgdGhlIGlzc3VlIGFuZCB0cmFja2VkIGl0IHRvIGJ1ZyBpbiB0aGUgc3Bp
IGNvcmUuDQogIEknbGwgc2VuZCBhIHBhdGNoIHNob3J0bHkuICBJdCBzaG91bGQgYWZmZWN0IGFu
eXRoaW5nIHRoYXQgdXNlcyBETUEsDQp3aXRoIGEgc3BpIG1hc3RlciB0aGF0IHJlcXVpcmVzIFJY
IGFuZC9vciBUWCBidWZmZXJzLCBhbmQgYSBzcGkNCnRyYW5zZmVyIHRoYXQgZG9lcyBub3QgcHJv
dmlkZSB0aGUgcmVxdWlyZSBidWZmZXIocykuICBJbiBteSBjYXNlLCBzcGktDQppbXggcmVxdWly
ZXMgYW4gUlggYnVmZmVyIGJ1dCBJIGFtIGRvaW5nIFRYIG9ubHkgRE1BLiAgVGhlIHNwaSBjb3Jl
DQp0YWtlcyBjYXJlIG9mIHRoaXMsIGJ1dCBJIHRoaW5rIHRoZXJlIGlzIGEgcmFjZSBpbiB0aGUg
Y2xlYW51cCBvZiB0aGUNCmR1bW15IFJYIERNQSBidWZmZXIuDQoNClRoaXMgYXBwZWFycyB0byBj
bG9iYmVyIHNvbWV0aGluZyByZWxhdGluZyB0byBETUEgYnVmZmVyIGFsbG9jYXRpb24gYW5kDQp0
aGUga2VybmVsIHN0YXJ0cyB0byBhbGxvY2F0ZSBib2d1cyBETUEgYnVmZmVyIGFkZHJlc3Nlcywg
YW5kIHRoZSBTUEkNCmNvbnRyb2xsZXIgaGFwcGlseSBETUFzIGFsbCBvdmVyIG1lbW9yeS4gIEkg
d29uZGVyIGlmIHRoYXQgY291bGQgYmUNCnNvbWVob3cgZXhwbG9pdGVkIHRvIHJlYWQvd3JpdGUg
YXJiaXRyYXJ5IG1lbW9yeSB2aWEgU1BJIERNQT8=
