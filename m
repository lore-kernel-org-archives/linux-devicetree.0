From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v7 20/21] ARM: imx_v6_v7_defconfig: Add support for MIPI
 DSI host controller
Date: Tue, 30 Dec 2014 11:34:10 +0800
Message-ID: <1419910451-15268-21-git-send-email-Ying.Liu@freescale.com>
References: <1419910451-15268-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419910451-15268-1-git-send-email-Ying.Liu@freescale.com>
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
dSBZaW5nIDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjYtPnY3OgogKiBOb25lLgoKdjUt
PnY2OgogKiBOb25lLgoKdjQtPnY1OgogKiBOb25lLgoKdjMtPnY0OgogKiBOb25lLgoKdjItPnYz
OgogKiBOb25lLgoKdjEtPnYyOgogKiBOb25lLgoKIGFyY2gvYXJtL2NvbmZpZ3MvaW14X3Y2X3Y3
X2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vY29uZmlncy9pbXhfdjZfdjdfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29u
Zmlncy9pbXhfdjZfdjdfZGVmY29uZmlnCmluZGV4IDBkYmQwYzMuLjNlMGU1ODkgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtL2NvbmZpZ3MvaW14X3Y2X3Y3X2RlZmNvbmZpZworKysgYi9hcmNoL2FybS9j
b25maWdzL2lteF92Nl92N19kZWZjb25maWcKQEAgLTE5OSw2ICsxOTksNyBAQCBDT05GSUdfRFJN
X0lNWF9UVkU9eQogQ09ORklHX0RSTV9JTVhfTERCPXkKIENPTkZJR19EUk1fSU1YX0lQVVYzPXkK
IENPTkZJR19EUk1fSU1YX0hETUk9eQorQ09ORklHX0RSTV9JTVhfTUlQSV9EU0k9eQogQ09ORklH
X0xDRF9DTEFTU19ERVZJQ0U9eQogQ09ORklHX0xDRF9MNEYwMDI0MlQwMz15CiBDT05GSUdfTENE
X1BMQVRGT1JNPXkKLS0gCjIuMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
