From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/7] drm/bridge: Support hotplugging panel-bridge.
Date: Thu, 15 Jun 2017 13:41:24 -0700
Message-ID: <20170615204130.19255-2-eric@anholt.net>
References: <20170615204130.19255-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170615204130.19255-1-eric@anholt.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SWYgdGhlIHBhbmVsLWJyaWRnZSBpcyBiZWluZyBzZXQgdXAgYWZ0ZXIgdGhlIGRybV9tb2RlX2Nv
bmZpZ19yZXNldCgpLAp0aGVuIHRoZSBjb25uZWN0b3IncyBzdGF0ZSB3b3VsZCBuZXZlciBnZXQg
aW5pdGlhbGl6ZWQsIGFuZCB3ZSdkCmRlcmVmZXJlbmNlIHRoZSBOVUxMIGluIHRoZSBob3RwbHVn
IHBhdGguICBXZSBhbHNvIG5lZWQgdG8gcmVnaXN0ZXIKdGhlIGNvbm5lY3Rvciwgc28gdGhhdCB1
c2Vyc3BhY2UgY2FuIGdldCBhdCBpdC4KClNpZ25lZC1vZmYtYnk6IEVyaWMgQW5ob2x0IDxlcmlj
QGFuaG9sdC5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIHwgMyArKysK
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL3BhbmVsLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKaW5k
ZXggNjdmZTE5ZTVhOWM2Li44ZWQ4YTcwNzk5YzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvcGFuZWwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhbmVsLmMKQEAg
LTgyLDExICs4MiwxNCBAQCBzdGF0aWMgaW50IHBhbmVsX2JyaWRnZV9hdHRhY2goc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSkKIAogCWRybV9tb2RlX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcigm
cGFuZWxfYnJpZGdlLT5jb25uZWN0b3IsCiAJCQkJCSAgYnJpZGdlLT5lbmNvZGVyKTsKKwlkcm1f
YXRvbWljX2hlbHBlcl9jb25uZWN0b3JfcmVzZXQoJnBhbmVsX2JyaWRnZS0+Y29ubmVjdG9yKTsK
IAogCXJldCA9IGRybV9wYW5lbF9hdHRhY2gocGFuZWxfYnJpZGdlLT5wYW5lbCwgJnBhbmVsX2Jy
aWRnZS0+Y29ubmVjdG9yKTsKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAorCWRybV9j
b25uZWN0b3JfcmVnaXN0ZXIoJnBhbmVsX2JyaWRnZS0+Y29ubmVjdG9yKTsKKwogCXJldHVybiAw
OwogfQogCi0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
