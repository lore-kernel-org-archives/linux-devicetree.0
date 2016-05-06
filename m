From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v16 3/8] drm/mediatek: Add DRM Driver for Mediatek SoC
 MT8173.
Date: Fri, 06 May 2016 16:40:00 +0200
Message-ID: <1462545600.5058.59.camel@pengutronix.de>
References: <1462539954-26158-1-git-send-email-p.zabel@pengutronix.de>
 <1462539954-26158-4-git-send-email-p.zabel@pengutronix.de>
 <20160506131648.GB27098@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160506131648.GB27098@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Mao Huang <littlecvr@chromium.org>, YT Shen <yt.shen@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Emil Velikov <emil.l.velikov@gmail.com>, Tomasz Figa <tfiga@chromium.org>, kernel@pengutronix.de, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

SGkgRGFuaWVsLAoKQW0gRnJlaXRhZywgZGVuIDA2LjA1LjIwMTYsIDE1OjE2ICswMjAwIHNjaHJp
ZWIgRGFuaWVsIFZldHRlcjoKPiBPbiBGcmksIE1heSAwNiwgMjAxNiBhdCAwMzowNTo0OVBNICsw
MjAwLCBQaGlsaXBwIFphYmVsIHdyb3RlOgo+ID4gRnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4KPiA+IAo+ID4gVGhpcyBwYXRjaCBhZGRzIGFuIGluaXRpYWwgRFJNIGRyaXZlciBmb3Ig
dGhlIE1lZGlhdGVrIE1UODE3MyBESVNQCj4gPiBzdWJzeXN0ZW0uIEl0IGN1cnJlbnRseSBzdXBw
b3J0cyB0d28gZml4ZWQgb3V0cHV0IHN0cmVhbXMgZnJvbSB0aGUKPiA+IE9WTDAvT1ZMMSBzb3Vy
Y2VzIHRvIHRoZSBEU0kwL0RQSTAgc2lua3MsIHJlc3BlY3RpdmVseS4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFlU
IFNoZW4gPHl0LnNoZW5AbWVkaWF0ZWsuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIEt1
cnR6IDxkamt1cnR6QGNocm9taXVtLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEJpYmJ5IEhzaWVo
IDxiaWJieS5oc2llaEBtZWRpYXRlay5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYW8gSHVhbmcg
PGxpdHRsZWN2ckBjaHJvbWl1bS5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVs
IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IAo+IFNwb3R0ZWQgdHdvIHRpbnkgdGhpbmdzIGJl
bG93LgpbLi4uXQo+ID4gK3N0YXRpYyBpbnQgbXRrX2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiA+ICt7Cj4gPiArCXN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgKnByaXZhdGUgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsKPiA+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRybTsKPiA+ICsJaW50IHJl
dDsKPiA+ICsKPiA+ICsJZHJtID0gZHJtX2Rldl9hbGxvYygmbXRrX2RybV9kcml2ZXIsIGRldik7
Cj4gPiArCWlmICghZHJtKQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArCWRybV9k
ZXZfc2V0X3VuaXF1ZShkcm0sIGRldl9uYW1lKGRldikpOwo+ID4gKwo+ID4gKwlyZXQgPSBkcm1f
ZGV2X3JlZ2lzdGVyKGRybSwgMCk7Cj4gPiArCWlmIChyZXQgPCAwKQo+ID4gKwkJZ290byBlcnJf
ZnJlZTsKPiA+ICsKPiA+ICsJZHJtLT5kZXZfcHJpdmF0ZSA9IHByaXZhdGU7Cj4gPiArCXByaXZh
dGUtPmRybSA9IGRybTsKPiA+ICsKPiA+ICsJcmV0ID0gbXRrX2RybV9rbXNfaW5pdChkcm0pOwo+
ID4gKwlpZiAocmV0IDwgMCkKPiA+ICsJCWdvdG8gZXJyX3VucmVnaXN0ZXI7Cj4gCj4gV3Jvbmcg
d2F5IHJvdW5kLCBkcm1fZGV2X3JlZ2lzdGVyIHNob3VsZCBiZSBsYXN0LiBBbmQgeW91J3JlIG1p
c3NpbmcKPiBkcm1fY29ubmVjdG9yX3JlZ2lzdGVyX2FsbCBoZXJlLgo+IC1EYW5pZWwKClRoYW5r
cywgdGhhdCBhbHNvIG1lYW5zIHRoZSBtdGtfZHNpIGFuZCBtdGtfaGRtaSBkcml2ZXJzIG11c3Qg
bm90IGNhbGwKZHJtX2Nvbm5lY3Rvcl8odW4pcmVnaXN0ZXIgYW55bW9yZS4KV2hhdCBhYm91dCB0
aGUgY29ubmVjdG9ycyByZWdpc3RlcmVkIGJ5IGV4dGVybmFsIGJyaWRnZSBkcml2ZXJzPyBTaG91
bGQKdGhvc2UgY2hlY2sgZm9yIChkZXYtPmRyaXZlci0+bG9hZCkgYmVmb3JlIGNhbGxpbmcKZHJt
X2Nvbm5lY3Rvcl91bnJlZ2lzdGVyPwoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
