From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 3/6] arm64: dts: Add ARM SP804 timer DT nodes for NS2
Date: Wed, 10 Feb 2016 11:40:48 +0530
Message-ID: <1455084651-29325-4-git-send-email-anup.patel@broadcom.com>
References: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

We have four ARM SP804 dual-mode timer instances in NS2 SoC
hence this patch adds appropriate DT nodes for NS2.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Pramod KUMAR <pramodku@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index b1f352d..83e1c27 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -256,6 +256,46 @@
 			      <0x65260000 0x1000>;
 		};
 
+		timer0: timer@66030000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x66030000 0x1000>;
+			interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>,
+				 <&iprocslow>,
+				 <&iprocslow>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+		};
+
+		timer1: timer@66040000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x66040000 0x1000>;
+			interrupts = <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>,
+				 <&iprocslow>,
+				 <&iprocslow>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+		};
+
+		timer2: timer@66050000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x66050000 0x1000>;
+			interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>,
+				 <&iprocslow>,
+				 <&iprocslow>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+		};
+
+		timer3: timer@66060000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x66060000 0x1000>;
+			interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&iprocslow>,
+				 <&iprocslow>,
+				 <&iprocslow>;
+			clock-names = "timer1", "timer2", "apb_pclk";
+		};
+
 		i2c0: i2c@66080000 {
 			compatible = "brcm,iproc-i2c";
 			reg = <0x66080000 0x100>;
-- 
1.9.1
