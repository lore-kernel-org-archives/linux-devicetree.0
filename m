From: Paul Kocialkowski <contact@paulk.fr>
Subject: [PATCH NOT FOR MERGE v3 7/8] ARM: dts: sun7i: Add pinmux
 configuration for LCD0 RGB888 pins
Date: Wed,  7 Nov 2018 19:18:42 +0100
Message-ID: <20181107181843.27628-8-contact@paulk.fr>
References: <20181107181843.27628-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181107181843.27628-1-contact@paulk.fr>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Mark Van den Borre <mark@fosdem.org>, Gerry Demaret <gerry@fosdem.org>, David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>, Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: devicetree@vger.kernel.org

VGhpcyBhZGRzIHRoZSBwaW4gbXV4aW5nIGRlZmluaXRpb24gZm9yIGNvbmZpZ3VyaW5nIHRoZSBQ
RCBwaW5zIGluIExDRDAKbW9kZSBmb3IgYSBSR0I4ODggZm9ybWF0IHRvIHRoZSBzdW43aSBkZXZp
Y2UtdHJlZS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293c2tpIDxjb250YWN0QHBhdWxr
LmZyPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3N1bjdpLWEyMC5kdHNpIHwgMTEgKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vYm9vdC9kdHMvc3VuN2ktYTIwLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdW43aS1hMjAu
ZHRzaQppbmRleCA5YzUyNzEyYWYyNDEuLjI2ZjM3MTRlYWFkMCAxMDA2NDQKLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvc3VuN2ktYTIwLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3VuN2kt
YTIwLmR0c2kKQEAgLTgxMSw2ICs4MTEsMTcgQEAKIAkJCQlmdW5jdGlvbiA9ICJpcjEiOwogCQkJ
fTsKIAorCQkJbGNkMF9yZ2I4ODhfcGluczogbGNkMC1yZ2I4ODggeworCQkJCXBpbnMgPSAiUEQw
IiwgIlBEMSIsICJQRDIiLCAiUEQzIiwKKwkJCQkgICAgICAgIlBENCIsICJQRDUiLCAiUEQ2Iiwg
IlBENyIsCisJCQkJICAgICAgICJQRDgiLCAiUEQ5IiwgIlBEMTAiLCAiUEQxMSIsCisJCQkJICAg
ICAgICJQRDEyIiwgIlBEMTMiLCAiUEQxNCIsICJQRDE1IiwKKwkJCQkgICAgICAgIlBEMTYiLCAi
UEQxNyIsICJQRDE4IiwgIlBEMTkiLAorCQkJCSAgICAgICAiUEQyMCIsICJQRDIxIiwgIlBEMjIi
LCAiUEQyMyIsCisJCQkJICAgICAgICJQRDI0IiwgIlBEMjUiLCAiUEQyNiIsICJQRDI3IjsKKwkJ
CQlmdW5jdGlvbiA9ICJsY2QwIjsKKwkJCX07CisKIAkJCW1tYzBfcGluc19hOiBtbWMwQDAgewog
CQkJCXBpbnMgPSAiUEYwIiwgIlBGMSIsICJQRjIiLAogCQkJCSAgICAgICAiUEYzIiwgIlBGNCIs
ICJQRjUiOwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
