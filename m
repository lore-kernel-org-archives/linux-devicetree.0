From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v5 06/11] arm64: dts: Add NAND DT nodes for Stingray SOC
Date: Fri, 26 May 2017 14:54:59 +0530
Message-ID: <1495790704-2438-7-git-send-email-anup.patel@broadcom.com>
References: <1495790704-2438-1-git-send-email-anup.patel@broadcom.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1495790704-2438-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Oza Pawandeep <oza.oza@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Pramod Kumar <pramod.kumar@broadcom.com>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Abhishek Shah <abhishek.shah@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Pramod Kumar <pramod.kumar@broadcom.com>

This patch adds NAND controller DT Node and NAND chip DT
node for Stingray SOC and Stingray reference boards.

Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
Signed-off-by: Abhishek Shah <abhishek.shah@broadcom.com>
Reviewed-by: Vikram Prakash <vikram.prakash@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi       | 13 +++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
index 992944b..aad45a2 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/bcm958742-base.dtsi
@@ -53,3 +53,18 @@
 &uart1 {
 	status = "okay";
 };
+
+&nand {
+	status = "ok";
+	nandcs@0 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-ecc-mode = "hw";
+		nand-ecc-strength = <8>;
+		nand-ecc-step-size = <512>;
+		nand-bus-width = <16>;
+		brcm,nand-oob-sector-size = <16>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index 6b690db..003f814 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -307,5 +307,18 @@
 			compatible = "brcm,iproc-rng200";
 			reg = <0x00220000 0x28>;
 		};
+
+		nand: nand@68c60000 {
+			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
+			reg = <0x00360000 0x600>,
+			      <0x0050a408 0x600>,
+			      <0x00360f00 0x20>;
+			reg-names = "nand", "iproc-idm", "iproc-ext";
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			brcm,nand-has-wp;
+			status = "disabled";
+		};
 	};
 };
-- 
2.7.4

