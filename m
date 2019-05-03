From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH v5] staging: octeon-ethernet: support of_get_mac_address new
 ERR_PTR error
Date: Fri,  3 May 2019 17:32:47 +0200
Message-ID: <1556897567-22247-1-git-send-email-ynezz@true.cz>
References: <1556893635-18549-9-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1556893635-18549-9-git-send-email-ynezz@true.cz>
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
CiBDaGFuZ2VzIHNpbmNlIHY0OgoKICAqIEkndmUganVzdCBibGluZGx5IHJlcGxhY2VkIElTX0VS
Ul9PUl9OVUxMIHdpdGggSVNfRVJSIGluIHY0LCBidXQgdGhpcyB3YXMKICAgIHdyb25nLCBhcyBJ
J3ZlIGp1c3QgcmVhbGl6ZWQsIHRoYXQgd2Ugc3RpbGwgbmVlZCB0byBjaGVjayBmb3IgTlVMTCBp
biB0aGlzCiAgICBwYXJ0aWN1bGFyIGNhc2UgYXMgd2VsbCwgc28gSSd2ZSBhZGRlZCBiYWNrIElT
X0VSUl9PUl9OVUxMIGNoZWNrCgogZHJpdmVycy9zdGFnaW5nL29jdGVvbi9ldGhlcm5ldC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL29jdGVvbi9ldGhlcm5ldC5jIGIvZHJpdmVycy9zdGFn
aW5nL29jdGVvbi9ldGhlcm5ldC5jCmluZGV4IDk4NmRiNzYuLjg4NDdhMTFjMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9zdGFnaW5nL29jdGVvbi9ldGhlcm5ldC5jCisrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9vY3Rlb24vZXRoZXJuZXQuYwpAQCAtNDIxLDcgKzQyMSw3IEBAIGludCBjdm1fb2N0X2NvbW1v
bl9pbml0KHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCiAJaWYgKHByaXYtPm9mX25vZGUpCiAJCW1h
YyA9IG9mX2dldF9tYWNfYWRkcmVzcyhwcml2LT5vZl9ub2RlKTsKIAotCWlmIChtYWMpCisJaWYg
KCFJU19FUlJfT1JfTlVMTChtYWMpKQogCQlldGhlcl9hZGRyX2NvcHkoZGV2LT5kZXZfYWRkciwg
bWFjKTsKIAllbHNlCiAJCWV0aF9od19hZGRyX3JhbmRvbShkZXYpOwotLSAKMS45LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRldmVsIG1haWxpbmcg
bGlzdApkZXZlbEBsaW51eGRyaXZlcnByb2plY3Qub3JnCmh0dHA6Ly9kcml2ZXJkZXYubGludXhk
cml2ZXJwcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbAo=
