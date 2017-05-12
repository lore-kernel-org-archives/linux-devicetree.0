From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and
 output-enable
Date: Fri, 12 May 2017 11:44:13 +0000
Message-ID: <SG2PR06MB11653A0728C393CCFA6DBA788AE20@SG2PR06MB1165.apcprd06.prod.outlook.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYsE1oeDp1HnYAFMKG2iPTg06cAtD41vxrmZPP70MJQdA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: jmondi <jacopo@jmondi.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpZGF5LCBNYXkgMTIsIDIwMTcsIGxpbnV4LXJlbmVzYXMtc29jLW93bmVyQHZnZXIua2Vy
bmVsLm9yZyB3cm90ZToNCj4gQXMgeW91IHNheSB0aGlzIGlzIGFjdHVhbGx5IGZpeGluZyBoYXJk
d2FyZSBidWdzLCB3ZSBjYW4gZXhwZWN0IHRoZXNlDQo+IHF1aXJreSB0YWJsZXMgdG8gYmUgZ29u
ZSBpbiB0aGUgbmV4dCBoYXJkd2FyZSBnZW5lcmF0aW9uLCByaWdodD8NCg0KSSBzZWUgdGhpcyBw
YXJ0aWN1bGFyIHBpbiBjb250cm9sbGVyIGFzIGEgb25lIHNob3QgZGVhbC4gRm9yIHRoZSBuZXh0
DQpwYXJ0IGluIHRoaXMgc2VyaWVzIHdlIGFyZSBtb3ZpbmcgdG8gYSBjb21wbGV0ZWx5IGRpZmZl
cmVudCBjb250cm9sbGVyDQp3aGljaCB5b3UgY291bGQgcHJvYmFibHkgZ2V0IGF3YXkgd2l0aCBz
aW1wbHkgdXNpbmcgcGluY3RybC1zaW5nbGUuDQoNCg0KPiBUaGVuIHRoZSByaWdodCBwbGFjZSBm
b3IgaXQgaXMgaW4gdGhlIHF1aXJreSBkcml2ZXIgZm9yIHRoZSBxdWlya3kNCj4gZmlyc3QtZ2Vu
ZXJhdGlvbg0KPiBoYXJkd2FyZS4NCg0KTWF5YmUgdG8gYmUgbW9yZSBjbGVhciwgSSB3b3VsZCBz
YXkgdGhlIGRlc2lnbiBpcyBub3QgYSAnYnVnJywgYnV0DQpyYXRoZXIgYW4gdW5kZXIgc2lnaHQg
b2YgdGhlIG9yaWdpbmFsIGRlc2lnbmVycyB3aGVyZSBhcmUgdGhleSBzdGFyZWQNCnRvIG5lZWQg
cGlucyB0aGF0IHdvdWxkIGJlIGJvdGggaW4gYW5kIG91dCwgdGhleSBzdGFydGVkIHRhY2tpbmcg
b24NCm1vcmUgaGFyZHdhcmUuDQoNCg0KQ2hyaXMNCg==
