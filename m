From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 09/14] ARM: dts: ifc6410: Add missing pinctrl to gsbi7 uart
Date: Fri, 18 Sep 2015 13:31:47 +0100
Message-ID: <1442579507-20314-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds missing 2pin uart pinctrl property to gsbi7 uart on
IFC6410.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 56eaf5a..c1d5bd7 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -154,6 +154,8 @@
 			qcom,mode = <GSBI_PROT_I2C_UART>;
 			serial@16640000 {
 				status = "ok";
+				pinctrl-names = "default";
+				pinctrl-0 = <&gsbi7_uart_2pins>;
 			};
 		};
 
-- 
1.9.1
