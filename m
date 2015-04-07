From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH v4 8/8] drm/exynos: dsi: do not set TE GPIO direction by input
Date: Tue, 07 Apr 2015 20:57:38 +0900
Message-ID: <1428407858-25523-9-git-send-email-human.hwang@samsung.com>
References: <1428407858-25523-1-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1428407858-25523-1-git-send-email-human.hwang@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, inki.dae@samsung.com, daniel@fooishbar.org
Cc: dh09.lee@samsung.com, sw0312.kim@samsung.com, Hyungwon Hwang <human.hwang@samsung.com>, cw00.choi@samsung.com
List-Id: devicetree@vger.kernel.org

T24gc29tZSBib2FyZCwgVEUgR1BJTyBzaG91bGQgYmUgY29uZmlndXJlZCBwcm9wZXJseSB0aG91
Z2hvdXQgcGluY3RybCBkcml2ZXIKYXMgYW4gd2FrZXVwIGludGVycnVwdC4gU28gdGhpcyBncGlv
IHNob3VsZCBiZSBjb25maWd1cmFibGUgaW4gdGhlIGJvYXJkJ3MgRFQsCm5vdCBiZWluZyByZXF1
ZXN0ZWQgYXMgYSBpbnB1dCBwaW4uCgpTaWduZWQtb2ZmLWJ5OiBIeXVuZ3dvbiBId2FuZyA8aHVt
YW4uaHdhbmdAc2Ftc3VuZy5jb20+Ci0tLQpDaGFuZ2VzIGZvciB2MjoKLSBOb25lCgpDaGFuZ2Vz
IGZvciB2MzoKLSBOb25lCgpDaGFuZ2VzIGZvciB2NDoKLSBOb25lCiBkcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2RzaS5jCmluZGV4IGQzODI1MTEuLjIzMDA4MmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZHNpLmMKQEAgLTEzMTYsMTUgKzEzMTYsMTUgQEAgc3RhdGljIGludCBleHlub3Nf
ZHNpX3JlZ2lzdGVyX3RlX2lycShzdHJ1Y3QgZXh5bm9zX2RzaSAqZHNpKQogCQlnb3RvIG91dDsK
IAl9CgotCXJldCA9IGdwaW9fcmVxdWVzdF9vbmUoZHNpLT50ZV9ncGlvLCBHUElPRl9JTiwgInRl
X2dwaW8iKTsKKwlyZXQgPSBncGlvX3JlcXVlc3QoZHNpLT50ZV9ncGlvLCAidGVfZ3BpbyIpOwog
CWlmIChyZXQpIHsKIAkJZGV2X2Vycihkc2ktPmRldiwgImdwaW8gcmVxdWVzdCBmYWlsZWQgd2l0
aCAlZFxuIiwgcmV0KTsKIAkJZ290byBvdXQ7CiAJfQoKIAl0ZV9ncGlvX2lycSA9IGdwaW9fdG9f
aXJxKGRzaS0+dGVfZ3Bpbyk7Ci0KIAlpcnFfc2V0X3N0YXR1c19mbGFncyh0ZV9ncGlvX2lycSwg
SVJRX05PQVVUT0VOKTsKKwogCXJldCA9IHJlcXVlc3RfdGhyZWFkZWRfaXJxKHRlX2dwaW9faXJx
LCBleHlub3NfZHNpX3RlX2lycV9oYW5kbGVyLCBOVUxMLAogCQkJCQlJUlFGX1RSSUdHRVJfUklT
SU5HLCAiVEUiLCBkc2kpOwogCWlmIChyZXQpIHsKLS0KMS45LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
