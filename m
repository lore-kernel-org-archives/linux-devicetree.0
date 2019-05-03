From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH v4 08/10] staging: octeon-ethernet: support of_get_mac_address
 new ERR_PTR error
Date: Fri,  3 May 2019 16:27:13 +0200
Message-ID: <1556893635-18549-9-git-send-email-ynezz@true.cz>
References: <1556893635-18549-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1556893635-18549-1-git-send-email-ynezz@true.cz>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>, Frank Rowand <frowand.list@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>
List-Id: devicetree@vger.kernel.org

VGhlcmUgd2FzIE5WTUVNIHN1cHBvcnQgYWRkZWQgdG8gb2ZfZ2V0X21hY19hZGRyZXNzLCBzbyBp
dCBjb3VsZCBub3cgcmV0dXJuCkVSUl9QVFIgZW5jb2RlZCBlcnJvciB2YWx1ZXMsIHNvIHdlIG5l
ZWQgdG8gYWRqdXN0IGFsbCBjdXJyZW50IHVzZXJzIG9mCm9mX2dldF9tYWNfYWRkcmVzcyB0byB0
aGlzIG5ldyBmYWN0LgoKU2lnbmVkLW9mZi1ieTogUGV0ciDFoHRldGlhciA8eW5lenpAdHJ1ZS5j
ej4KLS0tCgogQ2hhbmdlcyBzaW5jZSB2MzoKCiAgKiBJU19FUlJfT1JfTlVMTCAtPiBJU19FUlIK
CiBkcml2ZXJzL3N0YWdpbmcvb2N0ZW9uL2V0aGVybmV0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0
YWdpbmcvb2N0ZW9uL2V0aGVybmV0LmMgYi9kcml2ZXJzL3N0YWdpbmcvb2N0ZW9uL2V0aGVybmV0
LmMKaW5kZXggOTg2ZGI3Ni4uMmIwMzAxOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL29j
dGVvbi9ldGhlcm5ldC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9vY3Rlb24vZXRoZXJuZXQuYwpA
QCAtNDIxLDcgKzQyMSw3IEBAIGludCBjdm1fb2N0X2NvbW1vbl9pbml0KHN0cnVjdCBuZXRfZGV2
aWNlICpkZXYpCiAJaWYgKHByaXYtPm9mX25vZGUpCiAJCW1hYyA9IG9mX2dldF9tYWNfYWRkcmVz
cyhwcml2LT5vZl9ub2RlKTsKIAotCWlmIChtYWMpCisJaWYgKCFJU19FUlIobWFjKSkKIAkJZXRo
ZXJfYWRkcl9jb3B5KGRldi0+ZGV2X2FkZHIsIG1hYyk7CiAJZWxzZQogCQlldGhfaHdfYWRkcl9y
YW5kb20oZGV2KTsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkZXZlbCBtYWlsaW5nIGxpc3QKZGV2ZWxAbGludXhkcml2ZXJwcm9qZWN0
Lm9yZwpodHRwOi8vZHJpdmVyZGV2LmxpbnV4ZHJpdmVycHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcml2ZXJkZXYtZGV2ZWwK
