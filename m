From: Xiaowei Song <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v8 1/4] PCI: hisi: Add DT binding for PCIe of Kirin SoC series
Date: Fri, 26 May 2017 09:53:30 +0800
Message-ID: <20170526015333.92482-2-songxiaowei@hisilicon.com>
References: <20170526015333.92482-1-songxiaowei@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170526015333.92482-1-songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, keith.busch-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, niklas.cassel-VrBV9hrLPhE@public.gmane.org, dhdang-qTEPVZfXA3Y@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: chenyao11-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Xiaowei Song <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 .../devicetree/bindings/pci/kirin-pcie.txt         | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/kirin-pcie.txt

diff --git a/Documentation/devicetree/bindings/pci/kirin-pcie.txt b/Documentation/devicetree/bindings/pci/kirin-pcie.txt
new file mode 100644
index 000000000000..2dd0e7a368ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/kirin-pcie.txt
@@ -0,0 +1,49 @@
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
+        pcie@f4000000 {
+                        compatible = "hisilicon,kirin-pcie";
+                        reg =  <0x0 0xf4000000 0x0 0x1000>, <0x0 0xff3fe000 0x0 0x1000>,
+                                 <0x0 0xf3f20000 0x0 0x40000>, <0x0 0xF4000000 0 0x2000>;
+                        reg-names = "dbi","apb","phy", "config";
+                        bus-range = <0x0  0x1>;
+                        #address-cells = <3>;
+                        #size-cells = <2>;
+                        device_type = "pci";
+                        ranges = <0x02000000 0x0 0x00000000 0x0 0xf5000000 0x0 0x2000000>;
+                        num-lanes = <1>;
+                        #interrupt-cells = <1>;
+                        interrupt-map-mask = <0xf800 0 0 7>;
+			interrupt-map = <0x0 0 0 2 &gic 0 0 0  283 4>,
+                                        <0x0 0 0 3 &gic 0 0 0  284 4>,
+                                        <0x0 0 0 4 &gic 0 0 0  285 4>;
+                        clocks = <&crg_ctrl HI3660_PCIEPHY_REF>,
+                                <&crg_ctrl HI3660_CLK_GATE_PCIEAUX>,
+                                <&crg_ctrl HI3660_PCLK_GATE_PCIE_PHY>,
+                                <&crg_ctrl HI3660_PCLK_GATE_PCIE_SYS>,
+                                <&crg_ctrl HI3660_ACLK_GATE_PCIE>;
+                        clock-names = "pcie_phy_ref", "pcie_aux",
+                                "pcie_apb_phy", "pcie_apb_sys", "pcie_aclk";
+                        reset-gpios = <&gpio11 1 0 >;
+        };
-- 
2.11.GIT

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
