From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Subject: Re: [RFC PATCH v2 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
Date: Thu, 21 Mar 2019 18:11:04 +0000
Message-ID: <f92362a0678b07d22ccc0f271fe3483dc77364a9.camel@infinera.com>
References: <20190321174548.9288-1-vigneshr@ti.com>
         <20190321174548.9288-2-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321174548.9288-2-vigneshr@ti.com>
Content-Language: en-US
Content-ID: <58BC4D51F4B1384CB30D55481DDC2F6C@namprd10.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "computersforpeace@gmail.com" <computersforpeace@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>, "richard@nod.at" <richard@nod.at>
Cc: "nsekhar@ti.com" <nsekhar@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "masonccyang@mxic.com.tw" <masonccyang@mxic.com.tw>, "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>, "sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arnd@arndb.de" <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE5LTAzLTIxIGF0IDIzOjE1ICswNTMwLCBWaWduZXNoIFJhZ2hhdmVuZHJhIHdy
b3RlOg0KPiANCj4gSHlwZXJGbGFzaCBkZXZpY2VzIGFyZSBjb21wbGlhbnQgd2l0aCBDRkkgQU1E
L0Z1aml0c3UgRXh0ZW5kZWQgQ29tbWFuZA0KPiBTZXQoMHgwMDAyKSBmb3IgZmxhc2ggb3BlcmF0
aW9ucywgdGhlcmVmb3JlIGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jDQo+IGNh
biBiZSB1c2UgYXMgaXMuIEJ1dCB0aGVzZSBkZXZpY2VzIGRvIG5vdCBzdXBwb3J0IERRIHBvbGxp
bmcgbWV0aG9kIG9mDQo+IGRldGVybWluaW5nIGNoaXAgcmVhZHkvZ29vZCBzdGF0dXMuIFRoZXNl
IGZsYXNoZXMgcHJvdmlkZSBTdGF0dXMNCj4gUmVnaXN0ZXIgd2hvc2UgYml0cyBjYW4gYmUgcG9s
bGVkIHRvIGtub3cgc3RhdHVzIG9mIGZsYXNoIG9wZXJhdGlvbi4NCj4gDQo+IEN5cHJlc3MgSHlw
ZXJGbGFzaCBkYXRhc2hlZXQgaGVyZVsxXSwgdGFsa3MgYWJvdXQgQ0ZJIEFtZC9GdWppdHN1DQo+
IEV4dGVuZGVkIFF1ZXJ5IHZlcnNpb24gMS41LiBCaXQgMCBvZiAiU29mdHdhcmUgRmVhdHVyZXMg
c3VwcG9ydGVkIiBmaWVsZA0KPiBvZiBDRkkgUHJpbWFyeSBWZW5kb3ItU3BlY2lmaWMgRXh0ZW5k
ZWQgUXVlcnkgdGFibGUgaW5kaWNhdGVzDQo+IHByZXNlbmNlL2Fic2VuY2Ugb2Ygc3RhdHVzIHJl
Z2lzdGVyIGFuZCBCaXQgMSBpbmRpY2F0ZXMgd2hldGhlciBvciBub3QNCj4gRFEgcG9sbGluZyBp
cyBzdXBwb3J0ZWQuIFVzaW5nIHRoZXNlIGJpdHMsIGl0cyBwb3NzaWJsZSB0byBkZXRlcm1pbmUN
Cj4gd2hldGhlciBmbGFzaCBzdXBwb3J0cyBEUSBwb2xsaW5nIG9yIG5lZWQgdG8gdXNlIFN0YXR1
cyBSZWdpc3Rlci4NCj4gDQo+IEFkZCBzdXBwb3J0IGZvciBwb2xsaW5nIHN0YXR1cyByZWdpc3Rl
ciB0byBrbm93IGRldmljZSByZWFkeS9zdGF0dXMgb2YNCj4gZXJhc2Uvd3JpdGUgb3BlcmF0aW9u
cyB3aGVuIERRIHBvbGxpbmcgaXMgbm90IHN1cHBvcnRlZC4NCg0KSXNuJ3QgdGhpcyBuZXcgU3Rh
dHVzIHNjaGVtZSBqdXN0IGEgY29weSBvZiBJbnRlbHMoY21kc2V0XzAwMDEpPw0KSWYgc28gSSB0
aGluayB0aGUgbmV3IHN0YXR1cyBpbXBsLiBpbiAwMDAyIHNob3VsZCBib3Jyb3cgZnJvbSAwMDAx
IGFzIHRoaXMgaXMgYQ0KaGFyZGVuZWQgYW5kIGJhdHRsZSB0ZXN0ZWQgaW1wbC4NCg0KSSBrbm93
IG90aGVyIG1vZGVybiAwMDAyIGNoaXBzIHN1cHBvcnRzIGJvdGggb2xkIGFuZCBuZXcgaW1wbC4g
b2YgU3RhdHVzIGFuZCBJIHdvcmxkDQpndWVzcyB0aGF0IHdlIHdpbGwgc2VlIG1vcmUgY2hpcHMg
d2l0aCBuZXcgU3RhdHVzIG9ubHkuDQoNCiBKb2NrZQ0K
