From: Jyri Sarha <jsarha@ti.com>
Subject: [PATCH v4 1/8] drm/tilcdc: Remove
 drm_helper_disable_unused_functions() call
Date: Thu, 1 Sep 2016 12:09:05 +0300
Message-ID: <1a33932c42a976bef3168fca50d20740f17c54e3.1472719892.git.jsarha@ti.com>
References: <cover.1472719892.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.1472719892.git.jsarha@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, bcousson@baylibre.com, tony@atomide.com, linux-arm-kernel@lists.infradead.org
Cc: Jyri Sarha <jsarha@ti.com>, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com, kbeldan@baylibre.com, laurent.pinchart@ideasonboard.com
List-Id: devicetree@vger.kernel.org

ZHJtX2hlbHBlcl9kaXNhYmxlX3VudXNlZF9mdW5jdGlvbnMoKSBzaG91bGQgbm90IGJlIGNhbGxl
ZCBieSBhdG9taWMKZHJpdmVycy4KClNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0
aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMgfCAyIC0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vdGlsY2RjL3RpbGNkY19kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Ry
di5jCmluZGV4IDM0MDRkMjQuLmU0NWMyNjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
aWxjZGMvdGlsY2RjX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX2Ry
di5jCkBAIC0zNjEsOCArMzYxLDYgQEAgc3RhdGljIGludCB0aWxjZGNfbG9hZChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGZsYWdzKQogCQkJYnJlYWs7CiAJfQogCi0JZHJt
X2hlbHBlcl9kaXNhYmxlX3VudXNlZF9mdW5jdGlvbnMoZGV2KTsKLQogCWRybV9tb2RlX2NvbmZp
Z19yZXNldChkZXYpOwogCiAJcHJpdi0+ZmJkZXYgPSBkcm1fZmJkZXZfY21hX2luaXQoZGV2LCBi
cHAsCi0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
