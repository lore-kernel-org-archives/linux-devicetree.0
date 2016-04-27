From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v14 2/8] drm/mediatek: Add DRM Driver for Mediatek SoC
 MT8173.
Date: Wed, 27 Apr 2016 12:57:33 +0200
Message-ID: <20160427105733.GZ2558@phenom.ffwll.local>
References: <1460387376-11799-1-git-send-email-p.zabel@pengutronix.de>
 <1460387376-11799-3-git-send-email-p.zabel@pengutronix.de>
 <1461657922.3599.27.camel@pengutronix.de>
 <20160426084800.GZ2510@phenom.ffwll.local>
 <1461752945.4044.25.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1461752945.4044.25.camel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, Emil Velikov <emil.l.velikov@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Jie Qiu <jie.qiu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, kernel@pengutronix.de, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, YT Shen <yt.shen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Stephen Boyd <sboyd@codeaurora.org>, Tomasz Figa <tfiga@chromium.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

T24gV2VkLCBBcHIgMjcsIDIwMTYgYXQgMTI6Mjk6MDVQTSArMDIwMCwgUGhpbGlwcCBaYWJlbCB3
cm90ZToKPiBIaSBEYW5pZWwsCj4gCj4gQW0gRGllbnN0YWcsIGRlbiAyNi4wNC4yMDE2LCAxMDo0
OCArMDIwMCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4gWy4uLl0KPiA+ID4gK3N0YXRpYyBpbnQg
bXRrX2RybV91bmxvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiA+ID4gK3sKPiA+ID4gKwlt
dGtfZHJtX2ttc19kZWluaXQoZHJtKTsKPiA+ID4gKwlkcm0tPmRldl9wcml2YXRlID0gTlVMTDsK
PiA+ID4gKwo+ID4gPiArCXJldHVybiAwOwo+ID4gPiArfQo+ID4gCj4gPiBMaWtlIGxvYWQsIHRo
ZSB1bmxvYWQgaG9vayBpcyBkZXByZWNhdGVkLiBBbmQgaW4gZHJtLW5leHQgd2Ugbm93IGhhdmUg
c29tZQo+ID4gbmljZSBoZWxwZXJzIHRvIG1ha2Ugbm90IHVzaW5nIGFuIHVubG9hZCBob29rIGVh
c2llci4gUGxlYXNlIHJlZmFjdG9yIHBlcgo+ID4gZXhpc3RpbmcgZXhhbXBsZXMgYW5kIGdldCBy
aWQgb2YgeW91ciB1bmxvYWQgaG9vay4KPiAKPiBUaGFua3MsIGRvZXMgdGhpcyBjaGFuZ2UgbG9v
ayBhYm91dCByaWdodDoKCnl1cCwgbGd0bSwgYWNrLgotRGFuaWVsCgo+IAo+IC0tLS0tLS0tODwt
LS0tLS0tLQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBAQCAtMjIyLDE0
ICsyMjIsNiBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2ttc19kZWluaXQoc3RydWN0IGRybV9kZXZp
Y2UKPiAqZHJtKQo+ICAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKPiAgfQo+ICAKPiAt
c3RhdGljIGludCBtdGtfZHJtX3VubG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQo+IC17Cj4g
LQltdGtfZHJtX2ttc19kZWluaXQoZHJtKTsKPiAtCWRybS0+ZGV2X3ByaXZhdGUgPSBOVUxMOwo+
IC0KPiAtCXJldHVybiAwOwo+IC19Cj4gLQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3Bl
cmF0aW9ucyBtdGtfZHJtX2ZvcHMgPSB7Cj4gIAkub3duZXIgPSBUSElTX01PRFVMRSwKPiAgCS5v
cGVuID0gZHJtX29wZW4sCj4gQEAgLTI0Niw3ICsyMzgsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGZpbGVfb3BlcmF0aW9ucyBtdGtfZHJtX2ZvcHMgPSB7Cj4gIHN0YXRpYyBzdHJ1Y3QgZHJtX2Ry
aXZlciBtdGtfZHJtX2RyaXZlciA9IHsKPiAgCS5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfTU9E
RVNFVCB8IERSSVZFUl9HRU0gfCBEUklWRVJfUFJJTUUgfAo+ICAJCQkgICBEUklWRVJfQVRPTUlD
LAo+IC0JLnVubG9hZCA9IG10a19kcm1fdW5sb2FkLAo+ICAKPiAgCS5nZXRfdmJsYW5rX2NvdW50
ZXIgPSBkcm1fdmJsYW5rX2NvdW50LAo+ICAJLmVuYWJsZV92YmxhbmsgPSBtdGtfZHJtX2NydGNf
ZW5hYmxlX3ZibGFuaywKPiBAQCAtNDU1LDggKzQ0NiwxNCBAQCBlcnJfbm9kZToKPiAgc3RhdGlj
IGludCBtdGtfZHJtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4g
IAlzdHJ1Y3QgbXRrX2RybV9wcml2YXRlICpwcml2YXRlID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7Cj4gKwlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtID0gcHJpdmF0ZS0+ZHJtOwo+ICAJaW50
IGk7Cj4gIAo+ICsJZHJtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyX2FsbChkcm0pOwo+ICsJZHJtX2Rl
dl91bnJlZ2lzdGVyKGRybSk7Cj4gKwltdGtfZHJtX2ttc19kZWluaXQoZHJtKTsKPiArCWRybV9k
ZXZfdW5yZWYoZHJtKTsKPiArCj4gIAljb21wb25lbnRfbWFzdGVyX2RlbCgmcGRldi0+ZGV2LCAm
bXRrX2RybV9vcHMpOwo+ICAJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+ICAJb2Zf
bm9kZV9wdXQocHJpdmF0ZS0+bXV0ZXhfbm9kZSk7Cj4gLS0tLS0tLS0+OC0tLS0tLS0tCj4gCj4g
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IG10a19kcm1fZ2Vt
X3ZtX29wcyA9IHsKPiA+ID4gKwkub3BlbiA9IGRybV9nZW1fdm1fb3BlbiwKPiA+ID4gKwkuY2xv
c2UgPSBkcm1fZ2VtX3ZtX2Nsb3NlLAo+ID4gPiArfTsKPiA+IAo+ID4gRHJpdmUtYnkgcmV2aWV3
IEkganVzdCBzcG90dGVkOiBQbGVhc2UgdXNlIGRybV9nZW1fY21hX3ZtX29wcyBpbnN0ZWFkIG9m
Cj4gPiByb2xsaW5nIHlvdXIgb3duLgo+IAo+IEdvb2QgY2F0Y2gsIHdpbGwgcmVtb3ZlLgo+IAo+
IHJlZ2FyZHMKPiBQaGlsaXBwCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVl
ciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
