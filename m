From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/6] drm: of: introduce drm_of_media_bus_fmt
Date: Thu, 19 Apr 2018 11:22:38 -0500
Message-ID: <CAL_JsqL1=fzTb5dUgrj07Jv3r026ndsU2o=Nr2eft-bni5jueQ@mail.gmail.com>
References: <20180417131052.16336-1-peda@axentia.se>
 <20180417131052.16336-4-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180417131052.16336-4-peda@axentia.se>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Peter Rosin <peda@axentia.se>
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gVHVlLCBBcHIgMTcsIDIwMTggYXQgODoxMCBBTSwgUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRp
YS5zZT4gd3JvdGU6Cj4gQWRkIGEgY2VudHJhbCBmdW5jdGlvbiB0byBwYXJzZSBhIG5vZGUgYWNj
b3JkaW5nIHRvIHRoZSB2aWRlbwo+IGludGVyZmFjZSBiaW5kaW5nIGFuZCBnZXQgYSBtZWRpYSBi
dXMgZm9ybWF0Lgo+Cj4gU3RhcnQgd2l0aCBvbmx5IHN1cHBvcnRpbmcgYSB2ZXJ5IGxpbWl0ZWQg
c2V0IG9mIGEgZmV3IGJhc2ljIG1lZGlhCj4gYnVzIGZvcm1hdHMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX29mLmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBp
bmNsdWRlL2RybS9kcm1fb2YuaCAgICAgfCAgNyArKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2Yu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYwo+IGluZGV4IDRjMTkxYzA1MGU3ZC4uZjk0NzNl
ZGI2MGE3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fb2YuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fb2YuYwo+IEBAIC0yMTIsNiArMjEyLDQ0IEBAIGludCBkcm1fb2Zf
ZW5jb2Rlcl9hY3RpdmVfZW5kcG9pbnQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+ICBFWFBP
UlRfU1lNQk9MX0dQTChkcm1fb2ZfZW5jb2Rlcl9hY3RpdmVfZW5kcG9pbnQpOwo+Cj4gIC8qCj4g
KyAqIGRybV9vZl9tZWRpYV9idXNfZm10IC0gcmV0dXJuIHRoZSBtZWRpYSBidXMgZm9ybWF0IGRl
c2NyaWJlZCBpbiB0aGUgbm9kZQo+ICsgKiBAbm9kZTogZGV2aWNlIHRyZWUgbm9kZSBjb250YWlu
aW5nIHRoZSBtZWRpYSBidXMgZm9ybWF0Cj4gKyAqCj4gKyAqIEBub2RlIGlzIHByZXN1bWFibHkg
YW4gb2YtZ3JhcGggZW5kcG9pbnQgbm9kZS4KPiArICoKPiArICogUmV0dXJuIHRoZSBtZWRpYSBi
dXMgZm9ybWF0LCBvciB6ZXJvIGlmIG5vbmUgaXMgZGVzY3JpYmVkLiBPciBvbmUgb2YgdGhlCj4g
KyAqIHN0YW5kYXJkIGVycm9yIGNvZGVzLgo+ICsgKi8KPiAraW50IGRybV9vZl9tZWRpYV9idXNf
Zm10KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKClNob3VsZCB1c2UgZW5kcG9pbnQgb3IgZXAg
aGVyZSBpbnN0ZWFkIG9mIG5vZGUgdG8gYmUgY2xlYXIgd2hhdCBub2RlCnRoaXMgZnVuY3Rpb24g
b3BlcmF0ZXMgb24uCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
