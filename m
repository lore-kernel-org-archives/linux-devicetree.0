From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 3/3] ARM: dts: rockchip: add hdmi analog power supplies to
 rk3288 boards
Date: Tue, 10 Mar 2015 00:23:22 +0100
Message-ID: <1671480.kThS89MFxf@phil>
References: <1429128.MSqYm0qZ9p@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1429128.MSqYm0qZ9p@phil>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, dianders@chromium.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, broonie@kernel.org, dri-devel@lists.freedesktop.org, Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIHRoZSByZWNlbnRseSBhZGRlZCBoZG1pIHBvd2VyIHN1cHBsaWVzIHRvIGV2YiBhbmQgZmly
ZWZseSBib2FyZHMuCgpTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNo
LmRlPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC1ldmIuZHRzaSAgICAgfCAyICsrCiBh
cmNoL2FybS9ib290L2R0cy9yazMyODgtZmlyZWZseS5kdHNpIHwgMiArKwogMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9yazMy
ODgtZXZiLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9yazMyODgtZXZiLmR0c2kKaW5kZXggNWU4
OTVhNS4uZWRkNDVhMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LWV2Yi5k
dHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC1ldmIuZHRzaQpAQCAtMTE4LDYgKzEx
OCw4IEBACiB9OwogCiAmaGRtaSB7CisJYXZkZDF2MC1zdXBwbHkgPSA8JnZkZDEwX2xjZD47CisJ
YXZkZDF2OC1zdXBwbHkgPSA8JnZjYzE4X2xjZD47CiAJZGRjLWkyYy1idXMgPSA8JmkyYzU+Owog
CXN0YXR1cyA9ICJva2F5IjsKIH07CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9yazMy
ODgtZmlyZWZseS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LWZpcmVmbHkuZHRzaQpp
bmRleCBlNmY4NzNhLi4wOWZjZGVkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9yazMy
ODgtZmlyZWZseS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC1maXJlZmx5LmR0
c2kKQEAgLTE4MCw2ICsxODAsOCBAQAogfTsKIAogJmhkbWkgeworCWF2ZGQxdjAtc3VwcGx5ID0g
PCZ2ZGQxMF9sY2Q+OworCWF2ZGQxdjgtc3VwcGx5ID0gPCZ2Y2MxOF9sY2Q+OwogCWRkYy1pMmMt
YnVzID0gPCZpMmM1PjsKIAlzdGF0dXMgPSAib2theSI7CiB9OwotLSAKMi4xLjQKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
