From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 4/5] ARM: dts: r8a7744: Add DU support
Date: Tue, 22 Jan 2019 15:25:48 +0000
Message-ID: <1548170749-12773-5-git-send-email-biju.das@bp.renesas.com>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

QWRkIGR1IG5vZGUgdG8gcjhhNzc0NCBTb0MgRFQuIEJvYXJkcyB0aGF0IHdhbnQgdG8gZW5hYmxl
IHRoZSBEVQpuZWVkIHRvIHNwZWNpZnkgdGhlIG91dHB1dCB0b3BvbG9neS4KClNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhc0BicC5yZW5lc2FzLmNvbT4KLS0tCiBhcmNoL2FybS9ib290
L2R0cy9yOGE3NzQ0LmR0c2kgfCAxMSArKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9yOGE3NzQ0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9yOGE3NzQ0LmR0c2kKaW5kZXggOGQy
NWEwYS4uODM4MDRhYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcjhhNzc0NC5kdHNp
CisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3I4YTc3NDQuZHRzaQpAQCAtMTY0NSw4ICsxNjQ1LDE0
IEBACiAJCX07CiAKIAkJZHU6IGRpc3BsYXlAZmViMDAwMDAgewotCQkJcmVnID0gPDAgMHhmZWIw
MDAwMCAwIDB4NDAwMDA+LAotCQkJICAgICAgPDAgMHhmZWI5MDAwMCAwIDB4MWM+OworCQkJY29t
cGF0aWJsZSA9ICJyZW5lc2FzLGR1LXI4YTc3NDQiOworCQkJcmVnID0gPDAgMHhmZWIwMDAwMCAw
IDB4NDAwMDA+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI1NiBJUlFfVFlQRV9MRVZFTF9I
SUdIPiwKKwkJCQkgICAgIDxHSUNfU1BJIDI2OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCWNs
b2NrcyA9IDwmY3BnIENQR19NT0QgNzI0PiwKKwkJCQkgPCZjcGcgQ1BHX01PRCA3MjM+OworCQkJ
Y2xvY2stbmFtZXMgPSAiZHUuMCIsICJkdS4xIjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CiAK
IAkJCXBvcnRzIHsKIAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKQEAgLTE2NjMsNyArMTY2OSw2
IEBACiAJCQkJCX07CiAJCQkJfTsKIAkJCX07Ci0JCQkvKiBwbGFjZWhvbGRlciAqLwogCQl9Owog
CiAJCXBycjogY2hpcGlkQGZmMDAwMDQ0IHsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
