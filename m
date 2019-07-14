From: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: Re: [PATCH 3/8] PCI/VPD: Add VPD release quirk for Amazon Annapurna
 Labs host bridge
Date: Sun, 14 Jul 2019 15:08:24 +0000
Message-ID: <233cb293d7bc572bee5c206732a6f374daa9609e.camel@amazon.com>
References: <20190710164519.17883-1-jonnyc@amazon.com>
         <20190710164519.17883-4-jonnyc@amazon.com>
         <20190712131008.GC46935@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712131008.GC46935@google.com>
Content-Language: en-US
Content-ID: <A137BBB720212B4694F0CA46235CC196@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "helgaas@kernel.org" <helgaas@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "Woodhouse, David" <dwmw@amazon.co.uk>, "Hanoch, Uri" <hanochu@amazon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "Wasserstrom, Barak" <barakw@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "Shenhar, Talel" <talel@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCAyMDE5LTA3LTEyIGF0IDA4OjEwIC0wNTAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOg0K
PiBPbiBUaHUsIEp1bCAxMSwgMjAxOSBhdCAwNTo1NTo1NlBNICswMzAwLCBKb25hdGhhbiBDaG9j
cm9uIHdyb3RlOg0KPiA+IFRoZSBBbWF6b24gQW5uYXB1cm5hIExhYnMgcGNpZSBob3N0IGJyaWRn
ZSBleHBvc2VzIHRoZSBWUEQNCj4gPiBjYXBhYmlsaXR5LA0KPiA+IGJ1dCB0aGVyZSBpcyBubyBh
Y3R1YWwgc3VwcG9ydCBmb3IgaXQuDQo+IA0KPiBzL3BjaWUvUENJZS8NCj4gcy9ob3N0IGJyaWRn
ZS9Sb290IFBvcnQvDQpBY2suDQoNCj4gDQo+ID4gVGhlIHJlYXNvbiBmb3Igbm90IHVzaW5nIHRo
ZSBhbHJlYWR5IGV4aXN0aW5nIHF1aXJrX2JsYWNrbGlzdF92cGQoKQ0KPiA+IGlzIHRoYXQsIGFs
dGhvdWdoIHRoaXMgZmFpbHMgcGNpX3ZwZF9yZWFkL3dyaXRlLCB0aGUgJ3ZwZCcgc3lzZnMNCj4g
PiBlbnRyeSBzdGlsbCBleGlzdHMuIFdoZW4gcnVubmluZyBsc3BjaSAtdnYsIGZvciBleGFtcGxl
LCB0aGlzDQo+ID4gcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nIGVycm9yOg0KPiA+IA0KPiA+IHBj
aWxpYjogc3lzZnNfcmVhZF92cGQ6IHJlYWQgZmFpbGVkOiBJbnB1dC9vdXRwdXQgZXJyb3INCj4g
PiANCj4gPiBUaGlzIHF1aXJrIHJlbW92ZXMgdGhlIHN5c2ZzIGVudHJ5LCB3aGljaCBhdm9pZHMg
dGhlIGVycm9yIHByaW50Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIENob2Ny
b24gPGpvbm55Y0BhbWF6b24uY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3BjaS92cGQuYyB8
IDEyICsrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS92cGQuYyBiL2RyaXZlcnMvcGNpL3Zw
ZC5jDQo+ID4gaW5kZXggNDk2M2MyZTJiZDRjLi5iNTk0YjI4OTVmZmUgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9wY2kvdnBkLmMNCj4gPiArKysgYi9kcml2ZXJzL3BjaS92cGQuYw0KPiA+IEBA
IC02NDQsNCArNjQ0LDE2IEBAIHN0YXRpYyB2b2lkIHF1aXJrX2NoZWxzaW9fZXh0ZW5kX3ZwZChz
dHJ1Y3QNCj4gPiBwY2lfZGV2ICpkZXYpDQo+ID4gIERFQ0xBUkVfUENJX0ZJWFVQX0ZJTkFMKFBD
SV9WRU5ET1JfSURfQ0hFTFNJTywgUENJX0FOWV9JRCwNCj4gPiAgCQkJcXVpcmtfY2hlbHNpb19l
eHRlbmRfdnBkKTsNCj4gPiAgDQo+ID4gK3N0YXRpYyB2b2lkIHF1aXJrX2FsX3ZwZF9yZWxlYXNl
KHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+ID4gK3sNCj4gPiArCWlmIChkZXYtPnZwZCkgew0KPiA+
ICsJCXBjaV92cGRfcmVsZWFzZShkZXYpOw0KPiA+ICsJCWRldi0+dnBkID0gTlVMTDsNCj4gPiAr
CQlwY2lfd2FybihkZXYsIEZXX0JVRyAiQW5uYXB1cm5hIExhYnMgcGNpZSBxdWlyayAtDQo+ID4g
UmVsZWFzaW5nIFZQRCBjYXBhYmlsaXR5IChObyBzdXBwb3J0IGZvciBWUEQgcmVhZC93cml0ZQ0K
PiA+IHRyYW5zYWN0aW9ucylcbiIpOw0KPiANCj4gVGhlICJBbm5hcHVybmEgTGFicyBwY2llIHF1
aXJrIiB0ZXh0IGlzIHN1cGVyZmx1b3VzLg0KPiANCkFjay4NCg0KPiA+ICsJfQ0KPiA+ICt9DQo+
ID4gKw0KPiA+ICtERUNMQVJFX1BDSV9GSVhVUF9DTEFTU19GSU5BTChQQ0lfVkVORE9SX0lEX0FN
QVpPTl9BTk5BUFVSTkFfTEFCUywNCj4gPiAweDAwMzEsDQo+ID4gKwkJCSAgICAgIFBDSV9DTEFT
U19CUklER0VfUENJLCA4LA0KPiA+IHF1aXJrX2FsX3ZwZF9yZWxlYXNlKTsNCj4gDQo+IFdoeSBE
RUNMQVJFX1BDSV9GSVhVUF9DTEFTU19GSU5BTCgpPyAgU2VlIGNvbW1lbnRzIG9uIHRoZSBNU0kt
WCBxdWlyaw0KPiBwYXRjaC4NCj4gDQpSZXNwb25kZWQgaW4gdGhlIE1TSS14IHF1aXJrIHBhdGNo
LCBidXQgaW4gc2hvcnQsIGluZGVlZCB0aGUgMHgwMDMxDQpkZXYtaWQgaXMgcmUtdXNlZCBmb3Ig
YSBub24taG9zdCBicmlkZ2UgZGV2aWNlIDooDQoNCj4gPiArDQo+ID4gICNlbmRpZg0KPiA+IC0t
IA0KPiA+IDIuMTcuMQ0KPiA+IA0KPiA+IA0K
