From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 2/3] drm/vc4: Don't try to initialize FBDEV if we're only
 bound to V3D.
Date: Fri, 28 Apr 2017 15:42:22 -0700
Message-ID: <20170428224223.21904-2-eric@anholt.net>
References: <20170428224223.21904-1-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170428224223.21904-1-eric@anholt.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

VGhlIEZCREVWIGluaXRpYWxpemF0aW9uIHdvdWxkIHRocm93IGFuIGVycm9yIGluIGRtZXNnLCB3
aGVuIHdlIGp1c3QKd2FudCB0byBzaWxlbnRseSBub3QgaW5pdGlhbGl6ZSBmYmRldiBvbiBhIFYz
RC1vbmx5IFZDNCBpbnN0YW5jZS4KClNpZ25lZC1vZmYtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFu
aG9sdC5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfa21zLmMgfCAxMCArKysrKyst
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfa21zLmMKaW5kZXggYWQ3OTI1YTllMGVhLi4yMzdhNTA0ZjExZjAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92
YzQvdmM0X2ttcy5jCkBAIC0yMzAsMTAgKzIzMCwxMiBAQCBpbnQgdmM0X2ttc19sb2FkKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpCiAKIAlkcm1fbW9kZV9jb25maWdfcmVzZXQoZGV2KTsKIAotCXZj
NC0+ZmJkZXYgPSBkcm1fZmJkZXZfY21hX2luaXQoZGV2LCAzMiwKLQkJCQkJZGV2LT5tb2RlX2Nv
bmZpZy5udW1fY29ubmVjdG9yKTsKLQlpZiAoSVNfRVJSKHZjNC0+ZmJkZXYpKQotCQl2YzQtPmZi
ZGV2ID0gTlVMTDsKKwlpZiAoZGV2LT5tb2RlX2NvbmZpZy5udW1fY29ubmVjdG9yKSB7CisJCXZj
NC0+ZmJkZXYgPSBkcm1fZmJkZXZfY21hX2luaXQoZGV2LCAzMiwKKwkJCQkJCWRldi0+bW9kZV9j
b25maWcubnVtX2Nvbm5lY3Rvcik7CisJCWlmIChJU19FUlIodmM0LT5mYmRldikpCisJCQl2YzQt
PmZiZGV2ID0gTlVMTDsKKwl9CiAKIAlkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQoZGV2KTsKIAot
LSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
