From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 03/11] clocksource: sun4i: Add missing compatibles
Date: Mon, 12 Aug 2019 10:59:51 +0200
Message-ID: <9df53981-d1b2-433c-e61f-7c000c71bc55@linaro.org>
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
 <20190722081229.22422-3-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722081229.22422-3-maxime.ripard@bootlin.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMjIvMDcvMjAxOSAxMDoxMiwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiBOZXdlciBBbGx3aW5u
ZXIgU29DcyBoYXZlIGRpZmZlcmVudCBudW1iZXIgb2YgaW50ZXJydXB0cywgbGV0J3MgYWRkCj4g
ZGlmZmVyZW50IGNvbXBhdGlibGVzIGZvciBhbGwgb2YgdGhlbSB0byBkZWFsIHdpdGggdGhpcyBw
cm9wZXJseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJk
QGJvb3RsaW4uY29tPgoKQWNrZWQtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0Bs
aW5hcm8ub3JnPgoKPiAtLS0KPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdW40aS5jIHwg
NCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdW40aS5jIGIvZHJpdmVycy9jbG9ja3NvdXJj
ZS90aW1lci1zdW40aS5jCj4gaW5kZXggNjVmMzhmNmNhNzE0Li4wYmE4MTU1YjgyODcgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zdW40aS5jCj4gKysrIGIvZHJpdmVy
cy9jbG9ja3NvdXJjZS90aW1lci1zdW40aS5jCj4gQEAgLTIxOSw1ICsyMTksOSBAQCBzdGF0aWMg
aW50IF9faW5pdCBzdW40aV90aW1lcl9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKPiAg
fQo+ICBUSU1FUl9PRl9ERUNMQVJFKHN1bjRpLCAiYWxsd2lubmVyLHN1bjRpLWExMC10aW1lciIs
Cj4gIAkJICAgICAgIHN1bjRpX3RpbWVyX2luaXQpOwo+ICtUSU1FUl9PRl9ERUNMQVJFKHN1bjhp
X2EyMywgImFsbHdpbm5lcixzdW44aS1hMjMtdGltZXIiLAo+ICsJCSBzdW40aV90aW1lcl9pbml0
KTsKPiArVElNRVJfT0ZfREVDTEFSRShzdW44aV92M3MsICJhbGx3aW5uZXIsc3VuOGktdjNzLXRp
bWVyIiwKPiArCQkgc3VuNGlfdGltZXJfaW5pdCk7Cj4gIFRJTUVSX09GX0RFQ0xBUkUoc3VuaXYs
ICJhbGx3aW5uZXIsc3VuaXYtZjFjMTAwcy10aW1lciIsCj4gIAkJICAgICAgIHN1bjRpX3RpbWVy
X2luaXQpOwo+IAoKCi0tIAogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRw
Oi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0
dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xp
bmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
