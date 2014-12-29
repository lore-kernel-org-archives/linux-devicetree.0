From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v6 20/21] ARM: imx_v6_v7_defconfig: Add support for MIPI
 DSI host controller
Date: Mon, 29 Dec 2014 14:39:27 +0800
Message-ID: <1419835168-9034-21-git-send-email-Ying.Liu@freescale.com>
References: <1419835168-9034-1-git-send-email-Ying.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1419835168-9034-1-git-send-email-Ying.Liu@freescale.com>
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
dSBZaW5nIDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjUtPnY2OgogKiBOb25lLgoKdjQt
PnY1OgogKiBOb25lLgoKdjMtPnY0OgogKiBOb25lLgoKdjItPnYzOgogKiBOb25lLgoKdjEtPnYy
OgogKiBOb25lLgoKIGFyY2gvYXJtL2NvbmZpZ3MvaW14X3Y2X3Y3X2RlZmNvbmZpZyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29u
Zmlncy9pbXhfdjZfdjdfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9pbXhfdjZfdjdfZGVm
Y29uZmlnCmluZGV4IDBkYmQwYzMuLjNlMGU1ODkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2NvbmZp
Z3MvaW14X3Y2X3Y3X2RlZmNvbmZpZworKysgYi9hcmNoL2FybS9jb25maWdzL2lteF92Nl92N19k
ZWZjb25maWcKQEAgLTE5OSw2ICsxOTksNyBAQCBDT05GSUdfRFJNX0lNWF9UVkU9eQogQ09ORklH
X0RSTV9JTVhfTERCPXkKIENPTkZJR19EUk1fSU1YX0lQVVYzPXkKIENPTkZJR19EUk1fSU1YX0hE
TUk9eQorQ09ORklHX0RSTV9JTVhfTUlQSV9EU0k9eQogQ09ORklHX0xDRF9DTEFTU19ERVZJQ0U9
eQogQ09ORklHX0xDRF9MNEYwMDI0MlQwMz15CiBDT05GSUdfTENEX1BMQVRGT1JNPXkKLS0gCjIu
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
