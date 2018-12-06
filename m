From: Rob Herring <robh@kernel.org>
Subject: Re: Moving ARM dts files
Date: Thu, 6 Dec 2018 10:57:26 -0600
Message-ID: <CAL_JsqL7Rnb5Tt5ZAm9TDqgcenkkMEzM6STfwKXMDMKkkxqQvg@mail.gmail.com>
References: <20181204183649.GA5716@bogus>
 <20181205135726.70badac7@xhacker.debian>
 <CACRpkdYs_s9m=fUuOcfqcvP5BMXity5GH17RSMyvHzdZ9aFNzA@mail.gmail.com>
 <CAL_JsqJWnB+EAoXk9a1M_D-kH8kZcwD6gTj0yVa_hBCGapB4RQ@mail.gmail.com>
 <20181206133922.4y4qnrqcjtog3ukt@pengutronix.de>
 <CAL_Jsq+PB3Pmg1RmNqj0whapbcqRBXDNWi4LpjPqqCKeLHbR=A@mail.gmail.com>
 <20181206140531.GX8952@piout.net>
 <CACRpkdbzyZD23JapAxEKc24jSwmZws5LqWS8O2Y4-VA3smgYyQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdbzyZD23JapAxEKc24jSwmZws5LqWS8O2Y4-VA3smgYyQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thierry Reding <thierry.reding@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, ARM-SoC Maintainers <arm@kernel.org>, Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Maxime Coquelin <mc>
List-Id: devicetree@vger.kernel.org

T24gVGh1LCBEZWMgNiwgMjAxOCBhdCA4OjMwIEFNIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIERlYyA2LCAyMDE4IGF0IDM6MDUgUE0g
QWxleGFuZHJlIEJlbGxvbmkKPiA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+IHdyb3Rl
Ogo+ID4gT24gMDYvMTIvMjAxOCAwNzo1ODoyNC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+
ID4gT24gVGh1LCBEZWMgNiwgMjAxOCBhdCA3OjM5IEFNIFV3ZSBLbGVpbmUtS8O2bmlnCj4gPiA+
IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4g
SGVsbG8sCj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIERlYyAwNSwgMjAxOCBhdCAwOTowMTo1OUFN
IC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+ID4gPiA+IGkuTVgyMyBpcyBhIFNpZ21hdGVs
IGNoaXAgU1RNUD8/Cj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIHRoZSBGcmVlc2NhbGUgaS5NWDIz
IGRpZG4ndCBleGlzdCBhdCBTaWdtYXRlbCBiYWNrIHRoZW4uIEFGQUlLCj4gPiA+ID4gdGhpcyBp
cyBhIG5ldyBkZXNpZ24gdXNpbmcgSVAgZnJvbSBTaWdtYXRlbCBhZnRlciB0aGUgYXF1aXNpdGlv
bi4KPiA+ID4KPiA+ID4gSXQgaXMgbm90LiBJIHdhcyBpbiB0aGUgaS5NWCBncm91cCB3aGljaCBT
aWdtYXRlbCB3YXMgbWVyZ2VkIGludG8gYXQKPiA+ID4gdGhlIHRpbWUuIFB1cmVseSBtYXJrZXRp
bmcgcmVicmFuZGluZy4KPiA+ID4KPiA+Cj4gPiBXb3VsZG4ndCBpdCBiZSBlYXNpZXIgdG8gbmFt
ZSB0aGUgZGlyZWN0b3J5IHRvIHRoZSBjb3JyZXNwb25kaW5nIG1hY2gtKgo+ID4gZW50cnk/Cj4g
Pgo+ID4gU28sIGlteDIzIGFuZCBpbXgyOCB3b3VsZCBnbyB0byBteHMvLCBvdGhlciBpbXggaW4g
aW14Ly4gQW5kIHRoaXMgYWxzbwo+ID4gc29sdmVzIHRoZSBNYXJ2ZWxsIG1lc3Mgd2l0aCB0aGUg
U3luYXB0aWNzIFNvY3MgZ29pbmcgaW4gYmVybGluLyBhbmQgdGhlCj4gPiBvdGhlciBvbmVzIGlu
IG12ZWJ1Ly4KPgo+IEkgbGlrZSB0aGlzIGlkZWEuCgpGaW5lIGJ5IG1lIHRob3VnaCBJIHRoaW5r
IG1hcnZlbGwgZ2V0cyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gdGhhdC4KSSdsbCB0cnkgYSBwYXNz
IGF0IHRoYXQgYXQgbGVhc3QgZm9yIHRoZSBjYXNlcyB3aXRoIGEgbWl4dHVyZSBvZgpmYW1pbGll
cy4KCj4gV2UgZGlzY3Vzc2VkIG1lcmdpbmcgYWxsIEFSTSByZWZlcmVuY2UgZGVzaWduIG1hY2gt
KiB0byBvbmUgZGlyCj4gaWYgSSBqdXN0IG5hbWUgdGhhdCBtYWNoLWFybSB0aGVuIHdlIGdldCBh
IGNvbnZlcmdlbmNlIHRvIHRoZQo+IHZlbmRvciBuYW1lIGluIHNvbWUgb3JnYW5pYyB3YXkuCgpU
QkMsIHlvdSB3YW50IC4uLi9ib290L2R0cy9hcm0vKiBmb3IgYWxsIHRoZSBBUk0sIEx0ZCBib2Fy
ZHM/IEp1c3QKbWFraW5nIHN1cmUgYXMgeW91IHdlcmUgYXJndWluZyBhZ2FpbnN0IHZlbmRvciBu
YW1lcy4gOikKClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbAo=
