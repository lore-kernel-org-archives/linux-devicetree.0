From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH 2/6] arm64: dts: Add SDHCI DT node for NS2
Date: Wed, 10 Feb 2016 11:40:47 +0530
Message-ID: <1455084651-29325-3-git-send-email-anup.patel@broadcom.com>
References: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455084651-29325-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

The IPROC SDHCI driver works fine for SDIO 3.0 on NS2 so let's enable
it for NS2 SoC in NS2 DT.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Vikram Prakash <vikramp@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2-svk.dts |  4 ++++
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
index 6bb3d4d..3321bd1 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
@@ -64,6 +64,10 @@
 	status = "ok";
 };
 
+&sdio0 {
+	status = "ok";
+};
+
 &nand {
 	nandcs@0 {
 		compatible = "brcm,nandcs";
diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index a510d3a..b1f352d 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -291,6 +291,24 @@
 			reg = <0x66220000 0x28>;
 		};
 
+		sdio0: sdhci@66420000 {
+			compatible = "brcm,sdhci-iproc-cygnus";
+			reg = <0x66420000 0x100>;
+			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>;
+			bus-width = <8>;
+			clocks = <&genpll_sw BCM_NS2_GENPLL_SW_SDIO_CLK>;
+			status = "disabled";
+		};
+
+		sdio1: sdhci@66430000 {
+			compatible = "brcm,sdhci-iproc-cygnus";
+			reg = <0x66430000 0x100>;
+			interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			bus-width = <8>;
+			clocks = <&genpll_sw BCM_NS2_GENPLL_SW_SDIO_CLK>;
+			status = "disabled";
+		};
+
 		nand: nand@66460000 {
 			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
 			reg = <0x66460000 0x600>,
-- 
1.9.1
