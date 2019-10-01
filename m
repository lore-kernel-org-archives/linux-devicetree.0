From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v6 2/6] arm64: dts: msm8998: Add xo clock to gcc node
Date: Tue,  1 Oct 2019 13:56:33 -0600
Message-ID: <1569959793-8309-1-git-send-email-jhugo@codeaurora.org>
References: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bjorn.andersson@linaro.org
Cc: agross@kernel.org, marc.w.gonzalez@free.fr, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
List-Id: devicetree@vger.kernel.org

GCC is a consumer of the xo clock.  Add a reference to the clock supplier
to the gcc node.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index a0de62f10792..c926122566ae 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -743,6 +743,8 @@
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 			reg = <0x00100000 0xb0000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
 		};
 
 		rpm_msg_ram: memory@778000 {
-- 
2.17.1
