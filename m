From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v1 2/2] drm: sti: make driver use devm_of_platform_populate()
Date: Fri, 17 Feb 2017 15:31:26 +0100
Message-ID: <1487341886-13829-3-git-send-email-benjamin.gaignard@linaro.org>
References: <1487341886-13829-1-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1487341886-13829-1-git-send-email-benjamin.gaignard@linaro.org>
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
aW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYu
YyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vc3RpL3N0aV9kcnYuYwppbmRleCBmZjcxZTI1Li4wMWVmOWE0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0
aV9kcnYuYwpAQCAtNDM4LDcgKzQzOCw3IEBAIHN0YXRpYyBpbnQgc3RpX3BsYXRmb3JtX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlkbWFfc2V0X2NvaGVyZW50X21hc2so
ZGV2LCBETUFfQklUX01BU0soMzIpKTsKIAotCW9mX3BsYXRmb3JtX3BvcHVsYXRlKG5vZGUsIE5V
TEwsIE5VTEwsIGRldik7CisJZGV2bV9vZl9wbGF0Zm9ybV9wb3B1bGF0ZShkZXYsIG5vZGUsIE5V
TEwsIE5VTEwsIGRldik7CiAKIAljaGlsZF9ucCA9IG9mX2dldF9uZXh0X2F2YWlsYWJsZV9jaGls
ZChub2RlLCBOVUxMKTsKIApAQCAtNDU0LDcgKzQ1NCw2IEBAIHN0YXRpYyBpbnQgc3RpX3BsYXRm
b3JtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiBzdGF0aWMgaW50IHN0aV9w
bGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAljb21wb25l
bnRfbWFzdGVyX2RlbCgmcGRldi0+ZGV2LCAmc3RpX29wcyk7Ci0Jb2ZfcGxhdGZvcm1fZGVwb3B1
bGF0ZSgmcGRldi0+ZGV2KTsKIAogCXJldHVybiAwOwogfQotLSAKMS45LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
