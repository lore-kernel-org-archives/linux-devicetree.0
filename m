From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 1/6] misc: sram: fix error path in sram_probe
Date: Fri, 05 Jul 2013 16:23:23 +0200
Message-ID: <1373034203.3935.31.camel@pizza.hi.pengutronix.de>
References: <201307051440.19428.heiko@sntech.de>
 <201307051440.53993.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201307051440.53993.heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
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
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

QW0gRnJlaXRhZywgZGVuIDA1LjA3LjIwMTMsIDE0OjQwICswMjAwIHNjaHJpZWIgSGVpa28gU3TD
vGJuZXI6Cj4gVGhlIHBvb2wgaXMgY3JlYXRlZCB0aHJ1IGRldm1fZ2VuX3Bvb2xfY3JlYXRlLCBz
byB0aGUgY2FsbCB0bwo+IGdlbl9wb29sX2Rlc3Ryb3kgaXMgbm90IG5lY2Vzc2FyeS4KPiBJbnN0
ZWFkIHRoZSBzcmFtLWNsb2NrIG11c3QgYmUgdHVybmVkIG9mZiBhZ2FpbiBpZiBpdCBleGlzdHMu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBU
ZXN0ZWQtYnk6IFVscmljaCBQcmlueiA8dWxyaWNoLnByaW56QGdvb2dsZW1haWwuY29tPgoKQWNr
ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cgo+IC0tLQo+ICBk
cml2ZXJzL21pc2Mvc3JhbS5jIHwgICAgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2Mvc3Jh
bS5jIGIvZHJpdmVycy9taXNjL3NyYW0uYwo+IGluZGV4IGQ4N2NjOTEuLmFmZTY2NTcxIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbWlzYy9zcmFtLmMKPiArKysgYi9kcml2ZXJzL21pc2Mvc3JhbS5j
Cj4gQEAgLTY4LDcgKzY4LDggQEAgc3RhdGljIGludCBzcmFtX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gIAlyZXQgPSBnZW5fcG9vbF9hZGRfdmlydChzcmFtLT5wb29sLCAo
dW5zaWduZWQgbG9uZyl2aXJ0X2Jhc2UsCj4gIAkJCQlyZXMtPnN0YXJ0LCBzaXplLCAtMSk7Cj4g
IAlpZiAocmV0IDwgMCkgewo+IC0JCWdlbl9wb29sX2Rlc3Ryb3koc3JhbS0+cG9vbCk7Cj4gKwkJ
aWYgKHNyYW0tPmNsaykKPiArCQkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHNyYW0tPmNsayk7Cj4g
IAkJcmV0dXJuIHJldDsKPiAgCX0KPiAgCgpyZWdhcmRzClBoaWxpcHAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmljZXRyZWUtZGlzY3VzcyBtYWls
aW5nIGxpc3QKZGV2aWNldHJlZS1kaXNjdXNzQGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0
cy5vemxhYnMub3JnL2xpc3RpbmZvL2RldmljZXRyZWUtZGlzY3Vzcwo=
