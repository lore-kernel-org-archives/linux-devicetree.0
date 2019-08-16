From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Subject: Re: [PATCH v4 11/14] net: phy: adin: implement Energy Detect
 Powerdown mode
Date: Fri, 16 Aug 2019 06:09:49 +0000
Message-ID: <f5d3dc7e4e919427e82ccb637bd757393296047a.camel@analog.com>
References: <20190812112350.15242-1-alexandru.ardelean@analog.com>
         <20190812112350.15242-12-alexandru.ardelean@analog.com>
         <f13feaee-0bad-a774-5527-296b6f74c91b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f13feaee-0bad-a774-5527-296b6f74c91b@gmail.com>
Content-Language: en-US
Content-ID: <AC1D4EDC47E24F4488C47E4AF165016E@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCAyMDE5LTA4LTE0IGF0IDEwOjU3IC0wNzAwLCBGbG9yaWFuIEZhaW5lbGxpIHdyb3Rl
Og0KPiBbRXh0ZXJuYWxdDQo+IA0KPiANCj4gDQo+IE9uIDgvMTIvMjAxOSA0OjIzIEFNLCBBbGV4
YW5kcnUgQXJkZWxlYW4gd3JvdGU6DQo+ID4gVGhlIEFESU4gUEhZcyBzdXBwb3J0IEVuZXJneSBE
ZXRlY3QgUG93ZXJkb3duIG1vZGUsIHdoaWNoIHB1dHMgdGhlIFBIWSBpbnRvDQo+ID4gYSBsb3cg
cG93ZXIgbW9kZSB3aGVuIHRoZXJlIGlzIG5vIHNpZ25hbCBvbiB0aGUgd2lyZSAodHlwaWNhbGx5
IGNhYmxlDQo+ID4gdW5wbHVnZ2VkKS4NCj4gPiBUaGlzIGJlaGF2aW9yIGlzIGVuYWJsZWQgYnkg
ZGVmYXVsdCwgYnV0IGNhbiBiZSBkaXNhYmxlZCB2aWEgZGV2aWNlDQo+ID4gcHJvcGVydHkuDQo+
IA0KPiBXZSBjb3VsZCBjb25zaWRlciBhZGRpbmcgYSBQSFkgdHVuYWJsZSwgaGF2aW5nIHRoaXMg
YXMgYSBEZXZpY2UgVHJlZQ0KPiBwcm9wZXJ0eSBhbW91bnRzIHRvIHB1dHRpbmcgYSBwb2xpY3kg
aW5zaWRlIERULCB3aGljaCBpcyBmcm93bmVkIHVwb24uDQoNClRoYXQgd291bGQgYmUgaW50ZXJl
c3RpbmcgYWN0dWFsbHksIGFuZCBJIHdvdWxkIGFsc28gcHJlZmVyIGl0IG92ZXIgc3RhdGljIERU
Lg0KTWF5YmUgZm9yIHRoaXMgcGF0Y2gsIEknbGwganVzdCBlbmFibGUgRURQRCBieSBkZWZhdWx0
IGFuZCBzZWUgYWJvdXQgYSB0dW5hIG9wdGlvbi4NCg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kcnUgQXJkZWxlYW4gPGFsZXhhbmRydS5hcmRlbGVhbkBhbmFsb2cuY29tPg0KPiANCj4g
T3RoZXIgdGhhbiB0aGF0LCB0aGUgY29kZSBsb29rcyBmaW5lOg0KPiANCj4gUmV2aWV3ZWQtYnk6
IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPg0K
