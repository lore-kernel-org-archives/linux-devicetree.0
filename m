From: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: Re: [PATCH v2 6/8] PCI: al: Add support for DW based driver type
Date: Mon, 22 Jul 2019 15:38:46 +0000
Message-ID: <27d8e8a8bba4aeb845d6c953f3a07a29875fef02.camel@amazon.com>
References: <20190718094531.21423-1-jonnyc@amazon.com>
         <20190718094718.25083-2-jonnyc@amazon.com>
         <DM6PR12MB4010913E5408349A600762CADACB0@DM6PR12MB4010.namprd12.prod.outlook.com>
         <d323007c6bf14cb9f90a497a26b66dac151164fc.camel@amazon.com>
         <DM6PR12MB40101465C6D032B025473EFADAC40@DM6PR12MB4010.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DM6PR12MB40101465C6D032B025473EFADAC40@DM6PR12MB4010.namprd12.prod.outlook.com>
Content-Language: en-US
Content-ID: <BEE06177C9B70F46A85B8E622B3F6BA5@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "Gustavo.Pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "Hanoch, Uri" <hanochu@amazon.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Wasserstrom, Barak" <barakw@amazon.com>, "Saidi, Ali" <alisaidi@amazon.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "Shenhar, Talel" <talel@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "Chocron, Jonathan" <jonnyc@amazon.com>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDE5LTA3LTIyIGF0IDA4OjU0ICswMDAwLCBHdXN0YXZvIFBpbWVudGVsIHdyb3Rl
Og0KPiANCj4gPiANCj4gPiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhbF9wY2llX3RhcmdldF9i
dXNfc2V0KHN0cnVjdCBhbF9wY2llDQo+ID4gPiA+ICpwY2llLA0KPiA+ID4gPiArCQkJCQkgIHU4
IHRhcmdldF9idXMsDQo+ID4gPiA+ICsJCQkJCSAgdTggbWFza190YXJnZXRfYnVzKQ0KPiA+ID4g
PiArew0KPiA+ID4gPiArCXZvaWQgX19pb21lbSAqY2ZnX2NvbnRyb2xfYWRkcjsNCj4gPiA+ID4g
Kwl1MzIgcmVnOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmVnID0gRklFTERfUFJFUChDRkdfVEFS
R0VUX0JVU19NQVNLX01BU0ssDQo+ID4gPiA+IG1hc2tfdGFyZ2V0X2J1cykgfA0KPiA+ID4gPiAr
CSAgICAgIEZJRUxEX1BSRVAoQ0ZHX1RBUkdFVF9CVVNfQlVTTlVNX01BU0ssDQo+ID4gPiA+IHRh
cmdldF9idXMpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJY2ZnX2NvbnRyb2xfYWRkciA9ICh2b2lk
IF9faW9tZW0gKikoKHVpbnRwdHJfdClwY2llLQ0KPiA+ID4gPiA+IGNvbnRyb2xsZXJfYmFzZSAr
DQo+ID4gPiA+IA0KPiA+ID4gPiArCQkJICAgQVhJX0JBU0VfT0ZGU0VUICsgcGNpZS0NCj4gPiA+
ID4gPnJlZ19vZmZzZXRzLm9iX2N0cmwNCj4gPiA+ID4gKw0KPiA+ID4gPiArCQkJICAgQ0ZHX1RB
UkdFVF9CVVMpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJd3JpdGVsKHJlZywgY2ZnX2NvbnRyb2xf
YWRkcik7DQo+ID4gPiANCj4gPiA+IEZyb20gd2hhdCBJJ20gc2VlaW5nIHlvdSBjb21tb25seSB1
c2Ugd3JpdGVsKCkgYW5kIHJlYWRsKCkgd2l0aCBhDQo+ID4gPiBjb21tb24gDQo+ID4gPiBiYXNl
IGFkZHJlc3MsIHN1Y2ggYXMgcGNpZS0+Y29udHJvbGxlcl9iYXNlICsgQVhJX0JBU0VfT0ZGU0VU
Lg0KPiA+ID4gSSdkIHN1Z2dlc3QgdG8gY3JlYXRpbmcgYSB3cml0ZWwgYW5kIHJlYWRsIHdpdGgg
dGhhdCBvZmZzZXQNCj4gPiA+IGJ1aWx0LWluLg0KPiA+ID4gDQo+ID4gDQo+ID4gSSBwcmVmZXIg
dG8ga2VlcCBpdCBnZW5lcmljLCBzaW5jZSBpbiBmdXR1cmUgcmV2aXNpb25zIHdlIG1pZ2h0DQo+
ID4gd2FudCB0bw0KPiA+IGFjY2VzcyByZWdzIHdoaWNoIGFyZSBub3QgaW4gdGhlIEFYSSByZWdp
b24uIFlvdSB0aGluayBJIHNob3VsZCBhZGQNCj4gPiB3cmFwcGVycyB3aGljaCBzaW1wbHkgaGlk
ZSB0aGUgcGNpZS0+Y29udHJvbGxlcl9iYXNlIHBhcnQ/DQo+IA0KPiBJIGFuZCBvdGhlciBkZXZl
bG9wZXJzIHR5cGljYWxseSBkbyB0aGF0LCBidXQgaXQncyBhIHN1Z2dlc3Rpb24uIElNSE8NCj4g
aXQgDQo+IGhlbHBzIHRvIGtlZXAgdGhlIGNvZGUgY2xlYW5lciBhbmQgbW9yZSByZWFkYWJsZS4N
Cj4gDQoNCkFkZGVkIGFsX3BjaWVfY29udHJvbGxlcl9yZWFkbC93cml0ZWwgd3JhcHBlcnMuDQoN
Ci0tIA0KVGhhbmtzLA0KICAgSm9uYXRoYW4NCg==
