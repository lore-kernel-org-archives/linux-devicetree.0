From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v3 1/3] drm/omap: dmm_tiler: No need to check if irq is valid
 in omap_dmm_remove
Date: Tue, 10 Apr 2018 14:32:59 +0300
Message-ID: <20180410113301.18984-2-peter.ujfalusi@ti.com>
References: <20180410113301.18984-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180410113301.18984-1-peter.ujfalusi@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com
Cc: devicetree@vger.kernel.org, jsarha@ti.com, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

VGhlIGRyaXZlciBwcm9iZSB3b3VsZCBmYWlsIGlmIHRoZSBpcnEgaXMgbm90IGF2YWlsYWJsZS4K
ClNpZ25lZC1vZmYtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXIuYyB8IDMgKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMKaW5kZXggZTg0ODcxZTc0NjE1Li44NjcxZDA2YzBl
YjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kbW1fdGlsZXIuYwpAQCAtNjMyLDgg
KzYzMiw3IEBAIHN0YXRpYyBpbnQgb21hcF9kbW1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKmRldikKIAkJaWYgKG9tYXBfZG1tLT5kdW1teV9wYWdlKQogCQkJX19mcmVlX3BhZ2Uob21h
cF9kbW0tPmR1bW15X3BhZ2UpOwogCi0JCWlmIChvbWFwX2RtbS0+aXJxID4gMCkKLQkJCWZyZWVf
aXJxKG9tYXBfZG1tLT5pcnEsIG9tYXBfZG1tKTsKKwkJZnJlZV9pcnEob21hcF9kbW0tPmlycSwg
b21hcF9kbW0pOwogCiAJCWlvdW5tYXAob21hcF9kbW0tPmJhc2UpOwogCQlrZnJlZShvbWFwX2Rt
bSk7Ci0tIApQZXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0
dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtv
dGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
