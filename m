From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/2] ARM: davinci_all_defconfig: enable the mstpri and ddrctl
 drivers
Date: Mon, 14 Nov 2016 18:32:04 +0100
Message-ID: <1479144724-14231-3-git-send-email-bgolaszewski@baylibre.com>
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

V2l0aCB0aGUgZGE4eHggbWVtb3J5IGNvbnRyb2xsZXIgYW5kIG1hc3RlciBwZXJpcGhlcmFsIHBy
aW9yaXR5CmRyaXZlcnMgbWVyZ2VkIGFuZCBjb3JyZXNwb25kaW5nIGRldmljZSB0cmVlIGNoYW5n
ZXMgaW4gcGxhY2Ugd2UgY2FuCm5vdyBlbmFibGUgYXBwcm9wcmlhdGUgb3B0aW9ucyBieSBkZWZh
dWx0LgoKU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJh
eWxpYnJlLmNvbT4KLS0tCiBhcmNoL2FybS9jb25maWdzL2RhdmluY2lfYWxsX2RlZmNvbmZpZyB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9jb25maWdzL2RhdmluY2lfYWxsX2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvZGF2
aW5jaV9hbGxfZGVmY29uZmlnCmluZGV4IGI1ZTk3OGYuLmY4MTRmMDEgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtL2NvbmZpZ3MvZGF2aW5jaV9hbGxfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZp
Z3MvZGF2aW5jaV9hbGxfZGVmY29uZmlnCkBAIC01Niw2ICs1Niw3IEBAIENPTkZJR19VRVZFTlRf
SEVMUEVSX1BBVEg9Ii9zYmluL2hvdHBsdWciCiBDT05GSUdfREVWVE1QRlM9eQogQ09ORklHX0RF
VlRNUEZTX01PVU5UPXkKICMgQ09ORklHX0ZXX0xPQURFUiBpcyBub3Qgc2V0CitDT05GSUdfREE4
WFhfTVNUUFJJPXkKIENPTkZJR19NVEQ9bQogQ09ORklHX01URF9CTE9DSz1tCiBDT05GSUdfTVRE
X0NGST1tCkBAIC0xODcsNiArMTg4LDcgQEAgQ09ORklHX0RNQURFVklDRVM9eQogQ09ORklHX1RJ
X0VETUE9eQogQ09ORklHX01FTU9SWT15CiBDT05GSUdfVElfQUVNSUY9bQorQ09ORklHX0RBOFhY
X0REUkNUTD15CiBDT05GSUdfRVhUMl9GUz15CiBDT05GSUdfRVhUM19GUz15CiBDT05GSUdfWEZT
X0ZTPW0KLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
