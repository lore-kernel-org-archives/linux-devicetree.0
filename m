From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: qcs404: add the watchdog node
Date: Thu, 29 Aug 2019 22:03:40 +0200
Message-ID: <20190829200340.15498-2-jorge.ramirez-ortiz@linaro.org>
References: <20190829200340.15498-1-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829200340.15498-1-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Allows QCS404 based designs to enable watchdog support

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 131d8046d3be..17d4dd54c53a 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -875,6 +875,12 @@
 			#mbox-cells = <1>;
 		};
 
+		watchdog@b017000 {
+			compatible = "qcom,kpss-wdt";
+			reg = <0x0b017000 0x1000>;
+			clocks = <&sleep_clk>;
+		};
+
 		timer@b120000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.22.0
