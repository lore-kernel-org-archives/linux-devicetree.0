From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v13 04/14] drm/mediatek: Add DPI sub driver
Date: Tue, 15 Mar 2016 12:45:52 +0100
Message-ID: <1458042352.3360.24.camel@pengutronix.de>
References: <1457443649-12133-1-git-send-email-p.zabel@pengutronix.de>
 <1457443649-12133-5-git-send-email-p.zabel@pengutronix.de>
 <CAGS+omD__asTHg=aR1o3wzCsEs95GaxwdFD7rHoZcNLQ7zF6Jg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAGS+omD__asTHg=aR1o3wzCsEs95GaxwdFD7rHoZcNLQ7zF6Jg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, dri-devel <dri-devel@lists.freedesktop.org>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Sasha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Emil Velikov <emil.l.velikov@gmail.com>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SGkgRGFuaWVsLAoKQW0gTWl0dHdvY2gsIGRlbiAwOS4wMy4yMDE2LCAyMjoyMyArMDgwMCBzY2hy
aWViIERhbmllbCBLdXJ0ejoKPiBIaSBQaGlsaXBwLCBKaWUsCj4gCj4gU29tZSBzbWFsbCBjb21t
ZW50cy4KPiBOb3RoaW5nIHRoYXQgY2FuJ3QgYmUgZml4ZWQgYWZ0ZXIgbWVyZ2luZyBpZiB5b3Ug
cHJlZmVyLgo+Cj4gT24gVHVlLCBNYXIgOCwgMjAxNiBhdCA5OjI3IFBNLCBQaGlsaXBwIFphYmVs
IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKWy4uLl0KPiA+ICtzdGF0aWMgaW50IG10
a19kcGlfcG93ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSwgZW51bSBtdGtfZHBpX3Bvd2VyX2N0
bCBwY3RsKQo+ID4gK3sKPiA+ICsgICAgICAgaW50IHJldDsKPiA+ICsKPiA+ICsgICAgICAgZHBp
LT5wb3dlcl9jdGwgfD0gcGN0bDsKPiA+ICsKPiA+ICsgICAgICAgaWYgKCEoZHBpLT5wb3dlcl9j
dGwgJiBEUElfUE9XRVJfU1RBUlQpICYmCj4gPiArICAgICAgICAgICAhKChkcGktPnBvd2VyX2N0
bCAmIERQSV9QT1dFUl9FTkFCTEUpICYmCj4gPiArICAgICAgICAgICAgICgoZHBpLT5wb3dlcl9j
dGwgJiBEUElfUE9XRVJfUkVTVU1FKSkpKQo+IAo+IFRoZXJlIG9uZSB0b28gbWFueSAoKSBvbiB0
aGUgUE9XRVJfUkVTVU1FIGNsYXVzZS4KCkknbGwgdHJ5IHRvIHJlbW92ZSB0aGUgc3VzcGVuZCBv
cHMgYW5kIHRoaXMgd2l0aCB0aGVtLgoKWy4uLl0KPiA+ICtzdGF0aWMgU0lNUExFX0RFVl9QTV9P
UFMobXRrX2RwaV9wbV9vcHMsIG10a19kcGlfc3VzcGVuZCwgbXRrX2RwaV9yZXN1bWUpOwo+IAo+
IExpa2UgaGRtaSAmIGRzaSwgSSB0aGluayB3ZSBjYW4gcmVtb3ZlIHRoZXNlIFBNIHJvdXRpbmVz
Lgo+IEFuZCBtYXliZSB0aGVuIHdlIGNhbiByZW1vdmUgdGhlICJEUElfUE9XRVJfUkVTVU1FIiBs
b2dpYyAod2hpY2ggSQo+IGRvbid0IGdyb2sgeWV0KT8KClJpZ2h0LCBhbHNvIHdlIHByb2JhYmx5
IHNob3VsZCB1c2UgZHJtX2F0b21pY19oZWxwZXJfc3VzcGVuZC9yZXN1bWUgaW4KbXRrX2RybV9z
eXNfc3VzcGVuZC9yZXN1bWUuCgpbLi4uXQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHBpLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5o
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMC4uNGZhNDExNAo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGku
aAo+IAo+IEFsbCBvZiB0aGlzIGNhbiBiZSBtb3ZlZCB0byBtdGtfZHBpLmMuCgpPaywgSSdsbCBt
ZXJnZSB0aGlzIGludG8gbXRrX2RwaS5jLgoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
