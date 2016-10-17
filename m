From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/3] ARM: dts: da850: add the syscfg and ddrctl nodes
Date: Mon, 17 Oct 2016 18:30:50 +0200
Message-ID: <1476721850-454-4-git-send-email-bgolaszewski@baylibre.com>
References: <1476721850-454-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1476721850-454-1-git-send-email-bgolaszewski@baylibre.com>
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

QWRkIHRoZSBub2RlcyBmb3IgdGhlIFN5c3RlbSBDb25maWd1cmF0aW9uIGFuZCBERFIyL21ERFIg
bWVtb3J5CmNvbnRyb2xsZXIgZHJpdmVycyB0byBkYTg1MC5kdHNpLgoKU2lnbmVkLW9mZi1ieTog
QmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBhcmNo
L2FybS9ib290L2R0cy9kYTg1MC5kdHNpIHwgMTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC5k
dHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZGE4NTAuZHRzaQppbmRleCA2NDQwMDAyLi42ZDU2ZWYy
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC5kdHNpCisrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2RhODUwLmR0c2kKQEAgLTQwNyw2ICs0MDcsMTYgQEAKIAkJCWludGVycnVwdHMg
PSA8NTI+OwogCQkJc3RhdHVzID0gImRpc2FibGVkIjsKIAkJfTsKKworCQlkZHJjdGw6IGRhODUw
LWRkcmN0bCB7CisJCQljb21wYXRpYmxlID0gInRpLGRhODUwLWRkcmN0bCI7CisJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOworCQl9OworCisJCXN5c2NmZzogZGE4NTAtc3lzY2ZnIHsKKwkJCWNvbXBh
dGlibGUgPSAidGksZGE4NTAtc3lzY2ZnIjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07
CiAJfTsKIAlhZW1pZjogYWVtaWZANjgwMDAwMDAgewogCQljb21wYXRpYmxlID0gInRpLGRhODUw
LWFlbWlmIjsKLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
