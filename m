From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Subject: Re: [PATCH v2 13/15] net: phy: adin: configure downshift on
 config_init
Date: Fri, 9 Aug 2019 12:06:00 +0000
Message-ID: <7c9e9cc9c8b1694a5641a60378a3b0d3a672ac4d.camel@analog.com>
References: <20190808123026.17382-1-alexandru.ardelean@analog.com>
         <20190808123026.17382-14-alexandru.ardelean@analog.com>
         <420c8e15-3361-a722-4ad1-3c448b1d3bc1@gmail.com>
         <20190808203932.GP27917@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808203932.GP27917@lunn.ch>
Content-Language: en-US
Content-ID: <BC713A5D76EBD948BE5C12C294848747@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>
Cc: "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCAyMDE5LTA4LTA4IGF0IDIyOjM5ICswMjAwLCBBbmRyZXcgTHVubiB3cm90ZToNCj4g
W0V4dGVybmFsXQ0KPiANCj4gT24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDk6Mzg6NDBQTSArMDIw
MCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOg0KPiA+IE9uIDA4LjA4LjIwMTkgMTQ6MzAsIEFsZXhh
bmRydSBBcmRlbGVhbiB3cm90ZToNCj4gPiA+IERvd24tc3BlZWQgYXV0by1uZWdvdGlhdGlvbiBt
YXkgbm90IGFsd2F5cyBiZSBlbmFibGVkLCBpbiB3aGljaCBjYXNlIHRoZQ0KPiA+ID4gUEhZIHdv
bid0IGRvd24tc2hpZnQgdG8gMTAwIG9yIDEwIGR1cmluZyBhdXRvLW5lZ290aWF0aW9uLg0KPiA+
ID4gDQo+ID4gPiBUaGlzIGNoYW5nZSBlbmFibGVzIGRvd25zaGlmdCBhbmQgY29uZmlndXJlcyB0
aGUgbnVtYmVyIG9mIHJldHJpZXMgdG8NCj4gPiA+IGRlZmF1bHQgOCAobWF4aW11bSBzdXBwb3J0
ZWQgdmFsdWUpLg0KPiA+ID4gDQo+ID4gPiBUaGUgY2hhbmdlIGhhcyBiZWVuIGFkYXB0ZWQgZnJv
bSB0aGUgTWFydmVsbCBQSFkgZHJpdmVyLg0KPiA+ID4gDQo+ID4gSW5zdGVhZCBvZiBhIGZpeGVk
IGRvd25zaGlmdCBzZXR0aW5nIChsaWtlIGluIHRoZSBNYXJ2ZWxsIGRyaXZlcikgeW91DQo+ID4g
bWF5IGNvbnNpZGVyIHRvIGltcGxlbWVudCB0aGUgZXRodG9vbCBwaHktdHVuYWJsZSBFVEhUT09M
X1BIWV9ET1dOU0hJRlQuDQo+IA0KPiBIaSBBbGV4YW5kcnUNCj4gDQo+IFVwcHMsIHNvcnJ5LCBt
eSBiYWQuDQo+IA0KPiBJIGxvb2tlZCBhdCBtYXJ2ZWxsX3NldF9kb3duc2hpZnQoKSwgYW5kIGFz
c3VtZWQgaXQgd2FzIGNvbm5lY3RlZCB0bw0KPiB0aGUgcGh5LXR1bmFibGUuIEkgaGF2ZSBwYXRj
aGVzIHNvbWV3aGVyZSB3aGljaCBkb2VzIHRoYXQuIEJ1dCB0aGV5DQo+IGhhdmUgbm90IG1hZGUg
aXQgaW50byBtYWlubGluZSB5ZXQuDQo+IA0KPiA+IFNlZSB0aGUgQXF1YW50aWEgUEhZIGRyaXZl
ciBmb3IgYW4gZXhhbXBsZS4NCj4gDQo+IFllcywgdGhhdCBkb2VzIGhhdmUgYWxsIHRoZSB0dW5h
YmxlIHN0dWZmLg0KDQpBY2suDQpXaWxsIHVzZSB0aGF0DQoNCj4gDQo+ICAgICAgQW5kcmV3DQo=
