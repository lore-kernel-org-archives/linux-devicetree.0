From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v2 2/5] arm64: dts: allwinner: h6: pine64: Add PIO regulators
Date: Fri,  5 Apr 2019 14:24:43 +0200
Message-ID: <20190405122446.2101-2-peron.clem@gmail.com>
References: <20190405122446.2101-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190405122446.2101-1-peron.clem@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIFBJTyByZWd1bGF0b3JzIGZvciBQaW5lNjQgYm9hcmQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOp
bWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bjUwaS1oNi1waW5lLWg2NC5kdHMgfCAxMSArKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYtcGluZS1oNjQuZHRzIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LXBpbmUtaDY0LmR0cwppbmRleCBiZGI4NDcwZmM4ZGMu
LjhiMGI3Njc1YTUzYyAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIv
c3VuNTBpLWg2LXBpbmUtaDY0LmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5l
ci9zdW41MGktaDYtcGluZS1oNjQuZHRzCkBAIC0xMzEsNiArMTMxLDEyIEBACiAJc3RhdHVzID0g
Im9rYXkiOwogfTsKIAorJnBpbyB7CisJdmNjLXBjLXN1cHBseSA9IDwmcmVnX2JsZG8yPjsKKwl2
Y2MtcGQtc3VwcGx5ID0gPCZyZWdfY2xkbzE+OworCXZjYy1wZy1zdXBwbHkgPSA8JnJlZ19ibGRv
Mj47Cit9OworCiAmcl9pMmMgewogCXN0YXR1cyA9ICJva2F5IjsKIApAQCAtMjUxLDYgKzI1Nywx
MSBAQAogCX07CiB9OwogCismcl9waW8geworCXZjYy1wbC1zdXBwbHkgPSA8JnJlZ19hbGRvMT47
CisJdmNjLXBtLXN1cHBseSA9IDwmcmVnX2JsZG8yPjsKK307CisKICZ1YXJ0MCB7CiAJcGluY3Ry
bC1uYW1lcyA9ICJkZWZhdWx0IjsKIAlwaW5jdHJsLTAgPSA8JnVhcnQwX3BoX3BpbnM+OwotLSAK
Mi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXJtLWtlcm5lbAo=
