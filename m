From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v6 5/5] ARM: sunxi: Enable VGA bridge
Date: Thu,  6 Oct 2016 09:57:09 +0200
Message-ID: <4d4f4426feda825576d27c668d8c0c95b23b2324.1475740611.git-series.maxime.ripard@free-electrons.com>
References: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard@free-electrons.com>
References: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Archit Taneja <architt@codeaurora.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RW5hYmxlIHRoZSBWR0EgYnJpZGdlIHVzZWQgb24gdGhlIEExMy1PbGludXhpbm8gaW4gdGhlIHN1
bnhpIGRlZmNvbmZpZwoKU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFy
ZEBmcmVlLWVsZWN0cm9ucy5jb20+Ci0tLQogYXJjaC9hcm0vY29uZmlncy9zdW54aV9kZWZjb25m
aWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL3N1bnhpX2RlZmNvbmZpZyBiL2FyY2gvYXJt
L2NvbmZpZ3Mvc3VueGlfZGVmY29uZmlnCmluZGV4IDcxNGRhMzM2ZWM4Ni4uMzNiOGMzMzA4MzM1
IDEwMDY0NAotLS0gYS9hcmNoL2FybS9jb25maWdzL3N1bnhpX2RlZmNvbmZpZworKysgYi9hcmNo
L2FybS9jb25maWdzL3N1bnhpX2RlZmNvbmZpZwpAQCAtOTgsNiArOTgsNyBAQCBDT05GSUdfTUVE
SUFfUkNfU1VQUE9SVD15CiBDT05GSUdfUkNfREVWSUNFUz15CiBDT05GSUdfSVJfU1VOWEk9eQog
Q09ORklHX0RSTT15CitDT05GSUdfRFJNX1NJTVBMRV9WR0FfREFDPXkKIENPTkZJR19EUk1fU1VO
NEk9eQogQ09ORklHX0ZCPXkKIENPTkZJR19GQl9TSU1QTEU9eQotLSAKZ2l0LXNlcmllcyAwLjgu
MTAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
