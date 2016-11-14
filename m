From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/2] ARM: dts: da850: add the mstpri and ddrctl nodes
Date: Mon, 14 Nov 2016 18:32:03 +0100
Message-ID: <1479144724-14231-2-git-send-email-bgolaszewski@baylibre.com>
References: <1479144724-14231-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1479144724-14231-1-git-send-email-bgolaszewski@baylibre.com>
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

QWRkIHRoZSBub2RlcyBmb3IgdGhlIE1TVFBSSSBjb25maWd1cmF0aW9uIGFuZCBERFIyL21ERFIg
bWVtb3J5CmNvbnRyb2xsZXIgZHJpdmVycyB0byBkYTg1MC5kdHNpLgoKU2lnbmVkLW9mZi1ieTog
QmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBhcmNo
L2FybS9ib290L2R0cy9kYTg1MC5kdHNpIHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC5kdHNp
IGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaQppbmRleCAxYmIxZjZkLi4xNjM1MjE4IDEw
MDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC5kdHNpCisrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2RhODUwLmR0c2kKQEAgLTQ0MCw2ICs0NDAsMTEgQEAKIAkJCWludGVycnVwdHMgPSA8
NTI+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKKworCQltc3Rwcmk6IG1zdHByaUAx
NDExMCB7CisJCQljb21wYXRpYmxlID0gInRpLGRhODUwLW1zdHByaSI7CisJCQlyZWcgPSA8MHgx
NDExMCAweDBjPjsKKwkJfTsKIAl9OwogCWFlbWlmOiBhZW1pZkA2ODAwMDAwMCB7CiAJCWNvbXBh
dGlibGUgPSAidGksZGE4NTAtYWVtaWYiOwpAQCAtNDUxLDQgKzQ1Niw4IEBACiAJCQkgIDEgMCAw
eDY4MDAwMDAwIDB4MDAwMDgwMDA+OwogCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwogCX07CisJZGRy
Y3RsOiBkZHJjdGxAYjAwMDAwMDAgeworCQljb21wYXRpYmxlID0gInRpLGRhODUwLWRkci1jb250
cm9sbGVyIjsKKwkJcmVnID0gPDB4YjAwMDAwMDAgMHhlOD47CisJfTsKIH07Ci0tIAoyLjkuMwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
