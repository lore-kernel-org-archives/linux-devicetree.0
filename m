From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 4/5] ARM: dts: apq8064: add pcie devicetree node
Date: Thu,  3 Dec 2015 15:35:23 +0200
Message-ID: <1449149725-27607-5-git-send-email-stanimir.varbanov@linaro.org>
References: <1449149725-27607-1-git-send-email-stanimir.varbanov@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449149725-27607-1-git-send-email-stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the pcie dt node so that it can probe and used.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi |   36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index a4c1762b53ea..847150fbfdbf 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -659,5 +659,41 @@
 			compatible = "qcom,tcsr-apq8064", "syscon";
 			reg = <0x1a400000 0x100>;
 		};
+
+		pcie: pci@1b500000 {
+			compatible = "qcom,pcie-apq8064", "snps,dw-pcie";
+			reg = <0x1b500000 0x1000
+			       0x1b502000 0x80
+			       0x1b600000 0x100
+			       0x0ff00000 0x100000>;
+			reg-names = "dbi", "elbi", "parf", "config";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x81000000 0 0 0x0fe00000 0 0x00100000   /* I/O */
+				  0x82000000 0 0 0x08000000 0 0x07e00000>; /* memory */
+			interrupts = <GIC_SPI 238 IRQ_TYPE_NONE>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 36 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc 0 37 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc 0 38 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc 0 39 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			clocks = <&gcc PCIE_A_CLK>,
+				 <&gcc PCIE_H_CLK>,
+				 <&gcc PCIE_PHY_REF_CLK>;
+			clock-names = "core", "iface", "phy";
+			resets = <&gcc PCIE_ACLK_RESET>,
+				 <&gcc PCIE_HCLK_RESET>,
+				 <&gcc PCIE_POR_RESET>,
+				 <&gcc PCIE_PCI_RESET>,
+				 <&gcc PCIE_PHY_RESET>;
+			reset-names = "axi", "ahb", "por", "pci", "phy";
+			status = "disabled";
+		};
 	};
 };
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
