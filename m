From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 4/4] ARM: sunxi: Enable VGA bridge
Date: Thu,  8 Sep 2016 14:17:51 +0200
Message-ID: <20160908121751.16911-5-maxime.ripard@free-electrons.com>
References: <20160908121751.16911-1-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20160908121751.16911-1-maxime.ripard@free-electrons.com>
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
aWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2NvbmZpZ3Mvc3VueGlfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9zdW54aV9k
ZWZjb25maWcKaW5kZXggNzE0ZGEzMzZlYzg2Li5kODMwZTI1OGRiNTkgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtL2NvbmZpZ3Mvc3VueGlfZGVmY29uZmlnCisrKyBiL2FyY2gvYXJtL2NvbmZpZ3Mvc3Vu
eGlfZGVmY29uZmlnCkBAIC05OCw2ICs5OCw3IEBAIENPTkZJR19NRURJQV9SQ19TVVBQT1JUPXkK
IENPTkZJR19SQ19ERVZJQ0VTPXkKIENPTkZJR19JUl9TVU5YST15CiBDT05GSUdfRFJNPXkKK0NP
TkZJR19EUk1fUkdCX1RPX1ZHQT15CiBDT05GSUdfRFJNX1NVTjRJPXkKIENPTkZJR19GQj15CiBD
T05GSUdfRkJfU0lNUExFPXkKLS0gCjIuOS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
