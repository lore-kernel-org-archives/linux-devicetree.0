From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/6] drm: panfrost: add optional bus_clock
Date: Fri, 17 May 2019 15:07:32 -0500
Message-ID: <CAL_JsqKPazGn+g1zS4NMwvQZ_6GcAm0tgcOTqyQA0dz0+2dp3g@mail.gmail.com>
References: <20190517184659.18828-1-peron.clem@gmail.com>
 <20190517184659.18828-2-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190517184659.18828-2-peron.clem@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, Will Deacon <will.deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Steven Price <steven.price@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linux IOMMU <iommu@lists.linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTo0NyBQTSBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNs
ZW1AZ21haWwuY29tPiB3cm90ZToKPgo+IEFsbHdpbm5lciBINiBoYXMgYW4gQVJNIE1hbGktVDcy
MCBNUDIgd2hpY2ggcmVxdWlyZWQgYSBidXNfY2xvY2suCj4KPiBBZGQgYW4gb3B0aW9uYWwgYnVz
X2Nsb2NrIGF0IHRoZSBpbml0IG9mIHRoZSBwYW5mcm9zdCBkcml2ZXIuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCAyNSArKysrKysrKysrKysr
KysrKysrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCB8
ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCj4gaW5kZXgg
M2IyYmNlZDFiMDE1Li44ZGE2ZTYxMmQzODQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2RldmljZS5jCj4gQEAgLTQ0LDcgKzQ0LDggQEAgc3RhdGljIGludCBwYW5m
cm9zdF9jbGtfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKPgo+ICAgICAgICAg
cGZkZXYtPmNsb2NrID0gZGV2bV9jbGtfZ2V0KHBmZGV2LT5kZXYsIE5VTEwpOwo+ICAgICAgICAg
aWYgKElTX0VSUihwZmRldi0+Y2xvY2spKSB7Cj4gLSAgICAgICAgICAgICAgIGRldl9lcnIocGZk
ZXYtPmRldiwgImdldCBjbG9jayBmYWlsZWQgJWxkXG4iLCBQVFJfRVJSKHBmZGV2LT5jbG9jaykp
Owo+ICsgICAgICAgICAgICAgICBkZXZfZXJyKHBmZGV2LT5kZXYsICJnZXQgY2xvY2sgZmFpbGVk
ICVsZFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICBQVFJfRVJSKHBmZGV2LT5jbG9jaykp
OwoKUGxlYXNlIGRyb3AgdGhpcyB3aGl0ZXNwYWNlIGNoYW5nZS4KCj4gICAgICAgICAgICAgICAg
IHJldHVybiBQVFJfRVJSKHBmZGV2LT5jbG9jayk7Cj4gICAgICAgICB9Cj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
