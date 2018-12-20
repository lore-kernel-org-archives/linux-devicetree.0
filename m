From: Trent Piepho <tpiepho@impinj.com>
Subject: Re: [PATCH v3 3/3] PCI: imx6: Add support for i.MX8MQ
Date: Thu, 20 Dec 2018 01:22:51 +0000
Message-ID: <1545268969.22930.77.camel@impinj.com>
References: <20181218040702.29231-1-andrew.smirnov@gmail.com>
         <20181218040702.29231-4-andrew.smirnov@gmail.com>
         <20181218151533.GA2922@bogus>
         <VI1PR04MB5533533242C036C5CF6352BAEEBD0@VI1PR04MB5533.eurprd04.prod.outlook.com>
         <CAL_JsqJb24ZpM7qQfy_F7RUVEGyceBAXOndbZcTMh3a__k38UQ@mail.gmail.com>
         <CAHQ1cqEMxxo9JGN5be4XQWAtPz7nC2JyLCr3qasnD5QK7_hOYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHQ1cqEMxxo9JGN5be4XQWAtPz7nC2JyLCr3qasnD5QK7_hOYQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <F57C2BFF224B7843B60ABC715CD776CA@namprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>
Cc: "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>, "hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>, "cphealy@gmail.com" <cphealy@gmail.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "leonard.crestez@nxp.com" <leonard.crestez@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE4LTEyLTE5IGF0IDE2OjQ3IC0wODAwLCBBbmRyZXkgU21pcm5vdiB3cm90ZToN
Cj4gDQo+ID4gPiBUaGlzIHNlcmllcyBpbml0aWFsbHkgYWRkZWQgZXhwbGljaXQgb2Zmc2V0cyBi
dXQgSSBzdWdnZXN0ZWQgYSBzaW5nbGUNCj4gPiA+ICJjb250cm9sbGVyLWlkIiBiZWNhdXNlOg0K
PiA+ID4gICAqIFRoZXJlIGFyZSBtdWx0aXBsZSBiaXQgYW5kIGJ5dGUgb2Zmc2V0cw0KPiA+ID4g
ICAqIE90aGVyIGlteDggU09DcyBhbHNvIGhhdmUgMnggcGNpZSB3aXRoIG90aGVyIGJpdC9ieXRl
IG9mZnNldHMNCj4gPiA+IA0KPiA+ID4gSGlkaW5nIHRoaXMgYmVoaW5kIGEgY29tcGF0aWJsZSBz
dHJpbmcgYW5kIHNpbmdsZSAiY29udHJvbGxlci1pZCIgc2VlbQ0KPiA+ID4gcHJlZmVyYWJsZSB0
byBlbGFib3JhdGluZyByZWdpc3RlciBtYXBzIGluIGR0IGJpbmRpbmdzLiBJdCBhbHNvIG1ha2Vz
DQo+ID4gPiB1cGdyYWRlcyBzaW1wbGVyOiBpZiBmZWF0dXJlcyBhcmUgYWRkZWQgd2hpY2ggdXNl
IG90aGVyIGJpdHMgdGhlcmUgaXMgbm8NCj4gPiA+IG5lZWQgdG8gZGVzY3JpYmUgdGhlbSBpbiBE
VCBhbmQgZGVhbCB3aXRoIGNvbXBhdGliaWxpdHkgaGVhZGFjaGVzLg0KPiA+IA0KPiA+IFlvdSBh
bHJlYWR5IGhhdmUgYW4gaWQgZm9yIHRoZSBjb250cm9sbGVyczogdGhlIGFkZHJlc3MuIFVzZSB0
aGF0IGlmDQo+ID4geW91IGRvbid0IHdhbnQgdG8gcHV0IHRoZSByZWdpc3RlciBvZmZzZXRzIGlu
IERULg0KPiA+IA0KPiANCj4gTHVjYXMsIGFyZSB5b3Ugb24gYm9hcmQgd2l0aCB0aGlzPw0KDQpE
b2VzIGFkZHJlc3MgaGVyZSBtZWFuIHRoZSBhZGRyZXNzIGZyb20gdGhlIGNvbnRyb2xsZXIncyBy
ZWcgcHJvcGVydHk/DQogDQpIb3cgZG8geW91IG1hcCB0aGF0IGFkZHJlc3MgdG8gdGhlIGNvbnRy
b2xsZXIncyBpbmRleD8gIEEgZ2lhbnQgdGFibGUNCm9mIGV2ZXJ5IHNvYyBzbyB0aGUgc29jIHR5
cGUgcGx1cyBjb250cm9sbGVyIHJlZ2lzdGVyIGFkZHJlc3MgcGFpciB0aGFuDQpjYW4gYmUgbG9v
a2VkIHVwIGluIHRoZSBkcml2ZXI/DQoNCkkuZS4sIG9uIGlNWDhNUSB0aGUgY29udHJvbGxlciBh
dCAweDMzODAwMDAwIGlzIGNvbnRyb2xsZXIgMCBhbmQgc28gb24NCmZvciBldmVyeSBwb3NzaWJs
ZSBTb0MgYWRkcmVzcyBjb21iaW5hdGlvbj8NCg0KTm90IHJlYWxseSBhIGZhbiBvZiB0aGF0Lg0K
DQpUaGUgc2l0dWF0aW9uIGhlcmUgaXMgdGhhdCBzb21lIHJlZ2lzdGVycyBmb3IgdGhlc2UgY29u
dHJvbGxlcnMgYXJlDQppbnRlcmxlYXZlZCwgcmlnaHQ/ICBJLmUuLCB0aGVyZSdzIG9uZSByZWdp
c3RlciBzb21ld2hlcmUgd2hlcmUgYml0IDANCm1lYW5zIGVuYWJsZSBjb250cm9sbGVyIDAgYW5k
IGJpdCAxIG1lYW5zIGVuYWJsZSBjb250cm9sbGVyIDEgYW5kIHNvDQpvbi4NCg0KSXNuJ3QgY2Vs
bC1pbmRleCBhbHJlYWR5IHRoZSBzdGFuZGFyZCBkZXZpY2UgdHJlZSBwcm9wZXJ0eSBmb3IgdGhp
cw0Ka2luZCBvZiBzZXR1cD8NCg0KSSBrbm93IGNlbGwtaW5kZXggd2FzIGhpc3RvcmljYWxseSBh
bHNvIChhYil1c2VkIGluIGFuIGF0dGVtcHQgdG8NCnByb3ZpZGUgYSBmaXhlZCBrZXJuZWwgZGV2
aWNlIGVudW1lcmF0aW9uIG9yZGVyLCBzb21ldGhpbmcgbm93IGhhbmRsZWQNCmJldHRlciBieSBj
aG9zZW4gbm9kZSBhbGlhc2VzLg0KDQoNCg==
