From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] Documentation/mfd: Update s2mps11.txt
Date: Fri,  8 Nov 2013 17:05:42 +0530
Message-ID: <1383910542-19349-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, devicetree@vger.kernel.org, lee.jones@linaro.org, rob@landley.net, sachin.kamat@linaro.org
List-Id: devicetree@vger.kernel.org

Updated the number of LDOs and BUCKs as per the user manual.
Fixed trivial typos to improve readability.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 Documentation/devicetree/bindings/mfd/s2mps11.txt |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
index c9332c626021..78a840d7510d 100644
--- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
+++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
@@ -1,10 +1,10 @@
 
 * Samsung S2MPS11 Voltage and Current Regulator
 
-The Samsung S2MP211 is a multi-function device which includes voltage and
+The Samsung S2MPS11 is a multi-function device which includes voltage and
 current regulators, RTC, charger controller and other sub-blocks. It is
-interfaced to the host controller using a I2C interface. Each sub-block is
-addressed by the host system using different I2C slave address.
+interfaced to the host controller using an I2C interface. Each sub-block is
+addressed by the host system using different I2C slave addresses.
 
 Required properties:
 - compatible: Should be "samsung,s2mps11-pmic".
@@ -43,7 +43,8 @@ sub-node should be of the format as listed below.
 
  BUCK[2/3/4/6] supports disabling ramp delay on hardware, so explictly
  regulator-ramp-delay = <0> can be used for them to disable ramp delay.
- In absence of regulator-ramp-delay property, default ramp delay will be used.
+ In the absence of the regulator-ramp-delay property, the default ramp
+ delay will be used.
 
 NOTE: Some BUCKs share the ramp rate setting i.e. same ramp value will be set
 for a particular group of BUCKs. So provide same regulator-ramp-delay<value>.
@@ -58,10 +59,10 @@ supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
 as per the datasheet of s2mps11.
 
 	- LDOn
-		  - valid values for n are 1 to 28
+		  - valid values for n are 1 to 38
 		  - Example: LDO0, LD01, LDO28
 	- BUCKn
-		  - valid values for n are 1 to 9.
+		  - valid values for n are 1 to 10.
 		  - Example: BUCK1, BUCK2, BUCK9
 
 Example:
-- 
1.7.9.5

