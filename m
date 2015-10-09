From: Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 5/7] drm/vc4: Allow vblank to be disabled
Date: Fri,  9 Oct 2015 14:27:46 -0700
Message-ID: <1444426068-15817-6-git-send-email-eric@anholt.net>
References: <1444426068-15817-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1444426068-15817-1-git-send-email-eric@anholt.net>
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
YzRfa21zLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92
YzRfa21zLmMKaW5kZXggZWUzZTAwNC4uMmU1NTk3ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfa21zLmMKQEAg
LTUxLDYgKzUxLDcgQEAgaW50IHZjNF9rbXNfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQog
CWRldi0+bW9kZV9jb25maWcubWF4X2hlaWdodCA9IDIwNDg7CiAJZGV2LT5tb2RlX2NvbmZpZy5m
dW5jcyA9ICZ2YzRfbW9kZV9mdW5jczsKIAlkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0
aCA9IDI0OworCWRldi0+dmJsYW5rX2Rpc2FibGVfYWxsb3dlZCA9IHRydWU7CiAKIAlkcm1fbW9k
ZV9jb25maWdfcmVzZXQoZGV2KTsKIAotLSAKMi4xLjQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
