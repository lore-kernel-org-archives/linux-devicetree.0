From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 6/7] clk: sunxi-ng: sun5i: Export the MBUS clock
Date: Tue,  3 Apr 2018 15:29:19 +0200
Message-ID: <6d6004e057609109f6b3a0c014c30f7914eb4401.1522761929.git-series.maxime.ripard@bootlin.com>
References: <cover.54a07919b9d7fe8d7c90e9f4929648013e641cff.1522761929.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.54a07919b9d7fe8d7c90e9f4929648013e641cff.1522761929.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <cover.54a07919b9d7fe8d7c90e9f4929648013e641cff.1522761929.git-series.maxime.ripard@bootlin.com>
References: <cover.54a07919b9d7fe8d7c90e9f4929648013e641cff.1522761929.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Robin Murphy <robin.murphy@arm.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

VGhlIE1CVVMgY2xvY2sgaXMgdXNlZCBieSB0aGUgTUJVUyBjb250cm9sbGVyLCBzbyBsZXQncyBl
eHBvcnQgaXQgc28gdGhhdAp3ZSBjYW4gdXNlIGl0IGluIG91ciBEVCBub2RlLgoKU2lnbmVkLW9m
Zi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBkcml2
ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuNWkuaCAgICAgIHwgNCAtLS0tCiBpbmNsdWRlL2R0LWJp
bmRpbmdzL2Nsb2NrL3N1bjVpLWNjdS5oIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zdW54aS1u
Zy9jY3Utc3VuNWkuaCBiL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2NjdS1zdW41aS5oCmluZGV4IDkz
YTI3NWZiZDlhOS4uYjY2YWJkNGZkMGJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Nsay9zdW54aS1u
Zy9jY3Utc3VuNWkuaAorKysgYi9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuNWkuaApAQCAt
NjAsMTAgKzYwLDYgQEAKIAogLyogVGhlIHJlc3Qgb2YgdGhlIG1vZHVsZSBjbG9ja3MgYXJlIGV4
cG9ydGVkICovCiAKLSNkZWZpbmUgQ0xLX01CVVMJCTk5Ci0KLS8qIEFuZCBmaW5hbGx5IHRoZSBJ
RVAgY2xvY2sgKi8KLQogI2RlZmluZSBDTEtfTlVNQkVSCQkoQ0xLX0lFUCArIDEpCiAKICNlbmRp
ZiAvKiBfQ0NVX1NVTjVJX0hfICovCmRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Ns
b2NrL3N1bjVpLWNjdS5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdW41aS1jY3UuaApp
bmRleCA4MWYzNGQ0NzdhZWIuLjJlNmI5ZGRjYzI0ZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kdC1i
aW5kaW5ncy9jbG9jay9zdW41aS1jY3UuaAorKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2Nr
L3N1bjVpLWNjdS5oCkBAIC0xMDAsNyArMTAwLDcgQEAKICNkZWZpbmUgQ0xLX0FWUwkJCTk2CiAj
ZGVmaW5lIENMS19IRE1JCQk5NwogI2RlZmluZSBDTEtfR1BVCQkJOTgKLQorI2RlZmluZSBDTEtf
TUJVUwkJOTkKICNkZWZpbmUgQ0xLX0lFUAkJCTEwMAogCiAjZW5kaWYgLyogX0RUX0JJTkRJTkdT
X0NMS19TVU41SV9IXyAqLwotLSAKZ2l0LXNlcmllcyAwLjkuMQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
