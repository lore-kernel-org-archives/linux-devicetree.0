From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/3] bus: da8xx-mstpri: drop the call to
 of_flat_dt_get_machine_name()
Date: Tue, 22 Nov 2016 11:41:50 +0100
Message-ID: <1479811311-3080-3-git-send-email-bgolaszewski@baylibre.com>
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
c3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2J1cy9kYTh4
eC1tc3RwcmkuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL2RhOHh4LW1zdHByaS5jIGIvZHJpdmVy
cy9idXMvZGE4eHgtbXN0cHJpLmMKaW5kZXggODVmMGI1My4uNDFjYmJlNiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9idXMvZGE4eHgtbXN0cHJpLmMKKysrIGIvZHJpdmVycy9idXMvZGE4eHgtbXN0cHJp
LmMKQEAgLTIyNyw3ICsyMjcsNyBAQCBzdGF0aWMgaW50IGRhOHh4X21zdHByaV9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXByaW9fbGlzdCA9IGRhOHh4X21zdHByaV9nZXRf
Ym9hcmRfcHJpbygpOwogCWlmICghcHJpb19saXN0KSB7CiAJCWRldl9lcnIoZGV2LCAibm8gbWFz
dGVyIHByaW90aXRpZXMgZGVmaW5lZCBmb3IgYm9hcmQgJyVzJ1xuIiwKLQkJCW9mX2ZsYXRfZHRf
Z2V0X21hY2hpbmVfbmFtZSgpKTsKKwkJCW9mX21hY2hpbmVfZ2V0X2NvbXBhdGlibGUoKSk7CiAJ
CXJldHVybiAtRUlOVkFMOwogCX0KIAotLSAKMi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
