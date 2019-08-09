From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Subject: Re: [PATCH v2 05/15] net: phy: adin: add {write,read}_mmd hooks
Date: Fri, 9 Aug 2019 12:05:07 +0000
Message-ID: <abd38b7cd509c6113f95d7a5e9361f5444dfb511.camel@analog.com>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
         <20190808123026.17382-6-alexandru.ardelean@analog.com>
         <20190808153514.GE27917@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190808153514.GE27917@lunn.ch>
Content-Language: en-US
Content-ID: <8D7967BC458B5F4EA45B9BEA392DD10C@analog.com>
Sender: netdev-owner@vger.kernel.org
To: "andrew@lunn.ch" <andrew@lunn.ch>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE5LTA4LTA4IGF0IDE3OjM1ICswMjAwLCBBbmRyZXcgTHVubiB3cm90ZToNCj4g
W0V4dGVybmFsXQ0KPiANCj4gT24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDM6MzA6MTZQTSArMDMw
MCwgQWxleGFuZHJ1IEFyZGVsZWFuIHdyb3RlOg0KPiA+IEJvdGggQURJTjEyMDAgJiBBRElOMTMw
MCBzdXBwb3J0IENsYXVzZSA0NSBhY2Nlc3MuDQo+ID4gVGhlIEV4dGVuZGVkIE1hbmFnZW1lbnQg
SW50ZXJmYWNlIChFTUkpIHJlZ2lzdGVycyBhcmUgYWNjZXNzaWJsZSB2aWEgYm90aA0KPiA+IENs
YXVzZSA0NSAoYXQgcmVnaXN0ZXIgTURJT19NTURfVkVORDEpIGFuZCB1c2luZyBDbGF1c2UgMjIu
DQo+ID4gDQo+ID4gSG93ZXZlciwgdGhlIENsYXVzZSAyMiBNTUQgYWNjZXNzIG9wZXJhdGlvbnMg
ZGlmZmVyIGZyb20gdGhlIGltcGxlbWVudGF0aW9uDQo+ID4gaW4gdGhlIGtlcm5lbCwgaW4gdGhl
IHNlbnNlIHRoYXQgaXQgdXNlcyByZWdpc3RlcnMgRXh0UmVnUHRyICgweDEwKSAmDQo+ID4gRXh0
UmVnRGF0YSAoMHgxMSkgdG8gYWNjZXNzIENsYXVzZSA0NSAmIEVNSSByZWdpc3RlcnMuDQo+IA0K
PiBJdCBpcyBub3QgdGhhdCB0aGV5IGRpZmZlciBmcm9tIHdoYXQgdGhlIGtlcm5lbCBzdXBwb3J0
cy4gSXRzIHRoYXQNCj4gdGhleSBkaWZmZXIgZnJvbSB3aGF0IHRoZSBTdGFuZGFyZCBzYXlzIHRo
ZXkgc2hvdWxkIHVzZS4gVGhlc2UNCj4gcmVnaXN0ZXJzIGFyZSBkZWZpbmVkIGluIDgwMi4zLCBw
YXJ0IG9mIEMyMiwgYW5kIHRoaXMgaGFyZHdhcmUNCj4gaW1wbGVtZW50cyB0aGUgc3RhbmRhcmQg
aW5jb3JyZWN0bHkuDQoNCldpbGwgdXBkYXRlIGNvbW1lbnQuDQpJIGRpZCBub3QgZmluZCBhIGRv
Y3VtZW50IGRlc2NyaWJpbmcgdGhpcyBhcyBhIHN0YW5kYXJkLg0KQnV0LCBJIGFkbWl0IEkgYW0g
dGVycmlibGUgd2hlbiBmaW5kaW5nIHNvbWUgZG9jcy4NCg0KSSBvbmx5IGZvdW5kIHRoaXMgcHJl
c2VudGF0aW9uIGZyb20gYSB3aGlsZSBiYWNrOg0KaHR0cDovL3d3dy5pZWVlODAyLm9yZy8zL2Vm
bS9wdWJsaWMvbm92MDIvb2FtL3Bhbm5lbGxfb2FtXzFfMTEwMi5wZGYNCg0KSXQgc2VlbWVkIG1v
cmUgbGlrZSBhIHByb3Bvc2FsLg0KDQpUaGFua3MNCkFsZXgNCg0KPiANCj4gCSAgIEFuZHJldw0K
