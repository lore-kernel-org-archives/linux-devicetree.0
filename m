From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and
 output-enable
Date: Fri, 12 May 2017 12:57:27 +0000
Message-ID: <SG2PR06MB1165C25E20836CB0B3423AF28AE20@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540>
 <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540>
 <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
 <CAMuHMdXK9VmghZy1RounHWn-HDqgeT_12V_9RVihiuiajn+RDg@mail.gmail.com>
 <CACRpkdYsE1oeDp1HnYAFMKG2iPTg06cAtD41vxrmZPP70MJQdA@mail.gmail.com>
 <CAMuHMdXK7YB2zN4fz9XiqTuydxp7VvVV+wSgXWUYBB0evkp8dw@mail.gmail.com>
 <SG2PR06MB1165FF6C0F4DBD8987BC396A8AE20@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdWVsuq9eucz9hz47oBtEvBGW2sJ8-G7L4hDk53CNnxd2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWVsuq9eucz9hz47oBtEvBGW2sJ8-G7L4hDk53CNnxd2A@mail.gmail.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, jmondi <jacopo@jmondi.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

SGkgR2VlcnQsDQoNCk9uIEZyaWRheSwgTWF5IDEyLCAyMDE3LCBHZWVydCBVeXR0ZXJob2V2ZW4g
d3JvdGU6DQo+IDEyIHggMTYgPSAxOTIsIG5vdCAzODQuDQoNCk9wcHMsIG15IG1hdGggd2FzIG9m
ZiENCg0KICAoSSB0aGluayBJIG5lZWQgYW5vdGhlciBjdXAgb2YgY29mZmVlIHRoaXMgbW9ybmlu
ZykNCg0KDQo+IERvIHlvdSBuZWVkIGFsbCBwb3NzaWJsZSBjb21iaW5hdGlvbnMgb2YgaW5wdXQs
IG91dHB1dCwgYW5kIGJpLWRpcj8NCj4gSSBhc3N1bWVkIHRoZXkncmUgbXV0dWFsbHkgZXhjbHVz
aXZlLiBJZiBub3QsIHlvdSBuZWVkIDMgYml0cy9waW4vZnVuY3Rpb24NCg0KWW91J3JlIHJpZ2h0
LCB0aGV5IGFyZSBtdXR1YWxseSBleGNsdXNpdmUsIHNvIDIgYml0cyBhcmUgZmluZS4NCg0KQWxz
bywgdGhlIG90aGVyIHBpbm91dCB2YXJpYXRpb25zIGNoaXBzIChSWi9BMUwsQTFMVSxBMUxDKSBv
bmx5IGhhdmUgMTAgcG9ydHM6DQoNCiAxMiBwb3J0cyB4IDE2IHBpbnMgeCAyYml0cy1wZXItYml0
ID0+IDM4NCBieXRlcw0KIDEwIHBvcnRzIHggMTYgcGlucyB4IDJiaXRzLXBlci1iaXQgPT4gMzIw
IGJ5dGVzDQoNCiAzODQgKyAzMjAgPSA3MDQgYnl0ZXMgKG9mIGNvbnN0IGRhdGEpDQoNCg0KPiBX
aXRoIHBhY2thZ2VzLCBkbyB5b3UgbWVhbiBlLmcuIFJaL0ExSCB2cy4gUlovQTFMPw0KDQpZZXMu
DQoNCg0KPiBUaGVzZSBpbmRlZWQgZGlmZmVyLA0KPiBidXQNCj4gc2hvdWxkIHVzZSBkaWZmZXJl
bnQgY29tcGF0aWJsZSB2YWx1ZXMuDQoNCk9LLiBTaW5jZSByN3M3MjEwMC5kdHNpIGhhcw0KICAg
IGNvbXBhdGlibGUgPSAicmVuZXNhcyxyN3M3MjEwMC1wb3J0cyI7DQoNCldlJ2xsIGp1c3Qgb3Zl
cnJpZGUgdGhhdCBpbiBzYXkgbXktcnphMWwtYm9hcmQuZHRzDQoNCiZwaW5jdHJsIHsNCgljb21w
YXRpYmxlID0gInJlbmVzYXMscjdzNzIxMDItcG9ydHMiOw0KfTsNCgkNCiAgYW5kIHRoZW4gbG9v
ayBmb3IgdGhhdCBpbiB0aGUgZHJpdmVyLg0KCQ0KDQo+IE9yIGRvIHlvdSBtZWFuIFFGUC9CR0Ey
NTYgdnMuIEJHQTMyND8gSXNuJ3QgdGhlIGZvcm1lciBhIHN1YnNldCBvZiB0aGUNCj4gbGF0dGVy
Pw0KDQpUaGUgInBhY2thZ2UiIGRvZXNuJ3QgbWF0dGVyLCBpdCdzIHRoZSBwaW4gYXNzaWdubWVu
dHMgb24gdGhlIGRpZToNCiAgUlovQTFIID0gUlovQTFNID0gcGluIGFzc2lnbm1lbnRzICMxDQog
IFJaL0ExTCA9IFJaL0ExTFUgPSBSWi9BMUxDID0gcGluIGFzc2lnbm1lbnRzICMyDQoNClRoZW4g
ZWFjaCBvZiB0aG9zZSBwYXJ0cyBhYm92ZSBoYXZlIG11bHRpcGxlICdwYWNrYWdlIG9wdGlvbnMn
LCBidXQgb2YNCmNvdXJzZSBkb2Vzbid0IGNoYW5nZSB0aGUgYWN0dWFsIHBpbi9mdW5jdGlvbiBh
c3NpZ25tZW50cyAodGhhdCdzIHBhcnQNCm9mIHRoZSBzaWxpY29uIGRpZSkNCg0KQ2hyaXMNCg0K
