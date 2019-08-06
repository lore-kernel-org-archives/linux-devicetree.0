From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Subject: Re: [PATCH 11/16] net: phy: adin: PHY reset mechanisms
Date: Tue, 6 Aug 2019 06:50:55 +0000
Message-ID: <149db19df9517acf81529c726d74b594f40272b1.camel@analog.com>
References: <20190805165453.3989-1-alexandru.ardelean@analog.com>
         <20190805165453.3989-12-alexandru.ardelean@analog.com>
         <20190805151500.GP24275@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190805151500.GP24275@lunn.ch>
Content-Language: en-US
Content-ID: <A98CC07634F627488585BFB9A3D02152@analog.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "andrew@lunn.ch" <andrew@lunn.ch>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCAyMDE5LTA4LTA1IGF0IDE3OjE1ICswMjAwLCBBbmRyZXcgTHVubiB3cm90ZToNCj4g
W0V4dGVybmFsXQ0KPiANCj4gT24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDc6NTQ6NDhQTSArMDMw
MCwgQWxleGFuZHJ1IEFyZGVsZWFuIHdyb3RlOg0KPiA+IFRoZSBBRElOIFBIWXMgc3VwcG9ydHMg
NCB0eXBlcyBvZiByZXNldDoNCj4gPiAxLiBUaGUgc3RhbmRhcmQgUEhZIHJlc2V0IHZpYSBCTUNS
X1JFU0VUIGJpdCBpbiBNSUlfQk1DUiByZWcNCj4gPiAyLiBSZXNldCB2aWEgR1BJTw0KPiA+IDMu
IFJlc2V0IHZpYSByZWcgR2VTZnRSc3QgKDB4ZmYwYykgJiByZWxvYWQgcHJldmlvdXMgcGluIGNv
bmZpZ3MNCj4gPiA0LiBSZXNldCB2aWEgcmVnIEdlU2Z0UnN0ICgweGZmMGMpICYgcmVxdWVzdCBu
ZXcgcGluIGNvbmZpZ3MNCj4gPiANCj4gPiBSZXNldHMgMiAmIDQgYXJlIGFsbW9zdCBpZGVudGlj
YWwsIHdpdGggdGhlIGV4Y2VwdGlvbiB0aGF0IHRoZSBjcnlzdGFsDQo+ID4gb3NjaWxsYXRvciBp
cyBhdmFpbGFibGUgZHVyaW5nIHJlc2V0IGZvciAyLg0KPiA+IA0KPiA+IFJlc2V0dGluZyB2aWEg
R2VTZnRSc3Qgb3IgdmlhIEdQSU8gaXMgdXNlZnVsIHdoZW4gZG9pbmcgYSB3YXJtIHJlYm9vdC4g
SWYNCj4gPiBkb2luZyB2YXJpb3VzIHNldHRpbmdzIHZpYSBwaHl0b29sIG9yIGV0aHRvb2wsIHRo
ZSBzdWItc3lzdGVtIHJlZ2lzdGVycw0KPiA+IGRvbid0IHJlc2V0IGp1c3QgdmlhIEJNQ1JfUkVT
RVQuDQo+ID4gDQo+ID4gVGhpcyBjaGFuZ2UgaW1wbGVtZW50cyByZXNldHRpbmcgdGhlIGVudGly
ZSBQSFkgc3Vic3lzdGVtIGR1cmluZyBwcm9iZS4NCj4gPiBEdXJpbmcgUEhZIEhXIGluaXQgKHBo
eV9od19pbml0KCkgbG9naWMpIHRoZSBQSFkgY29yZSByZWdzIHdpbGwgYmUgcmVzZXQNCj4gPiBh
Z2FpbiB2aWEgQk1DUl9SRVNFVC4gVGhpcyB3aWxsIGFsc28gbmVlZCB0byBoYXBwZW4gZHVyaW5n
IGEgUE0gcmVzdW1lLg0KPiANCj4gcGh5bGliIGFscmVhZHkgaGFzIHN1cHBvcnQgZm9yIEdQSU8g
cmVzZXQuIFNvIGlmIHBvc3NpYmxlLCB5b3Ugc2hvdWxkDQo+IG5vdCByZXBlYXQgdGhhdCBjb2Rl
IGhlcmUuDQo+IA0KPiBXaGF0IGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYSBHUElPIHJlc2V0
LCBhbmQgYSBHUElPIHJlc2V0IGZvbGxvd2VkDQo+IGJ5IGEgc3Vic3lzdGVtIHNvZnQgcmVzZXQ/
DQoNCnRoZXJlIHNob3VsZG4ndCBiZSBhbnkgZGlmZmVyZW5jZTsNCml0J3MganVzdCAyIGNvbnNl
Y3V0aXZlIHJlc2V0czsNCmknbGwgdGFrZSBhIGNsb3NlciBsb29rIGF0IHBoeWxpYidzIEdQSU8g
cmVzZXQgYW5kIHNlZQ0KDQo+IA0KPiAgICBBbmRyZXcNCg==
