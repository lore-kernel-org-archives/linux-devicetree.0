From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCHv2 2/3] drm: bridge: dw-hdmi: check the cec-disable property
Date: Fri, 23 Mar 2018 13:59:14 +0100
Message-ID: <20180323125915.13986-3-hverkuil@xs4all.nl>
References: <20180323125915.13986-1-hverkuil@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180323125915.13986-1-hverkuil@xs4all.nl>
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
LmNvbT4KUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwppbmRleCBhMzhkYjQwY2U5OTAuLjU5
NzIyMGU0MDU0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMK
QEAgLTI1MDgsNyArMjUwOCw4IEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LAogCQloZG1pLT5hdWRpbyA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9mdWxs
KCZwZGV2aW5mbyk7CiAJfQogCi0JaWYgKGNvbmZpZzAgJiBIRE1JX0NPTkZJRzBfQ0VDKSB7CisJ
aWYgKChjb25maWcwICYgSERNSV9DT05GSUcwX0NFQykgJiYKKwkgICAgIW9mX3Byb3BlcnR5X3Jl
YWRfYm9vbChucCwgImNlYy1kaXNhYmxlIikpIHsKIAkJY2VjLmhkbWkgPSBoZG1pOwogCQljZWMu
b3BzID0gJmR3X2hkbWlfY2VjX29wczsKIAkJY2VjLmlycSA9IGlycTsKLS0gCjIuMTUuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
