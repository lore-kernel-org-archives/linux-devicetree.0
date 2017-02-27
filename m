From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4 v3] ARM: gemini: select MIGHT_HAVE_PCI
Date: Mon, 27 Feb 2017 20:07:19 +0100
Message-ID: <20170227190720.31409-3-linus.walleij@linaro.org>
References: <20170227190720.31409-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <openwrt-devel-bounces@lists.openwrt.org>
In-Reply-To: <20170227190720.31409-1-linus.walleij@linaro.org>
List-Unsubscribe: <https://lists.openwrt.org/cgi-bin/mailman/options/openwrt-devel>,
 <mailto:openwrt-devel-request@lists.openwrt.org?subject=unsubscribe>
List-Archive: <http://lists.openwrt.org/pipermail/openwrt-devel/>
List-Post: <mailto:openwrt-devel@lists.openwrt.org>
List-Help: <mailto:openwrt-devel-request@lists.openwrt.org?subject=help>
List-Subscribe: <https://lists.openwrt.org/cgi-bin/mailman/listinfo/openwrt-devel>,
 <mailto:openwrt-devel-request@lists.openwrt.org?subject=subscribe>
Errors-To: openwrt-devel-bounces@lists.openwrt.org
Sender: "openwrt-devel" <openwrt-devel-bounces@lists.openwrt.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Cc: openwrt-devel@openwrt.org, Feng-Hsin Chiang <john453@faraday-tech.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, linux-pci@vger.kernel.org, Greentime Hu <green.hu@gmail.com>, Janos Laube <janos.dev@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

QXMgd2UgaGF2ZSBhIFBDSSBkcml2ZXIgZm9yIHRoZSBHZW1pbmksIHdlIHNob3VsZCBzZWxlY3QK
TUlHSFRfSEFWRV9QQ0kuCgpDYzogSmFub3MgTGF1YmUgPGphbm9zLmRldkBnbWFpbC5jb20+CkNj
OiBQYXVsaXVzIFphbGVja2FzIDxwYXVsaXVzLnphbGVja2FzQGdtYWlsLmNvbT4KQ2M6IEhhbnMg
VWxsaSBLcm9sbCA8dWxsaS5rcm9sbEBnb29nbGVtYWlsLmNvbT4KQ2M6IEZsb3JpYW4gRmFpbmVs
bGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgpDYzogRmVuZy1Ic2luIENoaWFuZyA8am9objQ1M0Bm
YXJhZGF5LXRlY2guY29tPgpDYzogR3JlZW50aW1lIEh1IDxncmVlbi5odUBnbWFpbC5jb20+ClNp
Z25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0t
CkNoYW5nZUxvZyB2MS0+djItPnYzOgotIE5vIGNoYW5nZXMKClBDSSBtYWludGFpbmVyczogdGhp
cyBpcyBGWUkgb25seSwgSSB3aWxsIGZ1bm5lbCB0aGlzIHRvIHRoZSBBUk0KU29DIHRyZWUgb25j
ZSB3ZSBhcmUgZG9uZSB3aXRoIHRoZSBQQ0kgZHJpdmVyLgotLS0KIGFyY2gvYXJtL21hY2gtZ2Vt
aW5pL0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL21hY2gtZ2VtaW5pL0tjb25maWcgYi9hcmNoL2FybS9tYWNoLWdlbWlu
aS9LY29uZmlnCmluZGV4IGE1ZWU1ZmJhYjc5Ni4uMjFmODlhNGMxNmZlIDEwMDY0NAotLS0gYS9h
cmNoL2FybS9tYWNoLWdlbWluaS9LY29uZmlnCisrKyBiL2FyY2gvYXJtL21hY2gtZ2VtaW5pL0tj
b25maWcKQEAgLTYsNiArNiw3IEBAIG1lbnVjb25maWcgQVJDSF9HRU1JTkkKIAlzZWxlY3QgRlRU
TVIwMTBfVElNRVIKIAlzZWxlY3QgR1BJT19HRU1JTkkKIAlzZWxlY3QgR1BJT0xJQgorCXNlbGVj
dCBNSUdIVF9IQVZFX1BDSQogCXNlbGVjdCBQT1dFUl9SRVNFVAogCXNlbGVjdCBQT1dFUl9SRVNF
VF9TWVNDT04KIAlzZWxlY3QgU0VSSUFMX09GX1BMQVRGT1JNCi0tIAoyLjkuMwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpvcGVud3J0LWRldmVsIG1haWxp
bmcgbGlzdApvcGVud3J0LWRldmVsQGxpc3RzLm9wZW53cnQub3JnCmh0dHBzOi8vbGlzdHMub3Bl
bndydC5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW53cnQtZGV2ZWwK
