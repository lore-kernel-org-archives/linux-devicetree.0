From: Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: [PATCH v4 2/3] arm64: dts: sdm845: Add dsi pinctrl nodes
Date: Fri,  2 Nov 2018 15:26:15 -0700
Message-ID: <1541197576-19730-3-git-send-email-jsanka@codeaurora.org>
References: <1541197576-19730-1-git-send-email-jsanka@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1541197576-19730-1-git-send-email-jsanka@codeaurora.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: dianders@chromium.org, mka@chromium.org, hoegsberg@google.com, seanpaul@chromium.org
List-Id: devicetree@vger.kernel.org

QWRkIGRzaSBhY3RpdmUvc3VzcGVuZCBwaW5jdHJsIG5vZGVzIHRvIHNkbTg0NSBTb0MgZHRzLgoK
Q2hhbmdlcyBpbiB2NDoKCS0gcGF0Y2ggaW50cm9kdWNlZCBpbiB0aGUgc2VyaWVzCgpTaWduZWQt
b2ZmLWJ5OiBKZXlrdW1hciBTYW5rYXJhbiA8anNhbmthQGNvZGVhdXJvcmEub3JnPgotLS0KIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zZG04NDUuZHRzaSB8IDE0ICsrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvcWNvbS9zZG04NDUuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zZG04
NDUuZHRzaQppbmRleCA1NzI4YjRjLi4zNWRmNWQyIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3Fjb20vc2RtODQ1LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3Nk
bTg0NS5kdHNpCkBAIC04MjIsNiArODIyLDIwIEBACiAJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsK
IAkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47CiAKKwkJCWRwdV9kc2lfYWN0aXZlOiBkcHUtZHNp
LWFjdGl2ZSB7CisJCQkJcGlubXV4IHsKKwkJCQkJcGlucyA9ICJncGlvNiIsICJncGlvNTIiOwor
CQkJCQlmdW5jdGlvbiA9ICJncGlvIjsKKwkJCQl9OworCQkJfTsKKworCQkJZHB1X2RzaV9zdXNw
ZW5kOiBkcHUtZHNpLXN1c3BlbmQgeworCQkJCXBpbm11eCB7CisJCQkJCXBpbnMgPSAiZ3BpbzYi
LCAiZ3BpbzUyIjsKKwkJCQkJZnVuY3Rpb24gPSAiZ3BpbyI7CisJCQkJfTsKKwkJCX07CisKIAkJ
CXF1cF9pMmMwX2RlZmF1bHQ6IHF1cC1pMmMwLWRlZmF1bHQgewogCQkJCXBpbm11eCB7CiAJCQkJ
CXBpbnMgPSAiZ3BpbzAiLCAiZ3BpbzEiOwotLSAKVGhlIFF1YWxjb21tIElubm92YXRpb24gQ2Vu
dGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSBGb3J1bSwKYSBMaW51eCBG
b3VuZGF0aW9uIENvbGxhYm9yYXRpdmUgUHJvamVjdAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
