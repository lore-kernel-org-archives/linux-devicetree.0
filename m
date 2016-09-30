From: Po Liu <po.liu-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v6 1/3] arm/dts-ls1021: add pcie aer/pme interrupt-name property in the dts
Date: Fri, 30 Sep 2016 17:11:35 +0800
Message-ID: <1475226697-7709-1-git-send-email-po.liu@nxp.com>
References: <1473741659-17618-3-git-send-email-po.liu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473741659-17618-3-git-send-email-po.liu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Roy Zang <roy.zang-3arQi8VN3Tc@public.gmane.org>, Mingkai Hu <mingkai.hu-3arQi8VN3Tc@public.gmane.org>, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>, Yang-Leo Li <leoyang.li-3arQi8VN3Tc@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Minghuan Lian <minghuan.lian-3arQi8VN3Tc@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Po Liu <po.liu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

NXP arm aer/pme interrupts was not MSI/MSI-X/INTx but using interrupt
line independently. This patch add a "aer" "pme" interrupt-names for
aer/pme interrupts.

With the interrupt-names "aer","pme" code could probe aer/pme interrupt
line for pcie root port, replace the aer/pme interrupt service irqs.

This patch is intend to fixup the Layerscape platforms which aer/pme
interrupt was not MSI/MSI-X/INTx, but using interrupt line independently.

Since the interrupt-names "intr" never been used. Remove it.

Signed-off-by: Po Liu <po.liu-3arQi8VN3Tc@public.gmane.org>
---
changes for v6:
	- add remove "intr" reason;
	- add "pme" interrupt;

 arch/arm/boot/dts/ls1021a.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 368e219..9b3cb3b 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -634,7 +634,9 @@
 			reg = <0x00 0x03400000 0x0 0x00010000   /* controller registers */
 			       0x40 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names = "regs", "config";
-			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>; /* controller interrupt */
+			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+					   <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>; /* aer interrupt */
+			interrupt-names = "pme", "aer";
 			fsl,pcie-scfg = <&scfg 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -657,7 +659,9 @@
 			reg = <0x00 0x03500000 0x0 0x00010000   /* controller registers */
 			       0x48 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names = "regs", "config";
-			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+					   <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>; /* aer interrupt */
+			interrupt-names = "pme", "aer";
 			fsl,pcie-scfg = <&scfg 1>;
 			#address-cells = <3>;
 			#size-cells = <2>;
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
