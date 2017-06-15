From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 4/7] drm/vc4: Use drm_mode_vrefresh() in DSI fixup,
 in case vrefresh is 0.
Date: Thu, 15 Jun 2017 13:41:27 -0700
Message-ID: <20170615204130.19255-5-eric@anholt.net>
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

SSdtIG5vdCBzdXJlIHdoYXQgY2hhbmdlZCB3aGVyZSBJIHN0YXJ0ZWQgZ2V0dGluZyB2cmVmcmVz
aD0wIGZyb20gdGhlCm1vZGUgdG8gYmUgZml4ZWQgdXAuCgpTaWduZWQtb2ZmLWJ5OiBFcmljIEFu
aG9sdCA8ZXJpY0BhbmhvbHQubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5j
IHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHNpLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF9kc2kuYwppbmRleCA2MjlkMzcyNjMzZTYuLmZjYTRkN2ZkNjc3ZSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfZHNpLmMKQEAgLTg2Niw3ICs4NjYsOSBAQCBzdGF0aWMgYm9vbCB2YzRfZHNp
X2VuY29kZXJfbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJYWRqdXN0
ZWRfbW9kZS0+Y2xvY2sgPSBwaXhlbF9jbG9ja19oeiAvIDEwMDAgKyAxOwogCiAJLyogR2l2ZW4g
dGhlIG5ldyBwaXhlbCBjbG9jaywgYWRqdXN0IEhGUCB0byBrZWVwIHZyZWZyZXNoIHRoZSBzYW1l
LiAqLwotCWFkanVzdGVkX21vZGUtPmh0b3RhbCA9IHBpeGVsX2Nsb2NrX2h6IC8gKG1vZGUtPnZy
ZWZyZXNoICogbW9kZS0+dnRvdGFsKTsKKwlhZGp1c3RlZF9tb2RlLT5odG90YWwgPSBwaXhlbF9j
bG9ja19oeiAvIChkcm1fbW9kZV92cmVmcmVzaChtb2RlKSAqCisJCQkJCQkgIG1vZGUtPnZ0b3Rh
bCk7CisKIAlhZGp1c3RlZF9tb2RlLT5oc3luY19lbmQgKz0gYWRqdXN0ZWRfbW9kZS0+aHRvdGFs
IC0gbW9kZS0+aHRvdGFsOwogCWFkanVzdGVkX21vZGUtPmhzeW5jX3N0YXJ0ICs9IGFkanVzdGVk
X21vZGUtPmh0b3RhbCAtIG1vZGUtPmh0b3RhbDsKIAotLSAKMi4xMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
