From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v2 2/2] drm: sti: make driver use devm_of_platform_populate()
Date: Fri, 24 Feb 2017 17:14:34 +0100
Message-ID: <1487952874-23635-3-git-send-email-benjamin.gaignard@linaro.org>
References: <1487952874-23635-1-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1487952874-23635-1-git-send-email-benjamin.gaignard@linaro.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: robh+dt@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vincent.abriou@st.com, dri-devel@lists.freedesktop.org
Cc: linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

VGhpcyBtYWtlIHN1cmUgdGhhdCBvZl9wbGF0Zm9ybV9kZXBvcHVsYXRlKCkgaXMgY2FsbGVkIGlm
IGFuIGVycm9yCm9jY3VyIGluIHByb2JlIGFmdGVyIHBvcHVsYXRpbmcgdGhlIGRhdGUgZnJvbSB0
aGUgZGV2aWNlIHRyZWUuCgpTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFt
aW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KLS0tCnZlcnNpb24gMjoKLSB1c2Ugc2ltcGxpZmllZCBk
ZXZtX29mX3BsYXRmb3JtX3BvcHVsYXRlIGZ1bmN0aW9uIHByb3RvdHlwZQoKIGRyaXZlcnMvZ3B1
L2RybS9zdGkvc3RpX2Rydi5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2Rydi5jCmluZGV4IGZmNzFlMjUuLmIyNmIx
YmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2Rydi5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9zdGkvc3RpX2Rydi5jCkBAIC00MzgsNyArNDM4LDcgQEAgc3RhdGljIGludCBz
dGlfcGxhdGZvcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWRtYV9z
ZXRfY29oZXJlbnRfbWFzayhkZXYsIERNQV9CSVRfTUFTSygzMikpOwogCi0Jb2ZfcGxhdGZvcm1f
cG9wdWxhdGUobm9kZSwgTlVMTCwgTlVMTCwgZGV2KTsKKwlkZXZtX29mX3BsYXRmb3JtX3BvcHVs
YXRlKGRldik7CiAKIAljaGlsZF9ucCA9IG9mX2dldF9uZXh0X2F2YWlsYWJsZV9jaGlsZChub2Rl
LCBOVUxMKTsKIApAQCAtNDU0LDcgKzQ1NCw2IEBAIHN0YXRpYyBpbnQgc3RpX3BsYXRmb3JtX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiBzdGF0aWMgaW50IHN0aV9wbGF0Zm9y
bV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAljb21wb25lbnRfbWFz
dGVyX2RlbCgmcGRldi0+ZGV2LCAmc3RpX29wcyk7Ci0Jb2ZfcGxhdGZvcm1fZGVwb3B1bGF0ZSgm
cGRldi0+ZGV2KTsKIAogCXJldHVybiAwOwogfQotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
