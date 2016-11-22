From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 1/2] bus: da8xx-mstpri: drop the call to
 of_flat_dt_get_machine_name()
Date: Tue, 22 Nov 2016 13:57:47 +0100
Message-ID: <1479819468-4016-2-git-send-email-bgolaszewski@baylibre.com>
References: <1479819468-4016-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1479819468-4016-1-git-send-email-bgolaszewski@baylibre.com>
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

SW4gb3JkZXIgdG8gYXZvaWQgYSBzZWN0aW9uIG1pc21hdGNoIHVzZSBhIGxvY2FsbHkgaW1wbGVt
ZW50ZWQgcm91dGluZQppbnN0ZWFkIG9mIG9mX2ZsYXRfZHRfZ2V0X21hY2hpbmVfbmFtZSgpIHdo
ZW4gcHJpbnRpbmcgdGhlIGVycm9yCm1lc3NhZ2UuCgpTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvYnVzL2Rh
OHh4LW1zdHByaS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQs
IDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9i
dXMvZGE4eHgtbXN0cHJpLmMgYi9kcml2ZXJzL2J1cy9kYTh4eC1tc3RwcmkuYwppbmRleCA4NWYw
YjUzLi5iZDM4MTcwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2J1cy9kYTh4eC1tc3RwcmkuYworKysg
Yi9kcml2ZXJzL2J1cy9kYTh4eC1tc3RwcmkuYwpAQCAtMTYsNyArMTYsNiBAQAogI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L2lvLmg+CiAjaW5jbHVk
ZSA8bGludXgvcmVnbWFwLmg+Ci0jaW5jbHVkZSA8bGludXgvb2ZfZmR0Lmg+CiAKIC8qCiAgKiBS
RVZJU0lUOiBMaW51eCBkb2Vzbid0IGhhdmUgYSBnb29kIGZyYW1ld29yayBmb3IgdGhlIGtpbmQg
b2YgcGVyZm9ybWFuY2UKQEAgLTE5MCw2ICsxODksMjUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
YTh4eF9tc3RwcmlfYm9hcmRfcHJpb3JpdGllcyBkYTh4eF9tc3RwcmlfYm9hcmRfY29uZnNbXSA9
IHsKIAl9LAogfTsKIAorLyoKKyAqIEZJWE1FIFJlbW92ZSB0aGlzIGZ1bmN0aW9uIG9uY2Ugb2Yv
YmFzZSBnZXRzIGEgZ2VuZXJhbCByb3V0aW5lIGZvciBnZXR0aW5nCisgKiB0aGUgbWFjaGluZSBt
b2RlbC9jb21wYXRpYmxlIHN0cmluZy4KKyAqLworc3RhdGljIGNvbnN0IGNoYXIgKmRhOHh4X21z
dHByaV9tYWNoaW5lX2dldF9jb21wYXRpYmxlKHZvaWQpCit7CisJc3RydWN0IGRldmljZV9ub2Rl
ICpyb290OworCWNvbnN0IGNoYXIgKmNvbXBhdGlibGU7CisJaW50IHJldCA9IC0xOworCisJcm9v
dCA9IG9mX2ZpbmRfbm9kZV9ieV9wYXRoKCIvIik7CisJaWYgKHJvb3QpIHsKKwkJcmV0ID0gb2Zf
cHJvcGVydHlfcmVhZF9zdHJpbmcocm9vdCwgImNvbXBhdGlibGUiLCAmY29tcGF0aWJsZSk7CisJ
CW9mX25vZGVfcHV0KHJvb3QpOworCX0KKworCXJldHVybiByZXQgPyBOVUxMIDogY29tcGF0aWJs
ZTsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkYTh4eF9tc3RwcmlfYm9hcmRfcHJpb3JpdGll
cyAqCiBkYTh4eF9tc3RwcmlfZ2V0X2JvYXJkX3ByaW8odm9pZCkKIHsKQEAgLTIyNyw3ICsyNDUs
NyBAQCBzdGF0aWMgaW50IGRhOHh4X21zdHByaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCXByaW9fbGlzdCA9IGRhOHh4X21zdHByaV9nZXRfYm9hcmRfcHJpbygpOwogCWlm
ICghcHJpb19saXN0KSB7CiAJCWRldl9lcnIoZGV2LCAibm8gbWFzdGVyIHByaW90aXRpZXMgZGVm
aW5lZCBmb3IgYm9hcmQgJyVzJ1xuIiwKLQkJCW9mX2ZsYXRfZHRfZ2V0X21hY2hpbmVfbmFtZSgp
KTsKKwkJCWRhOHh4X21zdHByaV9tYWNoaW5lX2dldF9jb21wYXRpYmxlKCkpOwogCQlyZXR1cm4g
LUVJTlZBTDsKIAl9CiAKLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
