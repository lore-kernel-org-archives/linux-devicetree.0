From: Trent Piepho <tpiepho@impinj.com>
Subject: Re: [PATCH 1/2] net: phy: dp83867: Add documentation for SGMII mode
 type
Date: Thu, 5 Sep 2019 17:06:17 +0000
Message-ID: <1567703176.6344.4.camel@impinj.com>
References: <1567700761-14195-1-git-send-email-vitaly.gaiduk@cloudbear.ru>
         <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567700761-14195-2-git-send-email-vitaly.gaiduk@cloudbear.ru>
Content-Language: en-US
Content-ID: <A5BA510434E86445A2548D318A9B8682@namprd06.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "vitaly.gaiduk@cloudbear.ru" <vitaly.gaiduk@cloudbear.ru>, "davem@davemloft.net" <davem@davemloft.net>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE5LTA5LTA1IGF0IDE5OjI2ICswMzAwLCBWaXRhbHkgR2FpZHVrIHdyb3RlOg0K
PiBBZGQgZG9jdW1lbnRhdGlvbiBvZiB0aSxzZ21paS10eXBlIHdoaWNoIGNhbiBiZSB1c2VkIHRv
IHNlbGVjdA0KPiBTR01JSSBtb2RlIHR5cGUgKDQgb3IgNi13aXJlKS4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFZpdGFseSBHYWlkdWsgPHZpdGFseS5nYWlkdWtAY2xvdWRiZWFyLnJ1Pg0KPiAtLS0N
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvdGksZHA4Mzg2Ny50eHQg
fCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvdGksZHA4Mzg2Ny50eHQg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3RpLGRwODM4NjcudHh0DQo+
IGluZGV4IGRiNmFhM2YyMjE1Yi4uMThlN2ZkNTI4OTdmIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3RpLGRwODM4NjcudHh0DQo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvdGksZHA4Mzg2Ny50eHQNCj4gQEAg
LTM3LDYgKzM3LDcgQEAgT3B0aW9uYWwgcHJvcGVydHk6DQo+ICAJCQkgICAgICBmb3IgYXBwbGlj
YWJsZSB2YWx1ZXMuICBUaGUgQ0xLX09VVCBwaW4gY2FuIGFsc28NCj4gIAkJCSAgICAgIGJlIGRp
c2FibGVkIGJ5IHRoaXMgcHJvcGVydHkuICBXaGVuIG9taXR0ZWQsIHRoZQ0KPiAgCQkJICAgICAg
UEhZJ3MgZGVmYXVsdCB3aWxsIGJlIGxlZnQgYXMgaXMuDQo+ICsJLSB0aSxzZ21paS10eXBlIC0g
VGhpcyBkZW5vdGVzIHRoZSBmYWN0IHdoaWNoIFNHTUlJIG1vZGUgaXMgdXNlZCAoNCBvciA2LXdp
cmUpLg0KDQpSZWFsbHkgc2hvdWxkIGV4cGxhaW4gd2hhdCBraW5kIG9mIHZhbHVlIGl0IGlzIGFu
ZCB3aGF0IHRoZSB2YWx1ZXMNCm1lYW4uICBJLmUuLCBzaG91bGQgdGhpcyBiZSB0aSxzZ2ltaWkt
dHlwZSA9IDw0PiB0byBzZWxlY3QgNCB3aXJlPw0KDQpNYXliZSBhIGJvb2xlYW4sICJzZ21paS1j
bG9jayIsIHRvIGluZGljYXRlIHRoZSBwcmVzZW5jZSBvZiBzZ21paSByeA0KY2xvY2sgbGluZXMs
IHdvdWxkIG1ha2UgbW9yZSBzZW5zZT8NCg0KSSBhbHNvIHdvbmRlciBpZiBwaHktbW9kZSA9ICJz
Z21paS1jbGsiIG9yICJzZ21paS02d2lyZSIsIHZzIHRoZQ0KZXhpc3RpbmcgcGh5LW1vZGUgPSAi
c2dtaWkiLCBtaWdodCBhbHNvIGJlIGEgYmV0dGVyIHdheSB0byBkZXNjcmliZQ0KdGhpcyBpbnN0
ZWFkIG9mIGEgbmV3IHByb3BlcnR5Lg0K
