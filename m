From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: sdm845-mtp: Reserve reserved gpios
Date: Fri,  2 Nov 2018 14:45:32 -0700
Message-ID: <20181102214532.17661-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

With the introduction of commit 3edfb7bd76bd ("gpiolib: Show correct
direction from the beginning") the gpiolib will attempt to read the
direction of all pins, which triggers a read from protected register
regions.

The pins 0 through 3 and 81 through 84 are protected, so mark these as
reserved.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Given that mainline has not yet booted on the SDM845 MTP or MSM8998 MTP
(which seems to be the affected platform), I think it's better to pick this
change than to rework the offending commit.

 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index eedfaf8922e2..d667eee4e6d0 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -352,6 +352,10 @@
 	status = "okay";
 };
 
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+};
+
 &uart9 {
 	status = "okay";
 };
-- 
2.18.0
