From: Liu Ying <Ying.Liu@freescale.com>
Subject: [PATCH RFC v9 19/20] ARM: imx_v6_v7_defconfig: Add support for MIPI
 DSI host controller
Date: Thu, 12 Feb 2015 14:01:42 +0800
Message-ID: <1423720903-24806-20-git-send-email-Ying.Liu@freescale.com>
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

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIE1JUEkgRFNJIGhvc3QgY29udHJvbGxlci4KClRo
ZSBuZXcgaW14X3Y2X3Y3X2RlZmNvbmZpZyBpcyBnZW5lcmF0ZWQgaW4gdGhpcyB3YXk6CiogbWFr
ZSBBUkNIPWFybSBpbXhfdjZfdjdfZGVmY29uZmlnCiogbWFrZSBBUkNIPWFybSBtZW51Y29uZmln
IGFuZCBtYW51YWxseSBjaG9vc2UgdG8gYnVpbGQgaW4KICB0aGUgTUlQSSBEU0kgaG9zdCBjb250
cm9sbGVyIGRyaXZlcgoqIG1ha2UgQVJDSD1hcm0gc2F2ZWRlZmNvbmZpZwoqIGNwIGRlZmNvbmZp
ZyBhcmNoL2FybS9jb25maWdzL2lteF92Nl92N19kZWZjb25maWcKClNpZ25lZC1vZmYtYnk6IExp
dSBZaW5nIDxZaW5nLkxpdUBmcmVlc2NhbGUuY29tPgotLS0KdjgtPnY5OgogKiBSZWJhc2Ugb250
byB0aGUgaW14LWRybS9uZXh0IGJyYW5jaCBvZiBQaGlsaXBwIFphYmVsJ3Mgb3BlbiBnaXQgcmVw
b3NpdG9yeS4KCnY3LT52ODoKICogTm9uZS4KCnY2LT52NzoKICogTm9uZS4KCnY1LT52NjoKICog
Tm9uZS4KCnY0LT52NToKICogTm9uZS4KCnYzLT52NDoKICogTm9uZS4KCnYyLT52MzoKICogTm9u
ZS4KCnYxLT52MjoKICogTm9uZS4KCiBhcmNoL2FybS9jb25maWdzL2lteF92Nl92N19kZWZjb25m
aWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2NvbmZpZ3MvaW14X3Y2X3Y3X2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvaW14
X3Y2X3Y3X2RlZmNvbmZpZwppbmRleCBlYzRiMjU1Li45ZTY1MGU4ZiAxMDA2NDQKLS0tIGEvYXJj
aC9hcm0vY29uZmlncy9pbXhfdjZfdjdfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3Mv
aW14X3Y2X3Y3X2RlZmNvbmZpZwpAQCAtMjAzLDYgKzIwMyw3IEBAIENPTkZJR19EUk1fSU1YX1BB
UkFMTEVMX0RJU1BMQVk9eQogQ09ORklHX0RSTV9JTVhfVFZFPXkKIENPTkZJR19EUk1fSU1YX0xE
Qj15CiBDT05GSUdfRFJNX0lNWF9IRE1JPXkKK0NPTkZJR19EUk1fSU1YX01JUElfRFNJPXkKIENP
TkZJR19MQ0RfQ0xBU1NfREVWSUNFPXkKIENPTkZJR19MQ0RfTDRGMDAyNDJUMDM9eQogQ09ORklH
X0xDRF9QTEFURk9STT15Ci0tIAoyLjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
