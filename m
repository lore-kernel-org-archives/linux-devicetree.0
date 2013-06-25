From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 1/6] misc: sram: fix error path in sram_probe
Date: Tue, 25 Jun 2013 11:04:34 +0200
Message-ID: <1372151074.3981.21.camel@pizza.hi.pengutronix.de>
References: <201306251046.04873.heiko@sntech.de>
 <201306251046.38993.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201306251046.38993.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

SGkgSGVpa28sCgpBbSBEaWVuc3RhZywgZGVuIDI1LjA2LjIwMTMsIDEwOjQ2ICswMjAwIHNjaHJp
ZWIgSGVpa28gU3TDvGJuZXI6Cj4gVGhlIHBvb2wgaXMgY3JlYXRlZCB0aHJ1IGRldm1fZ2VuX3Bv
b2xfY3JlYXRlLCBzbyB0aGUgY2FsbCB0bwo+IGdlbl9wb29sX2Rlc3Ryb3kgaXMgbm90IG5lY2Vz
c2FyeS4KPiBJbnN0ZWFkIHRoZSBzcmFtLWNsb2NrIG11c3QgYmUgdHVybmVkIG9mZiBhZ2FpbiBp
ZiBpdCBleGlzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4KPiAtLS0KPiAgZHJpdmVycy9taXNjL3NyYW0uYyB8ICAgIDMgKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9taXNjL3NyYW0uYyBiL2RyaXZlcnMvbWlzYy9zcmFtLmMKPiBpbmRleCBkODdj
YzkxLi5hZmU2NjU3MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21pc2Mvc3JhbS5jCj4gKysrIGIv
ZHJpdmVycy9taXNjL3NyYW0uYwo+IEBAIC02OCw3ICs2OCw4IEBAIHN0YXRpYyBpbnQgc3JhbV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJcmV0ID0gZ2VuX3Bvb2xfYWRk
X3ZpcnQoc3JhbS0+cG9vbCwgKHVuc2lnbmVkIGxvbmcpdmlydF9iYXNlLAo+ICAJCQkJcmVzLT5z
dGFydCwgc2l6ZSwgLTEpOwo+ICAJaWYgKHJldCA8IDApIHsKPiAtCQlnZW5fcG9vbF9kZXN0cm95
KHNyYW0tPnBvb2wpOwoKUmlnaHQsIHRoYW5rcy4KCj4gKwkJaWYgKHNyYW0tPmNsaykKPiArCQkJ
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNyYW0tPmNsayk7Cj4gIAkJcmV0dXJuIHJldDsKPiAgCX0K
PiAgCgpJbiBsaWdodCBvZiB0aGUgZm9sbG93aW5nIHBhdGNoLCBJJ2QgcmF0aGVyIG1vdmUgdGhl
CmNsa19wcmVwYXJlX2VuYWJsZSgpIGNhbGwgYWZ0ZXIgZ2VuX3Bvb2xfYWRkX3ZpcnQoKSBhbmQg
aXRzIGVycm9yIHBhdGguCgpyZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRldmljZXRyZWUtZGlzY3VzcyBtYWlsaW5nIGxpc3QK
ZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMu
b3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vzcwo=
