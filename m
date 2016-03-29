From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 1/4] arm64: dts: Add ARM PL330 DMA DT node for NS2
Date: Tue, 29 Mar 2016 12:57:31 +0530
Message-ID: <1459236454-26285-2-git-send-email-anup.patel@broadcom.com>
References: <1459236454-26285-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459236454-26285-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jon.mason@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

We have one ARM PL330 DMA instance with 8 channels in
NS2 SoC. Let's enable it for NS2 in NS2 DT.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Pramod KUMAR <pramodku@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index 6f81c9d..a9f4585 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -217,6 +217,25 @@
 		#size-cells = <1>;
 		ranges = <0 0 0 0xffffffff>;
 
+		dma0: dma@61360000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x61360000 0x1000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
+			clocks = <&iprocslow>;
+			clock-names = "apb_pclk";
+		};
+
 		smmu: mmu@64000000 {
 			compatible = "arm,mmu-500";
 			reg = <0x64000000 0x40000>;
-- 
1.9.1
