From: Abhishek Shah <abhishek.shah-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 3/7] arm64: dts: Add sp804 DT nodes for Stingray SoC
Date: Sat, 29 Jul 2017 10:12:25 +0530
Message-ID: <1501303349-30007-4-git-send-email-abhishek.shah@broadcom.com>
References: <1501303349-30007-1-git-send-email-abhishek.shah@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501303349-30007-1-git-send-email-abhishek.shah-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

We have 8 instances of sp804 in Stingray SoC. Let's enable
it in Stingray DT.

Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 697401d..19ad887 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -314,6 +314,93 @@
 			status = "disabled";
 		};
 
+		timer0: timer@00030000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x00030000 0x1000>;
+			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_25m_div2_clk>,
+				 <&hsls_25m_div2_clk>,
+				 <&hsls_div4_clk>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+			status = "disabled";
+		};
+
+		timer1: timer@00040000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x00040000 0x1000>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_25m_div2_clk>,
+				 <&hsls_25m_div2_clk>,
+				 <&hsls_div4_clk>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+		};
+
+		timer2: timer@00050000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x00050000 0x1000>;
+			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_25m_div2_clk>,
+				 <&hsls_25m_div2_clk>,
+				 <&hsls_div4_clk>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+			status = "disabled";
+		};
+
+		timer3: timer@00060000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x00060000 0x1000>;
+			interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_25m_div2_clk>,
+				 <&hsls_25m_div2_clk>,
+				 <&hsls_div4_clk>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+			status = "disabled";
+		};
+
+		timer4: timer@00070000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x00070000 0x1000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_25m_div2_clk>,
+				 <&hsls_25m_div2_clk>,
+				 <&hsls_div4_clk>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+			status = "disabled";
+		};
+
+		timer5: timer@00080000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x00080000 0x1000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_25m_div2_clk>,
+				 <&hsls_25m_div2_clk>,
+				 <&hsls_div4_clk>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+			status = "disabled";
+		};
+
+		timer6: timer@00090000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x00090000 0x1000>;
+			interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_25m_div2_clk>,
+				 <&hsls_25m_div2_clk>,
+				 <&hsls_div4_clk>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+			status = "disabled";
+		};
+
+		timer7: timer@000a0000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x000a0000 0x1000>;
+			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&hsls_25m_div2_clk>,
+				 <&hsls_25m_div2_clk>,
+				 <&hsls_div4_clk>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+			status = "disabled";
+		};
+
 		i2c0: i2c@000b0000 {
 			compatible = "brcm,iproc-i2c";
 			reg = <0x000b0000 0x100>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
