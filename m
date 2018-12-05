From: Jayant Shekhar <jshekhar@codeaurora.org>
Subject: =?UTF-8?q?=5BDPU=20PATCH=C2=A0=5D=20drm/msm/dpu=3A=20Fix=20clock=20issue=20after=20bind=20failure?=
Date: Wed,  5 Dec 2018 21:51:47 +0530
Message-ID: <1544026907-24267-1-git-send-email-jshekhar@codeaurora.org>
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
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, Jayant Shekhar <jshekhar@codeaurora.org>, seanpaul@chromium.org, hoegsberg@chromium.org, chandanu@codeaurora.org
List-Id: devicetree@vger.kernel.org

SW4gY2FzZSBvZiBtc20gZHJtIGJpbmQgZmFpbHVyZSwgcG0gcnVudGltZSBwdXQgc3luYwppcyBj
YWxsZWQgZnJvbSBkc2kgZHJpdmVyIHdoaWNoIGlzc3VlcyBhbiBhc3luY2hyb25vdXMKcHV0IG9u
IG1kc3MgZGV2aWNlLiBTdWJzZXF1ZW50bHkgd2hlbiBkcHVfbWRzc19kZXN0cm95CmlzIHRyaWdn
ZXJlZCB0aGUgY2hhbmdlIHdpbGwgbWFrZSBzdXJlIHRvIHB1dCB0aGUgbWRzcwpkZXZpY2UgaW4g
c3VzcGVuZCBhbmQgY2xlYXJpbmcgcGVuZGluZyB3b3JrIGlmIG5vdApzY2hlZHVsZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBKYXlhbnQgU2hla2hhciA8anNoZWtoYXJAY29kZWF1cm9yYS5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X21kc3MuYyB8IDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X21kc3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9t
ZHNzLmMKaW5kZXggMmQ2NjAyNS4uMDMwMjI5YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L21zbS9kaXNwL2RwdTEvZHB1X21kc3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfbWRzcy5jCkBAIC0xOTEsNiArMTkxLDcgQEAgc3RhdGljIHZvaWQgZHB1X21kc3Nf
ZGVzdHJveShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCXN0cnVjdCBkc3NfbW9kdWxlX3Bvd2Vy
ICptcCA9ICZkcHVfbWRzcy0+bXA7CiAJaW50IGk7CiAKKwlwbV9ydW50aW1lX3N1c3BlbmQoZGV2
LT5kZXYpOwogCXBtX3J1bnRpbWVfZGlzYWJsZShkZXYtPmRldik7CiAJX2RwdV9tZHNzX2lycV9k
b21haW5fZmluaShkcHVfbWRzcyk7CiAJZnJlZV9pcnEocGxhdGZvcm1fZ2V0X2lycShwZGV2LCAw
KSwgZHB1X21kc3MpOwotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlz
IGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBGb3VuZGF0aW9uIENv
bGxhYm9yYXRpdmUgUHJvamVjdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
