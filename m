From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v7 2/5] drm: bridge: add DT bindings for TI ths8135
Date: Wed, 14 Dec 2016 10:34:46 +0530
Message-ID: <7ed24ce8-2498-b97b-05e7-7bc9ae372167@codeaurora.org>
References: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
 <1481623759-12786-3-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1481623759-12786-3-git-send-email-bgolaszewski@baylibre.com>
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

SGksCgpPbiAxMi8xMy8yMDE2IDAzOjM5IFBNLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+
IFRIUzgxMzUgaXMgYSBjb25maWd1cmFibGUgdmlkZW8gREFDLiBBZGQgRFQgYmluZGluZ3MgZm9y
IHRoaXMgY2hpcC4KClF1ZXVlZCB0byBkcm0tbWlzYy1uZXh0Cj4KPiBTaWduZWQtb2ZmLWJ5OiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IFJldmlld2Vk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIC4uLi9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSx0aHM4MTM1LnR4dCAgICAgICAgIHwgNDYgKysrKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL3RpLHRoczgxMzUudHh0Cj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHRoczgxMzUudHh0IGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHRoczgxMzUudHh0
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi42ZWMxYTg4Cj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS90aSx0aHM4MTM1LnR4dAo+IEBAIC0wLDAgKzEsNDYgQEAKPiArVEhTODEzNSBWaWRl
byBEQUMKPiArLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK1RoaXMgaXMgdGhlIGJpbmRpbmcgZm9y
IFRleGFzIEluc3RydW1lbnRzIFRIUzgxMzUgVmlkZW8gREFDIGJyaWRnZS4KPiArCj4gK1JlcXVp
cmVkIHByb3BlcnRpZXM6Cj4gKwo+ICstIGNvbXBhdGlibGU6IE11c3QgYmUgInRpLHRoczgxMzUi
Cj4gKwo+ICtSZXF1aXJlZCBub2RlczoKPiArCj4gK1RoaXMgZGV2aWNlIGhhcyB0d28gdmlkZW8g
cG9ydHMuIFRoZWlyIGNvbm5lY3Rpb25zIGFyZSBtb2RlbGxlZCB1c2luZyB0aGUgT0YKPiArZ3Jh
cGggYmluZGluZ3Mgc3BlY2lmaWVkIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncmFwaC50eHQuCj4gKwo+ICstIFZpZGVvIHBvcnQgMCBmb3IgUkdCIGlucHV0Cj4gKy0gVmlk
ZW8gcG9ydCAxIGZvciBWR0Egb3V0cHV0Cj4gKwo+ICtFeGFtcGxlCj4gKy0tLS0tLS0KPiArCj4g
K3ZnYS1icmlkZ2Ugewo+ICsJY29tcGF0aWJsZSA9ICJ0aSx0aHM4MTM1IjsKPiArCSNhZGRyZXNz
LWNlbGxzID0gPDE+Owo+ICsJI3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsJcG9ydHMgewo+ICsJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJCSNzaXplLWNlbGxzID0gPDA+Owo+ICsKPiArCQlw
b3J0QDAgewo+ICsJCQlyZWcgPSA8MD47Cj4gKwo+ICsJCQl2Z2FfYnJpZGdlX2luOiBlbmRwb2lu
dCB7Cj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmxjZGNfb3V0X3ZnYT47Cj4gKwkJCX07Cj4g
KwkJfTsKPiArCj4gKwkJcG9ydEAxIHsKPiArCQkJcmVnID0gPDE+Owo+ICsKPiArCQkJdmdhX2Jy
aWRnZV9vdXQ6IGVuZHBvaW50IHsKPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmdmdhX2Nvbl9p
bj47Cj4gKwkJCX07Cj4gKwkJfTsKPiArCX07Cj4gK307Cj4KCi0tIApRdWFsY29tbSBJbm5vdmF0
aW9uIENlbnRlciwgSW5jLiBpcyBhIG1lbWJlciBvZiBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51
eCBGb3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
