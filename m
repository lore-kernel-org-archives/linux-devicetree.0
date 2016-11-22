From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 2/2] memory: da8xx-ddrctl: drop the call to
 of_flat_dt_get_machine_name()
Date: Tue, 22 Nov 2016 13:57:48 +0100
Message-ID: <1479819468-4016-3-git-send-email-bgolaszewski@baylibre.com>
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
bGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvbWVtb3J5
L2RhOHh4LWRkcmN0bC5jIHwgMjIgKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZW1vcnkvZGE4eHgtZGRyY3RsLmMgYi9kcml2ZXJzL21lbW9yeS9kYTh4eC1kZHJjdGwuYwpp
bmRleCBhMjBlN2JiLi5lZTBjMjY2IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lbW9yeS9kYTh4eC1k
ZHJjdGwuYworKysgYi9kcml2ZXJzL21lbW9yeS9kYTh4eC1kZHJjdGwuYwpAQCAtMTQsNyArMTQs
NiBAQAogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAj
aW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+Ci0jaW5jbHVkZSA8bGludXgvb2ZfZmR0Lmg+CiAj
aW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvaW8uaD4K
IApAQCAtNzEsNiArNzAsMjUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkYTh4eF9kZHJjdGxfYm9h
cmRfc2V0dGluZ3MgZGE4eHhfZGRyY3RsX2JvYXJkX2NvbmZzW10gPSB7CiAJfSwKIH07CiAKKy8q
CisgKiBGSVhNRSBSZW1vdmUgdGhpcyBmdW5jdGlvbiBvbmNlIG9mL2Jhc2UgZ2V0cyBhIGdlbmVy
YWwgcm91dGluZSBmb3IgZ2V0dGluZworICogdGhlIG1hY2hpbmUgbW9kZWwvY29tcGF0aWJsZSBz
dHJpbmcuCisgKi8KK3N0YXRpYyBjb25zdCBjaGFyICpkYTh4eF9kZHJjdGxfbWFjaGluZV9nZXRf
Y29tcGF0aWJsZSh2b2lkKQoreworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcm9vdDsKKwljb25zdCBj
aGFyICpjb21wYXRpYmxlOworCWludCByZXQgPSAtMTsKKworCXJvb3QgPSBvZl9maW5kX25vZGVf
YnlfcGF0aCgiLyIpOworCWlmIChyb290KSB7CisJCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfc3Ry
aW5nKHJvb3QsICJjb21wYXRpYmxlIiwgJmNvbXBhdGlibGUpOworCQlvZl9ub2RlX3B1dChyb290
KTsKKwl9CisKKwlyZXR1cm4gcmV0ID8gTlVMTCA6IGNvbXBhdGlibGU7Cit9CisKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZGE4eHhfZGRyY3RsX2NvbmZpZ19rbm9iICoKIGRhOHh4X2RkcmN0bF9tYXRj
aF9rbm9iKGNvbnN0IHN0cnVjdCBkYTh4eF9kZHJjdGxfc2V0dGluZyAqc2V0dGluZykKIHsKQEAg
LTExOCw3ICsxMzYsNyBAQCBzdGF0aWMgaW50IGRhOHh4X2RkcmN0bF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCXNldHRpbmcgPSBkYTh4eF9kZHJjdGxfZ2V0X2JvYXJkX3Nl
dHRpbmdzKCk7CiAJaWYgKCFzZXR0aW5nKSB7CiAJCWRldl9lcnIoZGV2LCAibm8gc2V0dGluZ3Mg
Zm9yIGJvYXJkICclcydcbiIsCi0JCQlvZl9mbGF0X2R0X2dldF9tYWNoaW5lX25hbWUoKSk7CisJ
CQlkYTh4eF9kZHJjdGxfbWFjaGluZV9nZXRfY29tcGF0aWJsZSgpKTsKIAkJcmV0dXJuIC1FSU5W
QUw7CiAJfQogCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
