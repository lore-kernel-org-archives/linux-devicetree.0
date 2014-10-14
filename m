From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 1/2] dt-bindings: mfd: s2mps11: add documentation for s2mps15
 PMIC
Date: Tue, 14 Oct 2014 13:44:27 +0530
Message-ID: <1413274468-8765-2-git-send-email-thomas.ab@samsung.com>
References: <1413274468-8765-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1413274468-8765-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add dt-binding documentation for s2mps15 PMIC device. The s2mps15 device
is similar to s2mps11/14 PMIC device and has 27 LDO and 10 buck regulators.

Cc: devicetree@vger.kernel.org
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 Documentation/devicetree/bindings/mfd/s2mps11.txt |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
index 0e4026a..41ee3f5 100644
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@ -1,5 +1,5 @@
 
-* Samsung S2MPS11, S2MPS14 and S2MPU02 Voltage and Current Regulator
+* Samsung S2MPS11/14/15 and S2MPU02 Voltage and Current Regulator
 
 The Samsung S2MPS11 is a multi-function device which includes voltage and
 current regulators, RTC, charger controller and other sub-blocks. It is
@@ -7,8 +7,11 @@ interfaced to the host controller using an I2C interface. Each sub-block is
 addressed by the host system using different I2C slave addresses.
 
 Required properties:
-- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-pmic"
-              or "samsung,s2mpu02-pmic".
+- compatible: Should be one of the following
+	- "samsung,s2mps11-pmic"
+	- "samsung,s2mps14-pmic"
+	- "samsung,s2mps15-pmic"
+	- "samsung,s2mpu02-pmic"
 - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
 
 Optional properties:
@@ -82,12 +85,14 @@ as per the datasheet of s2mps11.
 		  - valid values for n are:
 			- S2MPS11: 1 to 38
 			- S2MPS14: 1 to 25
+			- S2MPS15: 1 to 27
 			- S2MPU02: 1 to 28
 		  - Example: LDO1, LDO2, LDO28
 	- BUCKn
 		  - valid values for n are:
 			- S2MPS11: 1 to 10
 			- S2MPS14: 1 to 5
+			- S2MPS15: 1 to 10
 			- S2MPU02: 1 to 7
 		  - Example: BUCK1, BUCK2, BUCK9
 
-- 
1.6.6.rc2
