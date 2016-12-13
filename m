From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v7 4/5] ARM: dts: da850-lcdk: add the vga-bridge node
Date: Tue, 13 Dec 2016 11:09:18 +0100
Message-ID: <1481623759-12786-5-git-send-email-bgolaszewski@baylibre.com>
References: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-devicetree <devicetree@vger.kernel.org>, linux-drm <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

QWRkIHRoZSB2Z2EtYnJpZGdlIG5vZGUgdG8gdGhlIGJvYXJkIERUIHRvZ2V0aGVyIHdpdGggY29y
cmVzcG9uZGluZwpwb3J0cyBhbmQgdmdhIGNvbm5lY3Rvci4gVGhpcyBhbGxvd3MgdG8gcmV0cmll
dmUgdGhlIGVkaWQgaW5mbyBmcm9tCnRoZSBkaXNwbGF5IGF1dG9tYXRpY2FsbHkuCgpTaWduZWQt
b2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgpS
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLWxjZGsuZHRzIHwgNTEgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDUxIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9kYTg1MC1sY2RrLmR0
cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLWxjZGsuZHRzCmluZGV4IGFmY2I0ODIuLjFhZTIy
NjAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2RhODUwLWxjZGsuZHRzCisrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2RhODUwLWxjZGsuZHRzCkBAIC01MSw2ICs1MSw0NSBAQAogCQkJc3lz
dGVtLWNsb2NrLWZyZXF1ZW5jeSA9IDwyNDU3NjAwMD47CiAJCX07CiAJfTsKKworCXZnYS1icmlk
Z2UgeworCQljb21wYXRpYmxlID0gInRpLHRoczgxMzUiOworCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKKwkJI3NpemUtY2VsbHMgPSA8MD47CisKKwkJcG9ydHMgeworCQkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJcG9ydEAwIHsKKwkJCQlyZWcgPSA8
MD47CisKKwkJCQl2Z2FfYnJpZGdlX2luOiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmbGNkY19vdXRfdmdhPjsKKwkJCQl9OworCQkJfTsKKworCQkJcG9ydEAxIHsKKwkJCQly
ZWcgPSA8MT47CisKKwkJCQl2Z2FfYnJpZGdlX291dDogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JnZnYV9jb25faW4+OworCQkJCX07CisJCQl9OworCQl9OworCX07CisKKwl2
Z2EgeworCQljb21wYXRpYmxlID0gInZnYS1jb25uZWN0b3IiOworCisJCWRkYy1pMmMtYnVzID0g
PCZpMmMwPjsKKworCQlwb3J0IHsKKwkJCXZnYV9jb25faW46IGVuZHBvaW50IHsKKwkJCQlyZW1v
dGUtZW5kcG9pbnQgPSA8JnZnYV9icmlkZ2Vfb3V0PjsKKwkJCX07CisJCX07CisJfTsKIH07CiAK
ICZwbXhfY29yZSB7CkBAIC0yMzYsMyArMjc1LDE1IEBACiAmbWVtY3RybCB7CiAJc3RhdHVzID0g
Im9rYXkiOwogfTsKKworJmxjZGMgeworCXN0YXR1cyA9ICJva2F5IjsKKwlwaW5jdHJsLW5hbWVz
ID0gImRlZmF1bHQiOworCXBpbmN0cmwtMCA9IDwmbGNkX3BpbnM+OworCisJcG9ydCB7CisJCWxj
ZGNfb3V0X3ZnYTogZW5kcG9pbnQgeworCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZ2Z2FfYnJpZGdl
X2luPjsKKwkJfTsKKwl9OworfTsKLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
