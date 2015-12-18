From: Jon Mason <jonmason@broadcom.com>
Subject: [PATCH 3/3] arm: dts: bcm5301x: Add syscon based reboot in DT
Date: Fri, 18 Dec 2015 16:37:56 -0500
Message-ID: <1450474676-10210-3-git-send-email-jonmason@broadcom.com>
References: <1450474676-10210-1-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450474676-10210-1-git-send-email-jonmason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

Add the ability to reboot via a reset of the processor.  This is
achieved via a write of 0x39 to the CRU Reset Register.  Unfortunately,
this only resets the core and not the other IP blocks.  So if possible,
other methods should be used on the individual boards.

Signed-off-by: Jon Mason <jonmason@broadcom.com>
---
 arch/arm/boot/dts/bcm5301x.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
index 553b2ec..2a482ec 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -246,6 +246,18 @@
 				     "sata2";
 	};
 
+	cru: cru@1800c184 {
+		compatible = "syscon";
+		reg = <0x1800c184 0xc>;
+	};
+
+	reboot@1800c184 {
+		compatible ="syscon-reboot";
+		regmap = <&cru>;
+		offset = <0>;
+		mask = <0x39>;
+	};
+
 	nand: nand@18028000 {
 		compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";
 		reg = <0x18028000 0x600>, <0x1811a408 0x600>, <0x18028f00 0x20>;
-- 
1.9.1
