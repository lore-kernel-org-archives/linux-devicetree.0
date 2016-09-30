From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v5 1/5] drm/sun4i: rgb: Remove the bridge enable/disable
 functions
Date: Fri, 30 Sep 2016 16:37:05 +0200
Message-ID: <20160930143709.1388-2-maxime.ripard@free-electrons.com>
References: <20160930143709.1388-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160930143709.1388-1-maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Archit Taneja <architt@codeaurora.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIGF0b21pYyBoZWxwZXJzIGFscmVhZHkgY2FsbCB0aGUgZHJtX2JyaWRnZV9lbmFibGUgb24g
b3VyIGJlaGFsZiwKdGhlcmUncyBubyBuZWVkIHRvIGRvIGl0IGEgc2Vjb25kIHRpbWUuCgpSZXBv
cnRlZC1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6
IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9yZ2IuYyB8IDYgLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NGlfcmdiLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfcmdiLmMKaW5kZXggNGU0YmVh
NmYzOTVjLi5kMTk4YWQ3ZTUzMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9z
dW40aV9yZ2IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfcmdiLmMKQEAgLTE1
NSw5ICsxNTUsNiBAQCBzdGF0aWMgdm9pZCBzdW40aV9yZ2JfZW5jb2Rlcl9lbmFibGUoc3RydWN0
IGRybV9lbmNvZGVyICplbmNvZGVyKQogCWlmICghSVNfRVJSKHRjb24tPnBhbmVsKSkKIAkJZHJt
X3BhbmVsX3ByZXBhcmUodGNvbi0+cGFuZWwpOwogCi0JLyogZW5jb2Rlci0+YnJpZGdlIGNhbiBi
ZSBOVUxMOyBkcm1fYnJpZGdlX2VuYWJsZSBjaGVja3MgZm9yIGl0ICovCi0JZHJtX2JyaWRnZV9l
bmFibGUoZW5jb2Rlci0+YnJpZGdlKTsKLQogCXN1bjRpX3Rjb25fY2hhbm5lbF9lbmFibGUodGNv
biwgMCk7CiAKIAlpZiAoIUlTX0VSUih0Y29uLT5wYW5lbCkpCkBAIC0xNzcsOSArMTc0LDYgQEAg
c3RhdGljIHZvaWQgc3VuNGlfcmdiX2VuY29kZXJfZGlzYWJsZShzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIpCiAKIAlzdW40aV90Y29uX2NoYW5uZWxfZGlzYWJsZSh0Y29uLCAwKTsKIAotCS8q
IGVuY29kZXItPmJyaWRnZSBjYW4gYmUgTlVMTDsgZHJtX2JyaWRnZV9kaXNhYmxlIGNoZWNrcyBm
b3IgaXQgKi8KLQlkcm1fYnJpZGdlX2Rpc2FibGUoZW5jb2Rlci0+YnJpZGdlKTsKLQogCWlmICgh
SVNfRVJSKHRjb24tPnBhbmVsKSkKIAkJZHJtX3BhbmVsX3VucHJlcGFyZSh0Y29uLT5wYW5lbCk7
CiB9Ci0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
