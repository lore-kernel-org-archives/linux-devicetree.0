From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v7 3/5] drm: bridge: add support for TI ths8135
Date: Wed, 14 Dec 2016 10:35:06 +0530
Message-ID: <dbb47a8f-07be-19d6-e77b-f5c06fd39c61@codeaurora.org>
References: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
 <1481623759-12786-4-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1481623759-12786-4-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-devicetree <devicetree@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

CgpPbiAxMi8xMy8yMDE2IDAzOjM5IFBNLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+IFRI
UzgxMzUgaXMgYSBjb25maWd1cmFibGUgdmlkZW8gREFDLCBidXQgbm8gY29uZmlndXJhdGlvbiBp
cyBhY3R1YWxseQo+IG5lY2Vzc2FyeSB0byBtYWtlIGl0IHdvcmsuCj4KPiBGb3Igbm93IHVzZSB0
aGUgZHVtYi12Z2EtZGFjIGRyaXZlciB0byBzdXBwb3J0IGl0LgoKUXVldWVkIHRvIGRybS1taXNj
LW5leHQKCkFyY2hpdAoKPgo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJn
b2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQg
PGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2R1bWItdmdh
LWRhYy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYwo+IGluZGV4IGU1
NzA2OTguLjg2ZTlmOWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1i
LXZnYS1kYWMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMK
PiBAQCAtMjM3LDYgKzIzNyw3IEBAIHN0YXRpYyBpbnQgZHVtYl92Z2FfcmVtb3ZlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgZHVtYl92Z2FfbWF0Y2hbXSA9IHsKPiAgCXsgLmNvbXBhdGlibGUgPSAiZHVtYi12Z2EtZGFj
IiB9LAo+ICsJeyAuY29tcGF0aWJsZSA9ICJ0aSx0aHM4MTM1IiB9LAo+ICAJe30sCj4gIH07Cj4g
IE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGR1bWJfdmdhX21hdGNoKTsKPgoKLS0gClF1YWxjb21t
IElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZvcnVt
LAphIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
