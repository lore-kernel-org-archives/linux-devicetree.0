From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH v2 0/2] Introduce devm_of_platform_populate() helper
Date: Fri, 24 Feb 2017 17:14:32 +0100
Message-ID: <1487952874-23635-1-git-send-email-benjamin.gaignard@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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

dmVyc2lvbiAyOgotIHNpbXBsaWZ5IGZ1bmN0aW9uIHByb3RvdHlwZSB0byBvbmx5IGtlZXAgZGV2
aWNlIGFzIHBhcmFtZXRlcgotIHJlYmFzZWQgb24gdjQuMTAKCkxvdHMgb2YgY2FsbHMgdG8gb2Zf
cGxhdGZvcm1fcG9wdWxhdGUoKSBhcmUgbm90IHVuYmFsYW5jZWQgYnkgYSBjYWxsCnRvIG9mX3Bs
YXRmb3JtX2RlcG9wdWxhdGUoKS4gVGhpcyBjcmVhdGUgaXNzdWVzIHdoaWxlIGRyaXZlcnMgYXJl
CmJpbmQvdW5iaW5kLgogICAgCkluIHdheSB0byBzb2x2ZSB0aG9zZSBpc3N1ZXMgaXMgdG8gYWRk
IGRldm1fb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKQp3aGljaCB3aWxsIGNhbGwgb2ZfcGxhdGZvcm1f
ZGVwb3B1bGF0ZSgpIHdoZW4gdGhlIGRldmljZSBpcyB1bmJvdW5kCmZyb20gdGhlIGJ1cy4gVGhp
cyBhbHNvIGNvdWxkIG1ha2UgZHJpdmVycyBtb3JlIHJvYnVzdCBpbiBjYXNlIHRoYXQKcHJvYmUg
ZmFpbGVkIGFmdGVyIGNhbGxpbmcgb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKS4KCkJlbmphbWluIEdh
aWduYXJkICgyKToKICBvZjogYWRkIGRldm1fIGZ1bmN0aW9ucyBmb3IgcG9wdWxhdGUgYW5kIGRl
cG9wdWxhdGUKICBkcm06IHN0aTogbWFrZSBkcml2ZXIgdXNlIGRldm1fb2ZfcGxhdGZvcm1fcG9w
dWxhdGUoKQoKIGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2Rydi5jIHwgIDMgKy0KIGRyaXZlcnMv
b2YvcGxhdGZvcm0uYyAgICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogaW5jbHVkZS9saW51eC9vZl9wbGF0Zm9ybS5oICAgfCAxMSArKysrKysr
CiAzIGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgotLSAK
MS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
