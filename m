From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/5] DT: phy: qcom: Add PCIe PHY devicetree bindings
Date: Mon,  4 May 2015 15:42:14 +0300
Message-ID: <1430743338-10441-2-git-send-email-svarbanov@mm-sol.com>
References: <1430743338-10441-1-git-send-email-svarbanov@mm-sol.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430743338-10441-1-git-send-email-svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document Qualcomm PCIe PHY devicetree bindings.

Signed-off-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/phy/qcom-pcie-phy.txt      |   60 ++++++++++++++++++++
 1 files changed, 60 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom-pcie-phy.txt b/Documentation/devicetree/bindings/phy/qcom-pcie-phy.txt
new file mode 100644
index 0000000..e4c7f9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-pcie-phy.txt
@@ -0,0 +1,60 @@
+* Qualcomm PCIe PHY controller
+
+PCIe PHY nodes are defined to describe on-chip PCIe Physical layer controllers.
+Each PCIe PHY controller should have its own node.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: Value should contain "qcom,pcie-phy"
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: Offset and length of the PCIe PHY registers
+
+- #phy-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: Must be zero
+
+- clocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: A list of phandles and clock specifier pair, one
+		    for each entry in clock-names property
+
+- clock-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: Should contain "core" for PHY core clock
+
+- resets:
+	Usage: required
+	Value type: <phandle>
+	Definition: List of phandle and reset specifier pairs as listed
+		    in reset-names property
+
+- reset-names:
+	Usage: required
+	Value type: <stringlist>
+	Definition: Should contain "core" for PHY core reset
+
+- <name>-supply:
+	Usage: required
+	Value type: <phandle>
+	Definition: List of phandles to the power supply regulators
+		    - "vdda_pll" analog Vdd PLL power supply
+
+* Example
+
+	pciephy0: phy@fc526000 {
+		compatible = "qcom,pcie-phy";
+		reg = <0xfc526000 0x1000>;
+		clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
+		clock-names = "core";
+		resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+		reset-names = "core";
+		vdda_pll-supply = <&pma8084_l12>;
+		#phy-cells = <0>;
+	};
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
