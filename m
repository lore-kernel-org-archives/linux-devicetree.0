From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 4/7] arm64: dts: qcom: msm8916: Set 'xo_board' as ref clock
 of the DSI PHY
Date: Mon, 26 Nov 2018 15:11:56 -0800
Message-ID: <20181126231159.122298-5-mka@chromium.org>
References: <20181126231159.122298-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181126231159.122298-1-mka@chromium.org>
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

QWRkICd4b19ib2FyZCcgYXMgcmVmIGNsb2NrIGZvciB0aGUgRFNJIFBIWXMsIGl0IHdhcyBwcmV2
aW91c2x5CmhhcmRjb2RlZCBpbiB0aGUgUExMICdkcml2ZXInIGZvciB0aGUgMjhubSBQSFkuCgpT
aWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KLS0tCkNo
YW5nZXMgaW4gdjI6Ci0gcGF0Y2ggYWRkZWQgdG8gdGhlIHNlcmllcwotLS0KIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvcWNvbS9tc204OTE2LmR0c2kgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvcWNvbS9tc204OTE2LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vbXNtODkx
Ni5kdHNpCmluZGV4IGQzMDJkOGQ2MzlhMTIuLjg5ZjMwZjM0ZmY4OTYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9tc204OTE2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9xY29tL21zbTg5MTYuZHRzaQpAQCAtOTU5LDggKzk1OSw5IEBACiAJCQkJI2Nsb2NrLWNl
bGxzID0gPDE+OwogCQkJCSNwaHktY2VsbHMgPSA8MD47CiAKLQkJCQljbG9ja3MgPSA8JmdjYyBH
Q0NfTURTU19BSEJfQ0xLPjsKLQkJCQljbG9jay1uYW1lcyA9ICJpZmFjZSI7CisJCQkJY2xvY2tz
ID0gPCZnY2MgR0NDX01EU1NfQUhCX0NMSz4sCisJCQkJCSA8JnhvX2JvYXJkPjsKKwkJCQljbG9j
ay1uYW1lcyA9ICJpZmFjZSIsICJyZWYiOwogCQkJfTsKIAkJfTsKIAotLSAKMi4yMC4wLnJjMC4z
ODcuZ2M3YTY5ZTZiNmMtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
