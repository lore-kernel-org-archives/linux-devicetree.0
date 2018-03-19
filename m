From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 2/3] drm: bridge: dw-hdmi: check the cec-disable property
Date: Mon, 19 Mar 2018 12:43:44 +0100
Message-ID: <20180319114345.29837-3-hverkuil@xs4all.nl>
References: <20180319114345.29837-1-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180319114345.29837-1-hverkuil@xs4all.nl>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: linux-media@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

RnJvbTogSGFucyBWZXJrdWlsIDxoYW5zLnZlcmt1aWxAY2lzY28uY29tPgoKSWYgdGhlIGNlYy1k
aXNhYmxlIHByb3BlcnR5IHdhcyBzZXQsIHRoZW4gZGlzYWJsZSB0aGUgRFcgQ0VDCmNvbnRyb2xs
ZXIuIFRoaXMgaXMgbmVlZGVkIGZvciBib2FyZHMgdGhhdCBoYXZlIHRoZWlyIG93bgpDRUMgY29u
dHJvbGxlci4KClNpZ25lZC1vZmYtYnk6IEhhbnMgVmVya3VpbCA8aGFucy52ZXJrdWlsQGNpc2Nv
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDMg
KystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwppbmRleCBhMzhkYjQwY2U5OTAu
LjU5NzIyMGU0MDU0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5
cy9kdy1oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LmMKQEAgLTI1MDgsNyArMjUwOCw4IEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2LAogCQloZG1pLT5hdWRpbyA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9m
dWxsKCZwZGV2aW5mbyk7CiAJfQogCi0JaWYgKGNvbmZpZzAgJiBIRE1JX0NPTkZJRzBfQ0VDKSB7
CisJaWYgKChjb25maWcwICYgSERNSV9DT05GSUcwX0NFQykgJiYKKwkgICAgIW9mX3Byb3BlcnR5
X3JlYWRfYm9vbChucCwgImNlYy1kaXNhYmxlIikpIHsKIAkJY2VjLmhkbWkgPSBoZG1pOwogCQlj
ZWMub3BzID0gJmR3X2hkbWlfY2VjX29wczsKIAkJY2VjLmlycSA9IGlycTsKLS0gCjIuMTUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
