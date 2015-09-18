From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 02/14] ARM: dts: ifc6410: remove unnecessary eeprom label
Date: Fri, 18 Sep 2015 13:30:38 +0100
Message-ID: <1442579438-19910-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1442579371-19822-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

This patch removes unnecessary eeprom label, which is not used
anywhere in the board file.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index b701f33..2ad2ab8 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -130,7 +130,7 @@
 				status = "okay";
 				clock-frequency = <200000>;
 
-				eeprom: eeprom@52 {
+				eeprom@52 {
 					compatible = "atmel,24c128";
 					reg = <0x52>;
 					pagesize = <32>;
-- 
1.9.1
