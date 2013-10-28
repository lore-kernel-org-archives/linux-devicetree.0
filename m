From: Josh Cartwright <joshc@codeaurora.org>
Subject: [PATCH v3 09/10] mfd: pm8x41: document device tree bindings
Date: Mon, 28 Oct 2013 13:12:35 -0500
Message-ID: <88997d3863f72f8553fcaf66cf67fbf3289df04f.1382985169.git.joshc@codeaurora.org>
References: <cover.1382985169.git.joshc@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1382985169.git.joshc@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Sagar Dharia <sdharia@codeaurora.org>, Gilad Avidov <gavidov@codeaurora.org>, Michael Bohan <mbohan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Document the bindings used to describe the Qualcomm 8x41 PMICs.

Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
---
 Documentation/devicetree/bindings/mfd/pm8x41.txt | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/pm8x41.txt

diff --git a/Documentation/devicetree/bindings/mfd/pm8x41.txt b/Documentation/devicetree/bindings/mfd/pm8x41.txt
new file mode 100644
index 0000000..6afd4ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/pm8x41.txt
@@ -0,0 +1,33 @@
+Qualcomm PM8841 and PM8941 PMIC multi-function devices
+
+The PM8x41 PMICs are used with the Qualcomm Snapdragon 800 series SoCs, and are
+interfaced to the chip via the SPMI (System Power Management Interface) bus.
+Support for  multiple independent functions are implemented by splitting the
+16-bit SPMI slave address space into 256 smaller fixed-size regions, 256 bytes
+each.  A function can consume one or more of these fixed-size register regions.
+
+Required properties:
+- compatible: Must be one of:
+     "qcom,pm8841"
+     "qcom,pm8941"
+- reg: Specifies the SPMI USID slave address for this device
+- #address-cells = <1>
+- #size-cells = <0>
+
+Each child node represents a function of the PM8x41.  Each child 'reg' entry
+describes an offset within the USID slave address where the region starts.
+
+Example:
+
+pm8941@0 {
+	compatible = "qcom,pm8941";
+	reg = <0x0>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	rtc {
+		compatible = "qcom,pm8941-rtc";
+		reg = <0x6000 0x6100>;
+	};
+}
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
