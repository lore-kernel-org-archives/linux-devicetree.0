From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 03/11] clocksource: sun4i: Add missing compatibles
Date: Mon, 19 Aug 2019 21:43:47 +0200
Message-ID: <b217183a-33c1-f384-e730-eb1903ca0d03@linaro.org>
References: <20190722081229.22422-1-maxime.ripard@bootlin.com>
 <20190722081229.22422-3-maxime.ripard@bootlin.com>
 <9df53981-d1b2-433c-e61f-7c000c71bc55@linaro.org>
 <20190812091631.j2pr7i2zeput3hrc@flea>
 <42ee55ee-258c-7588-fea3-db3c661a0156@linaro.org>
 <20190812112411.ty3npkq6ztbushhm@flea> <20190819133058.bujcawpw5rgsfp4g@flea>
 <0e36a6fe-33de-5af5-f4f9-4cedfc9d0cbf@linaro.org>
 <20190819191326.c27vmevrqkmjhfru@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190819191326.c27vmevrqkmjhfru@flea>
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
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, tglx@linutronix.de, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

T24gMTkvMDgvMjAxOSAyMToxMywgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiBPbiBNb24sIEF1ZyAx
OSwgMjAxOSBhdCAwMzo0NTo0MFBNICswMjAwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4gT24g
MTkvMDgvMjAxOSAxNTozMCwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPj4+IE9uIE1vbiwgQXVnIDEy
LCAyMDE5IGF0IDAxOjI0OjExUE0gKzAyMDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4+Pj4gT24g
TW9uLCBBdWcgMTIsIDIwMTkgYXQgMTE6MjE6NTBBTSArMDIwMCwgRGFuaWVsIExlemNhbm8gd3Jv
dGU6Cj4+Pj4+IE9uIDEyLzA4LzIwMTkgMTE6MTYsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4+Pj4+
PiBIaSwKPj4+Pj4+Cj4+Pj4+PiBPbiBNb24sIEF1ZyAxMiwgMjAxOSBhdCAxMDo1OTo1MUFNICsw
MjAwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4+Pj4+PiBPbiAyMi8wNy8yMDE5IDEwOjEyLCBN
YXhpbWUgUmlwYXJkIHdyb3RlOgo+Pj4+Pj4+PiBOZXdlciBBbGx3aW5uZXIgU29DcyBoYXZlIGRp
ZmZlcmVudCBudW1iZXIgb2YgaW50ZXJydXB0cywgbGV0J3MgYWRkCj4+Pj4+Pj4+IGRpZmZlcmVu
dCBjb21wYXRpYmxlcyBmb3IgYWxsIG9mIHRoZW0gdG8gZGVhbCB3aXRoIHRoaXMgcHJvcGVybHku
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZS5y
aXBhcmRAYm9vdGxpbi5jb20+Cj4+Pj4+Pj4KPj4+Pj4+PiBBY2tlZC1ieTogRGFuaWVsIExlemNh
bm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+Cj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzIQo+Pj4+
Pj4KPj4+Pj4+IENhbiB5b3UgbWVyZ2UgdGhpcyB0aHJvdWdoIHlvdXIgdHJlZSAoYWxvbmcgd2l0
aCB0aGUgYmluZGluZ3MpPyBJJ2xsCj4+Pj4+PiBtZXJnZSB0aGUgRFQgcGF0Y2hlcwo+Pj4+Pgo+
Pj4+PiBwYXRjaGVzIDEtNCB0aGVuID8KPj4+Pgo+Pj4+IFllcCwgdGhhbmtzIQo+Pj4KPj4+IFBp
bmc/Cj4+Cj4+IFRoZXkgYXJlIGFwcGxpZWQgOikKPiAKPiBPaCwgbXkgYmFkIDopCgpBY3R1YWxs
eSwgSSBzaG91bGQgaGF2ZSB0ZWxsIHlvdSB0aGV5IHdlcmUgYXBwbGllZC4KCj4gV2hlcmUgaXMg
eW91ciB0cmVlIHRoZXNlIGRheXM/IEkgY291bGRuJ3QgZmluZCBpdCBpbiBsaW51eC1uZXh0IGVp
dGhlcgoKaHR0cHM6Ly9naXQubGluYXJvLm9yZy9wZW9wbGUvZGFuaWVsLmxlemNhbm8vbGludXgu
Z2l0L2xvZy8/aD1jbG9ja2V2ZW50cy9uZXh0CgoKCi0tIAogPGh0dHA6Ly93d3cubGluYXJvLm9y
Zy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9s
bG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vi
b29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDov
L3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0
CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
