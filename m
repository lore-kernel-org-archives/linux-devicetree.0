From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 2/2] dt-bindings: pinctrl: add support for RZ/A1L
Date: Wed, 4 Oct 2017 14:43:32 +0000
Message-ID: <SG2PR06MB1165243813B8D662AE93911E8A730@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20171003073334.18917-1-chris.brandt@renesas.com>
 <20171003073334.18917-3-chris.brandt@renesas.com>
 <CAMuHMdVU_dmMvfSNQXOON1doW98EjRY9p8XT6XP7ccxa7414bw@mail.gmail.com>
 <SG2PR06MB1165B7C76F5E5528FDF7B7408A730@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdUh05qyi3eoao0KbahGD1NfEnGm03JpcZuFHVrEBSBU1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUh05qyi3eoao0KbahGD1NfEnGm03JpcZuFHVrEBSBU1Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>
List-Id: devicetree@vger.kernel.org

SGkgR2VlcnQsDQoNClRvIGJlIGNsZWFyOg0KDQpPbiBXZWRuZXNkYXksIE9jdG9iZXIgMDQsIDIw
MTcgMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOg0KPiA+PiBZb3UgY291bGQgdXNlICJyZW5l
c2FzLHI3czcyMTAwLXBvcnRzIiBhcyBhIGZhbGxiYWNrIHByb3BlcnR5IGZvcg0KPiBSWi9BMU0s
DQo+ID4+IHRob3VnaC4NCj4gPg0KPiA+IERvIHlvdSBtZWFuIGluIHRoZSBEVD8gT3IgaW4gcGlu
Y3RybC1yemExLmM/DQo+IA0KPiBJIG1lYW4gaW4gRFQsIGkuZS46DQo+IA0KPiAgICAgICAgIHBp
bmN0cmw6IHBpbi1jb250cm9sbGVyQGZjZmUzMDAwIHsNCj4gICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAicmVuZXNhcyxyN3M3MjEwMS1wb3J0cyIsICJyZW5lc2FzLHI3czcyMTAwLQ0KPiBw
b3J0cyI7DQo+ICAgICAgICAgICAgICAgICAuLi4NCj4gDQo+IFRoYXQgd2F5IHlvdSBkb24ndCBo
YXZlIHRvIGV4dGVuZCB0aGUgcGluY3RybCBkcml2ZXIuDQoNCkkgd2lsbCBzdWJtaXQgYSB2MiB3
aXRoOg0KDQpbIHJlbmVzYXMscnphMS1waW5jdHJsLnR4dCBdDQoNClJlcXVpcmVkIHByb3BlcnRp
ZXM6DQogIC0gY29tcGF0aWJsZQ0KICAgIHRoaXMgc2hhbGwgYmUgInJlbmVzYXMscjdzNzIxMDAt
cG9ydHMiIGZvciBSWi9BMUgsIA0KICAgICJyZW5lc2FzLHI3czcyMTAxLXBvcnRzIiBmb3IgUlov
TSBvcg0KICAgICJyZW5lc2FzLHI3czcyMTAyLXBvcnRzIiBmb3IgUlovQTFMDQoNCg0KWyByN3M3
MjEwMC5kdHNpIF0NCglwaW5jdHJsOiBwaW4tY29udHJvbGxlckBmY2ZlMzAwMCB7DQoJCWNvbXBh
dGlibGUgPSAicmVuZXNhcyxyN3M3MjEwMS1wb3J0cyIsICJyZW5lc2FzLHI3czcyMTAwLXBvcnRz
IjsNCg0KDQpbIHBpbmN0cmwtcnphMS5jIF0gDQogIE5vIGNoYW5nZSBmcm9tIFYxDQoNCg0KDQpV
bmxlc3MgeW91IHNheSBzb21ldGhpbmcgZGlmZmVyZW50LCBJIHdpbGwgc3VibWl0IGEgVjIgaW4g
YSBsaXR0bGUgDQp3aGlsZS4NCg0KQXMgYWx3YXlzLCB0aGFuayB5b3UgZm9yIHlvdXIgZ3VpZGFu
Y2UhDQoNCkNocmlzDQoNCg==
