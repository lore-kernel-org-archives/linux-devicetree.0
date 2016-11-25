From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/3] ARM: dts: da850: enable the memctrl and mstpri nodes per
 board
Date: Fri, 25 Nov 2016 17:03:15 +0100
Message-ID: <1480089795-29811-4-git-send-email-bgolaszewski@baylibre.com>
References: <1480089795-29811-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480089795-29811-1-git-send-email-bgolaszewski@baylibre.com>
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

Q3VycmVudGx5IHRoZSBtZW1vcnkgY29udHJvbGxlciBhbmQgbWFzdGVyIHByaW9yaXRpZXMgZHJp
dmVycyBhcmUKZW5hYmxlZCBpbiBkYTg1MC5kdHNpLiBGb3IgYm9hcmRzIGZvciB3aGljaCB0aGVy
ZSBhcmUgbm8gc2V0dGluZ3MKZGVmaW5lZCwgdGhpcyBtYWtlcyB0aGVzZSBkcml2ZXJzIGVtaXQg
ZXJyb3IgbWVzc2FnZXMuCgpEaXNhYmxlIHRoZSBub2RlcyBpbiBkYTg1MC5kdHNpIGFuZCBvbmx5
IGVuYWJsZSB0aGVtIGZvciBkYTg1MC1sY2RrIC0KdGhlIG9ubHkgYm9hcmQgdGhhdCBjdXJyZW50
bHkgbmVlZHMgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xh
c3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGNkay5k
dHMgfCA4ICsrKysrKysrCiBhcmNoL2FybS9ib290L2R0cy9kYTg1MC5kdHNpICAgICB8IDIgKysK
IDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJt
L2Jvb3QvZHRzL2RhODUwLWxjZGsuZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGNkay5k
dHMKaW5kZXggNjk1MmM2OC4uZDBmNzY4MCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
ZGE4NTAtbGNkay5kdHMKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAtbGNkay5kdHMKQEAg
LTI4NSwzICsyODUsMTEgQEAKIAkJcmVtb3RlLWVuZHBvaW50ID0gPCZ2Z2FfYnJpZGdlX2luPjsK
IAl9OwogfTsKKworJnByaWN0cmwgeworCXN0YXR1cyA9ICJva2F5IjsKK307CisKKyZtZW1jdHJs
IHsKKwlzdGF0dXMgPSAib2theSI7Cit9OwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMv
ZGE4NTAuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLmR0c2kKaW5kZXggOWI3YzQ0NC4u
MmVhMGUwNiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaQorKysgYi9h
cmNoL2FybS9ib290L2R0cy9kYTg1MC5kdHNpCkBAIC0yMTMsNiArMjEzLDcgQEAKIAkJcHJpY3Ry
bDogcHJpb3JpdHktY29udHJvbGxlckAxNDExMCB7CiAJCQljb21wYXRpYmxlID0gInRpLGRhODUw
LW1zdHByaSI7CiAJCQlyZWcgPSA8MHgxNDExMCAweDBjPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7CiAJCX07CiAJCWNmZ2NoaXA6IGNoaXAtY29udHJvbGxlckAxNDE3YyB7CiAJCQljb21wYXRp
YmxlID0gInRpLGRhODMwLWNmZ2NoaXAiLCAic3lzY29uIiwgInNpbXBsZS1tZmQiOwpAQCAtNDg2
LDUgKzQ4Nyw2IEBACiAJbWVtY3RybDogbWVtb3J5LWNvbnRyb2xsZXJAYjAwMDAwMDAgewogCQlj
b21wYXRpYmxlID0gInRpLGRhODUwLWRkci1jb250cm9sbGVyIjsKIAkJcmVnID0gPDB4YjAwMDAw
MDAgMHhlOD47CisJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJfTsKIH07Ci0tIAoyLjkuMwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
