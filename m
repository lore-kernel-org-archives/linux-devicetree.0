From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v9 1/8] ARM: aurora-l2: add prefix to MAX_RANGE_SIZE
Date: Tue, 27 Aug 2019 20:56:05 +0000
Message-ID: <b1e2e5b325b3c4453e2ed63c17e1e11d6b24f099.camel@alliedtelesis.co.nz>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
         <20190712034904.5747-2-chris.packham@alliedtelesis.co.nz>
         <20190823104621.GY13294@shell.armlinux.org.uk>
         <20190823105020.GZ13294@shell.armlinux.org.uk>
         <836653f04f526333e8dbd45361329731f8dfe2ea.camel@alliedtelesis.co.nz>
         <20190827091336.GI13294@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827091336.GI13294@shell.armlinux.org.uk>
Content-Language: en-US
Content-ID: <DB7AD1FE2BCAAD49A227E6CDD248BBBA@atlnz.lc>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregory.clement@free-electrons.com" <gregory.clement@free-electrons.com>, "jlu@pengutronix.de" <jlu@pengutronix.de>, "bp@alien8.de" <bp@alien8.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "patches@armlinux.org.uk" <patches@armlinux.org.uk>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCAyMDE5LTA4LTI3IGF0IDEwOjEzICswMTAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGlu
dXggYWRtaW4NCndyb3RlOg0KPiBPbiBNb24sIEF1ZyAyNiwgMjAxOSBhdCAxMjo0Njo0NEFNICsw
MDAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiA+IEhpIFJ1c3NlbGwsDQo+ID4gDQo+ID4gT24g
RnJpLCAyMDE5LTA4LTIzIGF0IDExOjUwICswMTAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXgg
YWRtaW4NCj4gPiB3cm90ZToNCj4gPiA+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDExOjQ2OjIx
QU0gKzAxMDAsIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51eA0KPiA+ID4gYWRtaW4gd3JvdGU6DQo+
ID4gPiA+IEkgY2FuJ3QgYXBwbHkgdGhpcyBzZXJpZXMgLSB0aGlzIGZpbGUgZG9lcyBub3QgZXhp
c3QgaW4gbXkgdHJlZSwNCj4gPiA+ID4gYW5kDQo+ID4gPiA+IGZyb20gd2hhdCBnaXQgdGVsbHMg
bWUsIGl0IG5ldmVyIGhhcyBleGlzdGVkLiAgTWF5YmUgaXQncyBpbg0KPiA+ID4gPiBzb21lb25l
DQo+ID4gPiA+IGVsc2VzIHRyZWU/DQo+ID4gPiANCj4gPiA+IEkgdGhpbmsgdGhlIGZpbGUgaXMg
aW4gbXkgdHJlZSwganVzdCBhcyBhcmNoL2FybS9tbS9jYWNoZS1hdXJvcmEtbDIuaA0KPiA+ID4g
d2hpY2ggaXMgd2hlcmUgaXQgaGFzIGJlZW4gc2luY2UgaXQgd2FzIG9yaWdpbmFsbHkgc3VibWl0
dGVkIGluIDIwMTIuDQo+ID4gDQo+ID4gU29ycnkgdGhlcmUgaXMgYSBtaXNzaW5nIHBhdGNoIHRo
YXQgbW92ZXMgaXQgbmV4dCB0byB0aGUNCj4gPiBoYXJkd2FyZS9jYWNoZS0qLmguIEkgY2FuIHNl
bmQgdGhlIG1pc3NpbmcgcGF0Y2ggb3IgSSBjYW4gcmUtc2VuZCB0aGUNCj4gPiB3aG9sZSBzZXJp
ZXMuIElmIEkgZG8gc2VuZCB0aGUgd2hvbGUgc2VyaWVzIGRvIHlvdSB3YW50IG1lIHRvIHJlYmFz
ZSBpdA0KPiA+IGFnYWluc3QgYSBwYXJ0aWN1bGFyIHRhZy90cmVlPw0KPiANCj4gSnVzdCBzZW5k
IHRoZSBzaW5nbGUgcGF0Y2ggdG8gdGhlIHBhdGNoIHRyYWNrZXIgLSBoYXZpbmcgaXQgYWdhaW5z
dA0KPiA1LjMtcmMgaXMgZmluZSAoSSBkb24ndCB0aGluayBhbnl0aGluZyBoYXMgY2hhbmdlZCBm
b3IgYSBsb25nIHRpbWUNCj4gd2l0aCB0aGF0IGZpbGUuKQ0KDQpEb25lIA0KaHR0cHM6Ly93d3cu
YXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzL3ZpZXdwYXRjaC5waHA/aWQ9ODkwMi8x
DQoNCkknbSBzdGlsbCBub3QgZW50aXJlbHkgc3VyZSB3aGF0IHRvIHB1dCBmb3IgdGhlIEtlcm5l
bFZlcnNpb24gdGFnLiBJbg0KaGluZHNpZ2h0IHRoaW5rIEkgbWlzaW50ZXJwcmV0ZWQgeW91ciBj
b21tZW50IGFib3ZlIGFuZCBzZXQgaXQgdG8gNS4zcmMNCih3aGVyZSB5b3UgbWVhbnQgYSBzZXJp
ZXMgYmFzZWQgb24gNS4zLXJjWCBzaG91bGQgYXBwbHkgY2xlYW5seSkuIEl0DQpwcm9iYWJseSBz
aG91bGQgaGF2ZSBiZWVuIG5leHQgb3IgbWFzdGVyIGJlY2F1c2UgaXQncyB3YXkgcGFzdCB0aGUN
Cm1lcmdlIHdpbmRvdyBmb3IgNS4zLg0KDQo=
