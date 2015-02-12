From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v9 20/20] ARM: imx_v6_v7_defconfig: Add support for Himax
 HX8369A panel
Date: Thu, 12 Feb 2015 14:01:43 +0800
Message-ID: <1423720903-24806-21-git-send-email-Ying.Liu@freescale.com>
References: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1423720903-24806-1-git-send-email-Ying.Liu@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, a.hajda@samsung.com, andy.yan@rock-chips.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIEhpbWF4IEhYODM2OUEgcGFuZWwuCgpUaGUgbmV3
IGlteF92Nl92N19kZWZjb25maWcgaXMgZ2VuZXJhdGVkIGluIHRoaXMgd2F5OgoqIG1ha2UgQVJD
SD1hcm0gaW14X3Y2X3Y3X2RlZmNvbmZpZwoqIG1ha2UgQVJDSD1hcm0gbWVudWNvbmZpZyBhbmQg
bWFudWFsbHkgY2hvb3NlIHRvIGJ1aWxkIGluCiAgdGhlIEhpbWF4IEhYODM2OUEgcGFuZWwgZHJp
dmVyCiogbWFrZSBBUkNIPWFybSBzYXZlZGVmY29uZmlnCiogY3AgZGVmY29uZmlnIGFyY2gvYXJt
L2NvbmZpZ3MvaW14X3Y2X3Y3X2RlZmNvbmZpZwoKU2lnbmVkLW9mZi1ieTogTGl1IFlpbmcgPFlp
bmcuTGl1QGZyZWVzY2FsZS5jb20+Ci0tLQp2OC0+djk6CiAqIFJlYmFzZSBvbnRvIHRoZSBpbXgt
ZHJtL25leHQgYnJhbmNoIG9mIFBoaWxpcHAgWmFiZWwncyBvcGVuIGdpdCByZXBvc2l0b3J5LgoK
djctPnY4OgogKiBOb25lLgoKdjYtPnY3OgogKiBOb25lLgoKdjUtPnY2OgogKiBOb25lLgoKdjQt
PnY1OgogKiBOb25lLgoKdjMtPnY0OgogKiBOb25lLgoKdjItPnYzOgogKiBOb25lLgoKdjEtPnYy
OgogKiBBZGQgdGhlIEhJTUFYIHByZWZpeCBpbiB0aGUgS2NvbmZpZyBuYW1lLgoKIGFyY2gvYXJt
L2NvbmZpZ3MvaW14X3Y2X3Y3X2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9pbXhfdjZfdjdfZGVmY29u
ZmlnIGIvYXJjaC9hcm0vY29uZmlncy9pbXhfdjZfdjdfZGVmY29uZmlnCmluZGV4IDllNjUwZThm
Li41MmQ3MGExIDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL2lteF92Nl92N19kZWZjb25m
aWcKKysrIGIvYXJjaC9hcm0vY29uZmlncy9pbXhfdjZfdjdfZGVmY29uZmlnCkBAIC0xOTcsNiAr
MTk3LDcgQEAgQ09ORklHX1NPQ19DQU1FUkFfT1YyNjQwPXkKIENPTkZJR19JTVhfSVBVVjNfQ09S
RT15CiBDT05GSUdfRFJNPXkKIENPTkZJR19EUk1fUEFORUxfU0lNUExFPXkKK0NPTkZJR19EUk1f
UEFORUxfSElNQVhfSFg4MzY5QT15CiBDT05GSUdfRFJNX0lNWD15CiBDT05GSUdfRFJNX0lNWF9G
Ql9IRUxQRVI9eQogQ09ORklHX0RSTV9JTVhfUEFSQUxMRUxfRElTUExBWT15Ci0tIAoyLjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
