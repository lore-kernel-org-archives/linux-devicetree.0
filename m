From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 8/8] ARM: dts: qcom-apq8064: Set 'xo_board' as ref clock of
 the DSI PHY
Date: Tue,  4 Dec 2018 14:42:34 -0800
Message-ID: <20181204224234.62619-9-mka@chromium.org>
References: <20181204224234.62619-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181204224234.62619-1-mka@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org, Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, Sean Paul <seanpaul@chromium.org>, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

QWRkICd4b19ib2FyZCcgYXMgcmVmIGNsb2NrIGZvciB0aGUgRFNJIFBIWSwgaXQgd2FzIHByZXZp
b3VzbHkKaGFyZGNvZGVkIGluIHRoZSBQTEwgJ2RyaXZlcicgZm9yIHRoZSAyOG5tIDg5NjAgUEhZ
LgoKU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+ClJl
dmlld2VkLWJ5OiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+Ci0tLQpDaGFuZ2Vz
IGluIHY0OgotIGFkZGVkICdSZXZpZXdlZC1ieTogU3RlcGhlbiBCb3lkIDxzd2JveWRAY2hyb21p
dW0ub3JnPicgdGFnCgpDaGFuZ2VzIGluIHYzOgotIHBhdGNoIGFkZGVkIHRvIHRoZSBzZXJpZXMK
LS0tCiBhcmNoL2FybS9ib290L2R0cy9xY29tLWFwcTgwNjQuZHRzaSB8IDUgKysrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1hcHE4MDY0LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9x
Y29tLWFwcTgwNjQuZHRzaQppbmRleCA0OGMzY2Y0Mjc2MTAxLi5kMzM3YWU5MzI2Y2Q4IDEwMDY0
NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9xY29tLWFwcTgwNjQuZHRzaQorKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9xY29tLWFwcTgwNjQuZHRzaQpAQCAtMTMzOCw4ICsxMzM4LDkgQEAKIAkJCQk8
MHgwNDcwMDMwMCAweDIwMD4sCiAJCQkJPDB4MDQ3MDA1MDAgMHg1Yz47CiAJCQlyZWctbmFtZXMg
PSAiZHNpX3BsbCIsICJkc2lfcGh5IiwgImRzaV9waHlfcmVndWxhdG9yIjsKLQkJCWNsb2NrLW5h
bWVzID0gImlmYWNlX2NsayI7Ci0JCQljbG9ja3MgPSA8Jm1tY2MgRFNJX01fQUhCX0NMSz47CisJ
CQljbG9jay1uYW1lcyA9ICJpZmFjZV9jbGsiLCAicmVmIjsKKwkJCWNsb2NrcyA9IDwmbW1jYyBE
U0lfTV9BSEJfQ0xLPiwKKwkJCQkgPCZ4b19ib2FyZD47CiAJCX07CiAKIAotLSAKMi4yMC4wLnJj
MS4zODcuZ2Y4NTA1NzYyZTMtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
