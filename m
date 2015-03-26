From: Hyungwon Hwang <human.hwang@samsung.com>
Subject: [PATCH v3 8/8] drm/exynos: dsi: do not set TE GPIO direction by input
Date: Thu, 26 Mar 2015 20:15:40 +0900
Message-ID: <1427368540-28010-9-git-send-email-human.hwang@samsung.com>
References: <1427368540-28010-1-git-send-email-human.hwang@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1427368540-28010-1-git-send-email-human.hwang@samsung.com>
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
YW4uaHdhbmdAc2Ftc3VuZy5jb20+Ci0tLQpDaGFuZ2VzIGZvciB2MjoKIC0gTm9uZQoKQ2hhbmdl
cyBmb3IgdjM6CiAtIE5vbmUKCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNp
LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5j
IGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCmluZGV4IGQzODI1MTEu
LjIzMDA4MmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9k
c2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHNpLmMKQEAgLTEz
MTYsMTUgKzEzMTYsMTUgQEAgc3RhdGljIGludCBleHlub3NfZHNpX3JlZ2lzdGVyX3RlX2lycShz
dHJ1Y3QgZXh5bm9zX2RzaSAqZHNpKQogCQlnb3RvIG91dDsKIAl9CiAKLQlyZXQgPSBncGlvX3Jl
cXVlc3Rfb25lKGRzaS0+dGVfZ3BpbywgR1BJT0ZfSU4sICJ0ZV9ncGlvIik7CisJcmV0ID0gZ3Bp
b19yZXF1ZXN0KGRzaS0+dGVfZ3BpbywgInRlX2dwaW8iKTsKIAlpZiAocmV0KSB7CiAJCWRldl9l
cnIoZHNpLT5kZXYsICJncGlvIHJlcXVlc3QgZmFpbGVkIHdpdGggJWRcbiIsIHJldCk7CiAJCWdv
dG8gb3V0OwogCX0KIAogCXRlX2dwaW9faXJxID0gZ3Bpb190b19pcnEoZHNpLT50ZV9ncGlvKTsK
LQogCWlycV9zZXRfc3RhdHVzX2ZsYWdzKHRlX2dwaW9faXJxLCBJUlFfTk9BVVRPRU4pOworCiAJ
cmV0ID0gcmVxdWVzdF90aHJlYWRlZF9pcnEodGVfZ3Bpb19pcnEsIGV4eW5vc19kc2lfdGVfaXJx
X2hhbmRsZXIsIE5VTEwsCiAJCQkJCUlSUUZfVFJJR0dFUl9SSVNJTkcsICJURSIsIGRzaSk7CiAJ
aWYgKHJldCkgewotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
