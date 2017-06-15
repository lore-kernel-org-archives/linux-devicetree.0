From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 14/20] dt-bindings: PCI: hisi: Add document for PCIe of Kirin SoCs
Date: Thu, 15 Jun 2017 11:04:11 +0800
Message-ID: <20170615030417.14059-15-guodong.xu@linaro.org>
References: <20170615030417.14059-1-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615030417.14059-1-guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Xiaowei Song <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Xiaowei Song <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

This patch adds document for PCIe of Kirin SoC series.

Signed-off-by: Xiaowei Song <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/pci/kirin-pcie.txt         | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/kirin-pcie.txt

diff --git a/Documentation/devicetree/bindings/pci/kirin-pcie.txt b/Documentation/devicetree/bindings/pci/kirin-pcie.txt
new file mode 100644
index 0000000..68ffa0f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/kirin-pcie.txt
@@ -0,0 +1,50 @@
+HiSilicon Kirin SoCs PCIe host DT description
+
+Kirin PCIe host controller is based on Designware PCI core.
+It shares common functions with PCIe Designware core driver
+and inherits common properties defined in
+Documentation/devicetree/bindings/pci/designware-pci.txt.
+
+Additional properties are described here:
+
+Required properties
+- compatible:
+	"hisilicon,kirin960-pcie" for PCIe of Kirin960 SoC
+- reg: Should contain rc_dbi, apb, phy, config registers location and length.
+- reg-names: Must include the following entries:
+  "dbi": controller configuration registers;
+  "apb": apb Ctrl register defined by Kirin;
+  "phy": apb PHY register defined by Kirin;
+  "config": PCIe configuration space registers.
+- reset-gpios: The gpio to generate PCIe perst assert and deassert signal.
+
+Optional properties:
+
+Example based on kirin960:
+
+	pcie@f4000000 {
+		compatible = "hisilicon,kirin-pcie";
+		reg = <0x0 0xf4000000 0x0 0x1000>, <0x0 0xff3fe000 0x0 0x1000>,
+		      <0x0 0xf3f20000 0x0 0x40000>, <0x0 0xF4000000 0 0x2000>;
+		reg-names = "dbi","apb","phy", "config";
+		bus-range = <0x0  0x1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		device_type = "pci";
+		ranges = <0x02000000 0x0 0x00000000 0x0 0xf5000000 0x0 0x2000000>;
+		num-lanes = <1>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0xf800 0 0 7>;
+		interrupt-map = <0x0 0 0 1 &gic 0 0 0  282 4>,
+				<0x0 0 0 2 &gic 0 0 0  283 4>,
+				<0x0 0 0 3 &gic 0 0 0  284 4>,
+				<0x0 0 0 4 &gic 0 0 0  285 4>;
+		clocks = <&crg_ctrl HI3660_PCIEPHY_REF>,
+			 <&crg_ctrl HI3660_CLK_GATE_PCIEAUX>,
+			 <&crg_ctrl HI3660_PCLK_GATE_PCIE_PHY>,
+			 <&crg_ctrl HI3660_PCLK_GATE_PCIE_SYS>,
+			 <&crg_ctrl HI3660_ACLK_GATE_PCIE>;
+		clock-names = "pcie_phy_ref", "pcie_aux",
+			      "pcie_apb_phy", "pcie_apb_sys", "pcie_aclk";
+		reset-gpios = <&gpio11 1 0 >;
+	};
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
