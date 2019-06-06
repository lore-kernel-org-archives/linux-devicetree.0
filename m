From: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [RESEND][PATCH v3 1/2] usb: dwc3: Add avoiding vbus glitch happen
 during xhci reset
Date: Thu, 6 Jun 2019 08:20:03 +0000
Message-ID: <AM5PR0402MB2865979E26017BC5937DBBA5F1170@AM5PR0402MB2865.eurprd04.prod.outlook.com>
References: <20190606025418.26313-1-ran.wang_1@nxp.com>
 <78eb1558-b8d4-0632-ad0c-4144c711d2da@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <78eb1558-b8d4-0632-ad0c-4144c711d2da@cogentembedded.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, Yang Li <pku.leo@gmail.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgU2VyZ2VpLA0KDQpPbiBUaHVyc2RheSwgSnVuZSAwNiwgMjAxOSAxNjoxNyBTZXJnZWkgU2h0
eWx5b3Ygd3JvdGU6DQo+IA0KPiBIZWxsbyENCj4gDQo+IE9uIDA2LjA2LjIwMTkgNTo1NCwgUmFu
IFdhbmcgd3JvdGU6DQo+IA0KPiA+IFdoZW4gRFdDMyBpcyBzZXQgdG8gaG9zdCBtb2RlIGJ5IHBy
b2dyYW1taW5nIHJlZ2lzdGVyIERXQzNfR0NUTCwgVkJVUw0KPiA+IChvciBpdHMgY29udHJvbCBz
aWduYWwpIHdpbGwgdHVybiBvbiBpbW1lZGlhdGVseSBvbiByZWxhdGVkIFJvb3QgSHViDQo+ID4g
cG9ydHMuIFRoZW4gdGhlIFZCVVMgd2lsbCBiZSBkZS1hc3NlcnRlZCBmb3IgYSBsaXR0bGUgd2hp
bGUgZHVyaW5nDQo+ID4geGhjaSByZXNldCAoY29uZHVjdGVkIGJ5IHhoY2kgZHJpdmVyKSBmb3Ig
YSBsaXR0bGUgd2hpbGUgYW5kIGJhY2sgdG8gbm9ybWFsLg0KPiA+DQo+ID4gVGhpcyBWQlVTIGds
aXRjaCBtaWdodCBjYXVzZSBzb21lIFVTQiBkZXZpY2VzIGVtdXJhdGlvbiBmYWlsIGlmIGtlcm5l
bA0KPiANCj4gICAgIEVudW1lcmF0aW9uLiA6LSkNCg0KVGhhbmtzLCB3aWxsIGNvcnJlY3QgaXQg
aW4gbmV4dCB2ZXJzaW9uDQogDQpSZWdhcmRzLA0KUmFuDQoNCj4gPiBib290IHdpdGggdGhlbSBj
b25uZWN0ZWQuIE9uZSBTVyB3b3JrYXJvdW5kIHdoaWNoIGNhbiBmaXggdGhpcyBpcyB0bw0KPiA+
IHByb2dyYW0gYWxsIFBPUlRTQ1tQUF0gdG8gMCB0byB0dXJuIG9mZiBWQlVTIGltbWVkaWF0ZWx5
IGFmdGVyIHNldHRpbmcNCj4gPiBob3N0IG1vZGUgaW4gRFdDMyBkcml2ZXIocGVyIHNpZ25hbCBt
ZWFzdXJlbWVudCByZXN1bHQsIGl0IHdpbGwgYmUgdG9vDQo+ID4gbGF0ZSB0byBkbyBpdCBpbiB4
aGNpLXBsYXQuYyBvciB4aGNpLmMpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUmFuIFdhbmcg
PHJhbi53YW5nXzFAbnhwLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4NCj4gWy4uLl0NCj4gDQo+IE1CUiwgU2VyZ2VpDQo=
