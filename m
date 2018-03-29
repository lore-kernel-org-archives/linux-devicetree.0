From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v4 6/7] dt-bindings: phy-qcom-usb2: Add support to override tuning values
Date: Thu, 29 Mar 2018 16:34:25 +0530
Message-ID: <1522321466-21755-7-git-send-email-mgautam@codeaurora.org>
References: <1522321466-21755-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522321466-21755-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh@kernel.org, sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, vivek.gautam@codeaurora.org, evgreen@chromium.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

To improve eye diagram for PHYs on different boards of same SOC,
some parameters may need to be changed. Provide device tree
properties to override these from board specific device tree
files. While at it, replace "qcom,qusb2-v2-phy" with compatible
string for USB2 PHY on sdm845 which was earlier added for
sdm845 only.

Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt        | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
index 42c9742..0ed140a 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
@@ -6,7 +6,7 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
 Required properties:
  - compatible: compatible list, contains
 	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
-	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY.
+	       "qcom,sdm845-qusb2-phy" for 10nm PHY on sdm845.
 
  - reg: offset and length of the PHY register set.
  - #phy-cells: must be 0.
@@ -27,6 +27,23 @@ Optional properties:
 		tuning parameter value for qusb2 phy.
 
  - qcom,tcsr-syscon: Phandle to TCSR syscon register region.
+ - qcom,imp-res-offset-value: It is a 6 bit value that specifies offset to be
+		added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
+		tuning paramter that may vary for different boards of same SOC.
+ - qcom,hstx-trim-value: It is a 4 bit value that specifies tuning for HSTX
+		output current. 0x0 value corresponding to 24mA which is maximum
+		current and 0xf corresponds to lowest current which is 15mA.
+ - qcom,preemphasis-level: It is a 2 bit value that specifies pre-emphasis level.
+		Possible values are:
+		00: NONE
+		01: +5%
+		10: +10%
+		11: +15%
+- qcom,preemphasis-width: It is a 1 bit value that specifies how long the HSTX
+		pre-emphasis (specified using qcom,preemphasis-level) must be in
+		effect. Possible values are:
+		0: Full-bit width
+		1: Half-bit width
 
 Example:
 	hsusb_phy: phy@7411000 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
