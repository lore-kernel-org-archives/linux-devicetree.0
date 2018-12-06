From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Moving ARM dts files
Date: Thu, 6 Dec 2018 15:30:14 +0100
Message-ID: <CACRpkdbzyZD23JapAxEKc24jSwmZws5LqWS8O2Y4-VA3smgYyQ@mail.gmail.com>
References: <20181204183649.GA5716@bogus>
 <20181205135726.70badac7@xhacker.debian>
 <CACRpkdYs_s9m=fUuOcfqcvP5BMXity5GH17RSMyvHzdZ9aFNzA@mail.gmail.com>
 <CAL_JsqJWnB+EAoXk9a1M_D-kH8kZcwD6gTj0yVa_hBCGapB4RQ@mail.gmail.com>
 <20181206133922.4y4qnrqcjtog3ukt@pengutronix.de>
 <CAL_Jsq+PB3Pmg1RmNqj0whapbcqRBXDNWi4LpjPqqCKeLHbR=A@mail.gmail.com>
 <20181206140531.GX8952@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181206140531.GX8952@piout.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, ext Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, arm-soc <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Andy Gross <andy.gross@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Maxime Coquelin <mc>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBEZWMgNiwgMjAxOCBhdCAzOjA1IFBNIEFsZXhhbmRyZSBCZWxsb25pCjxhbGV4YW5k
cmUuYmVsbG9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4gT24gMDYvMTIvMjAxOCAwNzo1ODoyNC0w
NjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE9uIFRodSwgRGVjIDYsIDIwMTggYXQgNzozOSBB
TSBVd2UgS2xlaW5lLUvDtm5pZwo+ID4gPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhlbGxvLAo+ID4gPgo+ID4gPiBPbiBXZWQsIERlYyAwNSwgMjAx
OCBhdCAwOTowMTo1OUFNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4gPiBpLk1YMjMg
aXMgYSBTaWdtYXRlbCBjaGlwIFNUTVA/Pwo+ID4gPgo+ID4gPiBJIHRoaW5rIHRoZSBGcmVlc2Nh
bGUgaS5NWDIzIGRpZG4ndCBleGlzdCBhdCBTaWdtYXRlbCBiYWNrIHRoZW4uIEFGQUlLCj4gPiA+
IHRoaXMgaXMgYSBuZXcgZGVzaWduIHVzaW5nIElQIGZyb20gU2lnbWF0ZWwgYWZ0ZXIgdGhlIGFx
dWlzaXRpb24uCj4gPgo+ID4gSXQgaXMgbm90LiBJIHdhcyBpbiB0aGUgaS5NWCBncm91cCB3aGlj
aCBTaWdtYXRlbCB3YXMgbWVyZ2VkIGludG8gYXQKPiA+IHRoZSB0aW1lLiBQdXJlbHkgbWFya2V0
aW5nIHJlYnJhbmRpbmcuCj4gPgo+Cj4gV291bGRuJ3QgaXQgYmUgZWFzaWVyIHRvIG5hbWUgdGhl
IGRpcmVjdG9yeSB0byB0aGUgY29ycmVzcG9uZGluZyBtYWNoLSoKPiBlbnRyeT8KPgo+IFNvLCBp
bXgyMyBhbmQgaW14Mjggd291bGQgZ28gdG8gbXhzLywgb3RoZXIgaW14IGluIGlteC8uIEFuZCB0
aGlzIGFsc28KPiBzb2x2ZXMgdGhlIE1hcnZlbGwgbWVzcyB3aXRoIHRoZSBTeW5hcHRpY3MgU29j
cyBnb2luZyBpbiBiZXJsaW4vIGFuZCB0aGUKPiBvdGhlciBvbmVzIGluIG12ZWJ1Ly4KCkkgbGlr
ZSB0aGlzIGlkZWEuCgpXZSBkaXNjdXNzZWQgbWVyZ2luZyBhbGwgQVJNIHJlZmVyZW5jZSBkZXNp
Z24gbWFjaC0qIHRvIG9uZSBkaXIKaWYgSSBqdXN0IG5hbWUgdGhhdCBtYWNoLWFybSB0aGVuIHdl
IGdldCBhIGNvbnZlcmdlbmNlIHRvIHRoZQp2ZW5kb3IgbmFtZSBpbiBzb21lIG9yZ2FuaWMgd2F5
LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
