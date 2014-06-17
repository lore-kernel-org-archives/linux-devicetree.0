From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv6 3/3] dt-bindings: mfd: s2mps11: Add support S2MPU02 PMIC
Date: Tue, 17 Jun 2014 09:27:10 +0900
Message-ID: <1402964830-24890-4-git-send-email-cw00.choi@samsung.com>
References: <1402964830-24890-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1402964830-24890-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org, sameo@linux.intel.com
Cc: sbkim73@samsung.com, k.kozlowski@samsung.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, t.figa@samsung.com, sachin.kamat@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch add documentation for S2MPU02 PMIC device. S2MPU02 has a little
difference from S2MPS11/S2MPS14 PMIC and has LDO[1-28]/Buck[1-7].

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/devicetree/bindings/mfd/s2mps11.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
index d81ba30..f7c9180 100644
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@ -1,5 +1,5 @@
 
-* Samsung S2MPS11 and S2MPS14 Voltage and Current Regulator
+* Samsung S2MPS11, S2MPS14 and S2MPU02 Voltage and Current Regulator
 
 The Samsung S2MPS11 is a multi-function device which includes voltage and
 current regulators, RTC, charger controller and other sub-blocks. It is
@@ -7,7 +7,8 @@ interfaced to the host controller using an I2C interface. Each sub-block is
 addressed by the host system using different I2C slave addresses.
 
 Required properties:
-- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-pmic".
+- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-pmic"
+              or "samsung,s2mpu02-pmic".
 - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
 
 Optional properties:
@@ -81,11 +82,13 @@ as per the datasheet of s2mps11.
 		  - valid values for n are:
 			- S2MPS11: 1 to 38
 			- S2MPS14: 1 to 25
+			- S2MPU02: 1 to 28
 		  - Example: LDO1, LD02, LDO28
 	- BUCKn
 		  - valid values for n are:
 			- S2MPS11: 1 to 10
 			- S2MPS14: 1 to 5
+			- S2MPU02: 1 to 7
 		  - Example: BUCK1, BUCK2, BUCK9
 
 Example:
-- 
1.8.0
