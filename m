From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 2/2] ARM: dts: rockchip: add hdmi analog power supplies to
 rk3288 boards
Date: Thu, 12 Mar 2015 21:46:06 +0100
Message-ID: <2410885.atPeD2Ud1D@phil>
References: <4184159.j0iXe39dFB@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <4184159.j0iXe39dFB@phil>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-rockchip@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, dianders@chromium.org, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QWRkIHRoZSByZWNlbnRseSBhZGRlZCBoZG1pIHBvd2VyIHN1cHBsaWVzIHRvIGV2YiBhbmQgZmly
ZWZseSBib2FyZHMuCgpTaWduZWQtb2ZmLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNo
LmRlPgotLS0KIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC1ldmIuZHRzaSAgICAgfCAyICsrCiBh
cmNoL2FybS9ib290L2R0cy9yazMyODgtZmlyZWZseS5kdHNpIHwgMiArKwogMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9yazMy
ODgtZXZiLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9yazMyODgtZXZiLmR0c2kKaW5kZXggNWU4
OTVhNS4uZWRkNDVhMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LWV2Yi5k
dHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC1ldmIuZHRzaQpAQCAtMTE4LDYgKzEx
OCw4IEBACiB9OwogCiAmaGRtaSB7CisJdnAtc3VwcGx5ID0gPCZ2ZGQxMF9sY2Q+OworCXZwaC1z
dXBwbHkgPSA8JnZjYzE4X2xjZD47CiAJZGRjLWkyYy1idXMgPSA8JmkyYzU+OwogCXN0YXR1cyA9
ICJva2F5IjsKIH07CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9yazMyODgtZmlyZWZs
eS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LWZpcmVmbHkuZHRzaQppbmRleCBlNmY4
NzNhLi4wOWZjZGVkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9yazMyODgtZmlyZWZs
eS5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC1maXJlZmx5LmR0c2kKQEAgLTE4
MCw2ICsxODAsOCBAQAogfTsKIAogJmhkbWkgeworCXZwLXN1cHBseSA9IDwmdmRkMTBfbGNkPjsK
Kwl2cGgtc3VwcGx5ID0gPCZ2Y2MxOF9sY2Q+OwogCWRkYy1pMmMtYnVzID0gPCZpMmM1PjsKIAlz
dGF0dXMgPSAib2theSI7CiB9OwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
