From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 2/2] memory: da8xx-ddrctl: drop the call to
 of_flat_dt_get_machine_name()
Date: Wed, 23 Nov 2016 14:40:00 +0100
Message-ID: <1479908400-10136-3-git-send-email-bgolaszewski@baylibre.com>
References: <1479908400-10136-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1479908400-10136-1-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

SW4gb3JkZXIgdG8gYXZvaWQgYSBzZWN0aW9uIG1pc21hdGNoIGRyb3AgdGhlIGNhbGwgdG8Kb2Zf
ZmxhdF9kdF9nZXRfbWFjaGluZV9uYW1lKCkgd2hlbiBwcmludGluZyB0aGUgZXJyb3IgbWVzc2Fn
ZS4KClNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXls
aWJyZS5jb20+Ci0tLQogZHJpdmVycy9tZW1vcnkvZGE4eHgtZGRyY3RsLmMgfCA0ICstLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lbW9yeS9kYTh4eC1kZHJjdGwuYyBiL2RyaXZlcnMvbWVtb3J5L2RhOHh4LWRk
cmN0bC5jCmluZGV4IGEyMGU3YmIuLjAzMGFmYmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVtb3J5
L2RhOHh4LWRkcmN0bC5jCisrKyBiL2RyaXZlcnMvbWVtb3J5L2RhOHh4LWRkcmN0bC5jCkBAIC0x
NCw3ICsxNCw2IEBACiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgv
b2YuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KLSNpbmNsdWRlIDxsaW51eC9vZl9m
ZHQuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51
eC9pby5oPgogCkBAIC0xMTcsOCArMTE2LDcgQEAgc3RhdGljIGludCBkYTh4eF9kZHJjdGxfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCXNldHRpbmcgPSBkYTh4eF9kZHJj
dGxfZ2V0X2JvYXJkX3NldHRpbmdzKCk7CiAJaWYgKCFzZXR0aW5nKSB7Ci0JCWRldl9lcnIoZGV2
LCAibm8gc2V0dGluZ3MgZm9yIGJvYXJkICclcydcbiIsCi0JCQlvZl9mbGF0X2R0X2dldF9tYWNo
aW5lX25hbWUoKSk7CisJCWRldl9lcnIoZGV2LCAibm8gc2V0dGluZ3MgZGVmaW5lZCBmb3IgdGhp
cyBib2FyZFxuIik7CiAJCXJldHVybiAtRUlOVkFMOwogCX0KIAotLSAKMi45LjMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
