From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 3/5] ARM: dts: da850: add the mstpri and ddrctl nodes
Date: Mon, 31 Oct 2016 15:45:36 +0100
Message-ID: <1477925138-23457-4-git-send-email-bgolaszewski@baylibre.com>
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

QWRkIHRoZSBub2RlcyBmb3IgdGhlIE1TVFBSSSBjb25maWd1cmF0aW9uIGFuZCBERFIyL21ERFIg
bWVtb3J5CmNvbnRyb2xsZXIgZHJpdmVycyB0byBkYTg1MC5kdHNpLgoKU2lnbmVkLW9mZi1ieTog
QmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBhcmNo
L2FybS9ib290L2R0cy9kYTg1MC5kdHNpIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAu
ZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLmR0c2kKaW5kZXggMTEyYzZkNy4uNDRiZWNl
MyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9kYTg1MC5kdHNpCkBAIC00NTQsNiArNDU0LDEyIEBACiAJCQlpbnRlcnJ1cHRz
ID0gPDUyPjsKIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAJCX07CisKKwkJbXN0cHJpOiBtc3Rw
cmlAMTQxMTAgeworCQkJY29tcGF0aWJsZSA9ICJ0aSxkYTg1MC1tc3RwcmkiOworCQkJcmVnID0g
PDB4MTQxMTAgMHgwYz47CisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOworCQl9OwogCX07CiAJYWVt
aWY6IGFlbWlmQDY4MDAwMDAwIHsKIAkJY29tcGF0aWJsZSA9ICJ0aSxkYTg1MC1hZW1pZiI7CkBA
IC00NjUsNCArNDcxLDkgQEAKIAkJCSAgMSAwIDB4NjgwMDAwMDAgMHgwMDAwODAwMD47CiAJCXN0
YXR1cyA9ICJkaXNhYmxlZCI7CiAJfTsKKwlkZHJjdGw6IGRkcmN0bEBiMDAwMDAwMCB7CisJCWNv
bXBhdGlibGUgPSAidGksZGE4NTAtZGRyLWNvbnRyb2xsZXIiOworCQlyZWcgPSA8MHhiMDAwMDAw
MCAweGU4PjsKKwkJc3RhdHVzID0gImRpc2FibGVkIjsKKwl9OwogfTsKLS0gCjIuOS4zCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
