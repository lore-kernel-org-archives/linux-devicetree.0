From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v5 20/21] ARM: imx_v6_v7_defconfig: Add support for MIPI
 DSI host controller
Date: Wed, 24 Dec 2014 16:39:42 +0800
Message-ID: <1419410383-6359-21-git-send-email-Ying.Liu@freescale.com>
References: <1419410383-6359-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419410383-6359-1-git-send-email-Ying.Liu@freescale.com>
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
Cc: stefan.wahren@i2se.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, kernel@pengutronix.de, linux-kernel@vger.kernel.org, a.hajda@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIE1JUEkgRFNJIGhvc3QgY29udHJvbGxlci4KClRo
ZSBuZXcgaW14X3Y2X3Y3X2RlZmNvbmZpZyBpcyBnZW5lcmF0ZWQgaW4gdGhpcyB3YXk6CiogbWFr
ZSBBUkNIPWFybSBpbXhfdjZfdjdfZGVmY29uZmlnCiogbWFrZSBBUkNIPWFybSBtZW51Y29uZmln
IGFuZCBtYW51YWxseSBjaG9vc2UgdG8gYnVpbGQgaW4KICB0aGUgTUlQSSBEU0kgaG9zdCBjb250
cm9sbGVyIGRyaXZlcgoqIG1ha2UgQVJDSD1hcm0gc2F2ZWRlZmNvbmZpZwoqIGNwIGRlZmNvbmZp
ZyBhcmNoL2FybS9jb25maWdzL2lteF92Nl92N19kZWZjb25maWcKClNpZ25lZC1vZmYtYnk6IExp
dSBZaW5nIDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjQtPnY1OgogKiBOb25lLgoKdjMt
PnY0OgogKiBOb25lLgoKdjItPnYzOgogKiBOb25lLgoKdjEtPnYyOgogKiBOb25lLgoKIGFyY2gv
YXJtL2NvbmZpZ3MvaW14X3Y2X3Y3X2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9pbXhfdjZfdjdfZGVm
Y29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9pbXhfdjZfdjdfZGVmY29uZmlnCmluZGV4IDBkYmQw
YzMuLjNlMGU1ODkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZpZ3MvaW14X3Y2X3Y3X2RlZmNv
bmZpZworKysgYi9hcmNoL2FybS9jb25maWdzL2lteF92Nl92N19kZWZjb25maWcKQEAgLTE5OSw2
ICsxOTksNyBAQCBDT05GSUdfRFJNX0lNWF9UVkU9eQogQ09ORklHX0RSTV9JTVhfTERCPXkKIENP
TkZJR19EUk1fSU1YX0lQVVYzPXkKIENPTkZJR19EUk1fSU1YX0hETUk9eQorQ09ORklHX0RSTV9J
TVhfTUlQSV9EU0k9eQogQ09ORklHX0xDRF9DTEFTU19ERVZJQ0U9eQogQ09ORklHX0xDRF9MNEYw
MDI0MlQwMz15CiBDT05GSUdfTENEX1BMQVRGT1JNPXkKLS0gCjIuMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
