From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/tilcdc: Remove obsolete "ti, tilcdc,
 slave" dts binding support
Date: Mon, 13 Nov 2017 16:40:00 -0600
Message-ID: <CAL_JsqK3trv8zZpzXm+KZc2fs=fUAV7jvU5tCCjHSO_4TsOiaA@mail.gmail.com>
References: <1510576927-4023-1-git-send-email-jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1510576927-4023-1-git-send-email-jsarha@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jyri Sarha <jsarha@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@kernel.org>, Stephen Boyd <stephen.boyd@linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benoit Cousson <bcousson@baylibre.com>, Frank Rowand <frank.rowand@sony.com>
List-Id: devicetree@vger.kernel.org

T24gTW9uLCBOb3YgMTMsIDIwMTcgYXQgNjo0MiBBTSwgSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNv
bT4gd3JvdGU6Cj4gVGhpcyBwYXRjaCByZW1vdmVzIERSTV9USUxDRENfU0xBVkVfQ09NUEFUIG9w
dGlvbiBmb3Igc3VwcG9ydGluZyB0aGUKPiBvYnNvbGV0ZSAidGksdGlsY2RjLHNsYXZlIiBkZXZp
Y2UgdHJlZSBiaW5kaW5nLiBUaGUgbmV3IG9mX2dyYXBoIGJhc2VkCj4gYmluZGluZyAtIHRoYXQg
aXMgd2lkZWx5IHVzZWQgaW4gb3RoZXIgZHJtIGRyaXZlciB0b28gLSBoYXMgYmVlbgo+IHN1cHBv
cnRlZCBzaW5jZSBMaW51eCB2NC4yLiBNYWludGFpbmluZyB0aGUgdGhlIGJhY2t3YXJkcyBkdHMK
PiBjb252ZXJzaW9uIGNvZGUgaW4gMHRoZSBEUk1fVElMQ0RDX1NMQVZFX0NPTVBBVCBoYXMgYmVj
b21lIGEgbnVpc2FuY2UKPiBmb3IgdGhlIGRldmljZS9vZiBkZXZlbG9wbWVudCBzbyB0aGUgd2Ug
ZGVjaWRlZCB0byBkcm9wIGl0IGFmdGVyIExpbnV4Cj4gdjQuMTQsIHRoZSAyMDE3IExUUy4KPgo+
IFNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS90aWxjZGMvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgMTEgLQo+ICBkcml2
ZXJzL2dwdS9kcm0vdGlsY2RjL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAzIC0KPiAgZHJp
dmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfc2xhdmVfY29tcGF0LmMgICB8IDI2OSAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3NsYXZl
X2NvbXBhdC5kdHMgfCAgNzIgLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNk
Y19zbGF2ZV9jb21wYXQuaCAgIHwgIDI1IC0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDM4MCBkZWxl
dGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGls
Y2RjX3NsYXZlX2NvbXBhdC5jCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
dGlsY2RjL3RpbGNkY19zbGF2ZV9jb21wYXQuZHRzCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19zbGF2ZV9jb21wYXQuaAoKQWNrZWQtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
