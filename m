From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 5/7] drm/vc4: Allow vblank to be disabled
Date: Tue, 18 Aug 2015 14:54:06 -0700
Message-ID: <1439934848-7196-6-git-send-email-eric@anholt.net>
References: <1439934848-7196-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1439934848-7196-1-git-send-email-eric@anholt.net>
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
Cc: devicetree@vger.kernel.org, Derek Foreman <derekf@osg.samsung.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

RnJvbTogRGVyZWsgRm9yZW1hbiA8ZGVyZWtmQG9zZy5zYW1zdW5nLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IERlcmVrIEZvcmVtYW4gPGRlcmVrZkBvc2cuc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6
IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZjNC92
YzRfa21zLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF9rbXMuYwppbmRleCBhMzQ0MzlmLi5mODgxY2Q0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9rbXMuYwpA
QCAtNzcsNiArNzcsOCBAQCBpbnQgdmM0X2ttc19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYp
CiAJZGV2LT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZ2YzRfbW9kZV9mdW5jczsKIAlkZXYtPm1vZGVf
Y29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDI0OwogCisJZGV2LT52YmxhbmtfZGlzYWJsZV9hbGxv
d2VkID0gdHJ1ZTsKKwogCXJldCA9IHZjNF9pbml0X21vZGVzZXRfb2JqZWN0cyhkZXYpOwogCWlm
IChyZXQpCiAJCWdvdG8gZmFpbDsKLS0gCjIuMS40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
