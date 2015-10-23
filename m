From: Anup Patel <anup.patel@broadcom.com>
Subject: [PATCH v3 2/2] arm64: dts: Add BRCM IPROC NAND DT node for NS2
Date: Fri, 23 Oct 2015 10:46:13 +0530
Message-ID: <1445577373-21252-3-git-send-email-anup.patel@broadcom.com>
References: <1445577373-21252-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445577373-21252-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Linux MTD <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Pramod KUMAR <pramodku@broadcom.com>, Vikram Prakash <vikramp@broadcom.com>, Sandeep Tripathy <tripathy@broadcom.com>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Device Tree <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Anup Patel <anup.patel@broadcom.com>
List-Id: devicetree@vger.kernel.org

The NAND controller on NS2 SoC is compatible with existing
BRCM IPROC NAND driver so let's enable it in NS2 DT and
NS2 SVK DT.

This patch also fixes use of node labels in ns2-svk.dts.

Signed-off-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Ray Jui <rjui@broadcom.com>
Reviewed-by: Scott Branden <sbranden@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 30 ++++++++++++++++++++----------
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 14 ++++++++++++++
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
index e5950d5..6bb3d4d 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
@@ -50,18 +50,28 @@
 		device_type = "memory";
 		reg = <0x000000000 0x80000000 0x00000000 0x40000000>;
 	};
+};
 
-	soc: soc {
-		i2c0: i2c@66080000 {
-			status = "ok";
-		};
+&i2c0 {
+	status = "ok";
+};
 
-		i2c1: i2c@660b0000 {
-			status = "ok";
-		};
+&i2c1 {
+	status = "ok";
+};
+
+&uart3 {
+	status = "ok";
+};
 
-		uart3: serial@66130000 {
-			status = "ok";
-		};
+&nand {
+	nandcs@0 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-ecc-mode = "hw";
+		nand-ecc-strength = <8>;
+		nand-ecc-step-size = <512>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 	};
 };
diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index f603277..9610822 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -212,5 +212,19 @@
 			compatible = "brcm,iproc-rng200";
 			reg = <0x66220000 0x28>;
 		};
+
+		nand: nand@66460000 {
+			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
+			reg = <0x66460000 0x600>,
+			      <0x67015408 0x600>,
+			      <0x66460f00 0x20>;
+			reg-names = "nand", "iproc-idm", "iproc-ext";
+			interrupts = <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			brcm,nand-has-wp;
+		};
 	};
 };
-- 
1.9.1
