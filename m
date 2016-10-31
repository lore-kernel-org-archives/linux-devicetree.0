From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/5] ARM: dts: da850-lcdk: enable mstpri and ddrctl nodes
Date: Mon, 31 Oct 2016 15:45:37 +0100
Message-ID: <1477925138-23457-5-git-send-email-bgolaszewski@baylibre.com>
References: <1477925138-23457-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1477925138-23457-1-git-send-email-bgolaszewski@baylibre.com>
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
Cc: linux-devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>, arm-soc <linux-arm-kernel@lists.infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

RW5hYmxlIHRoZSBNU1RQUkkgY29uZmlndXJhdGlvbiBhbmQgRERSMi9tRERSIG1lbW9yeSBjb250
cm9sbGVyCm5vZGVzIG9uIGRhODUwLWxjZGsuIFRoaXMgaXMgbmVlZGVkIGluIG9yZGVyIHRvIGFk
anVzdCB0aGUgbWVtb3J5CnRocm91Z2hwdXQgY29uc3RyYWludHMgZm9yIGJldHRlciB0aWxjZGMg
c3VwcG9ydC4KClNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3Nr
aUBiYXlsaWJyZS5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGNkay5kdHMgfCA4
ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGNkay5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9kYTg1
MC1sY2RrLmR0cwppbmRleCA0NzQ3NjI5Li5iMzk3OTZlIDEwMDY0NAotLS0gYS9hcmNoL2FybS9i
b290L2R0cy9kYTg1MC1sY2RrLmR0cworKysgYi9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1sY2Rr
LmR0cwpAQCAtMjQzLDMgKzI0MywxMSBAQAogCQl9OwogCX07CiB9OworCismbXN0cHJpIHsKKwlz
dGF0dXMgPSAib2theSI7Cit9OworCismZGRyY3RsIHsKKwlzdGF0dXMgPSAib2theSI7Cit9Owot
LSAKMi45LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
