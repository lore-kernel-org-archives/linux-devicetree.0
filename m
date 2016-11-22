From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/3] memory: da8xx-ddrctl: drop the call to
 of_flat_dt_get_machine_name()
Date: Tue, 22 Nov 2016 11:41:51 +0100
Message-ID: <1479811311-3080-4-git-send-email-bgolaszewski@baylibre.com>
References: <1479811311-3080-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1479811311-3080-1-git-send-email-bgolaszewski@baylibre.com>
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

SW4gb3JkZXIgdG8gYXZvaWQgYSBzZWN0aW9uIG1pc21hdGNoIHVzZSBvZl9tYWNoaW5lX2dldF9j
b21wYXRpYmxlKCkKaW5zdGVhZCBvZiBvZl9mbGF0X2R0X2dldF9tYWNoaW5lX25hbWUoKSB3aGVu
IHByaW50aW5nIHRoZSBlcnJvcgptZXNzYWdlLgoKU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL21lbW9yeS9k
YTh4eC1kZHJjdGwuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L2RhOHh4LWRkcmN0bC5jIGIv
ZHJpdmVycy9tZW1vcnkvZGE4eHgtZGRyY3RsLmMKaW5kZXggYTIwZTdiYi4uMTc5ZjUwNSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tZW1vcnkvZGE4eHgtZGRyY3RsLmMKKysrIGIvZHJpdmVycy9tZW1v
cnkvZGE4eHgtZGRyY3RsLmMKQEAgLTExOCw3ICsxMTgsNyBAQCBzdGF0aWMgaW50IGRhOHh4X2Rk
cmN0bF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXNldHRpbmcgPSBkYTh4
eF9kZHJjdGxfZ2V0X2JvYXJkX3NldHRpbmdzKCk7CiAJaWYgKCFzZXR0aW5nKSB7CiAJCWRldl9l
cnIoZGV2LCAibm8gc2V0dGluZ3MgZm9yIGJvYXJkICclcydcbiIsCi0JCQlvZl9mbGF0X2R0X2dl
dF9tYWNoaW5lX25hbWUoKSk7CisJCQlvZl9tYWNoaW5lX2dldF9jb21wYXRpYmxlKCkpOwogCQly
ZXR1cm4gLUVJTlZBTDsKIAl9CiAKLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
