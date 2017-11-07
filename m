From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 1/2] ARM: dts: NSP: Disable AHCI controller for HR NSP boards
Date: Tue,  7 Nov 2017 14:28:11 -0800
Message-ID: <20171107222812.17267-2-f.fainelli@gmail.com>
References: <20171107222812.17267-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171107222812.17267-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jon.mason@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

The AHCI controller is currently enabled for all of these boards:
bcm958623hr and bcm958625hr would result in a hard hang on boot that we
cannot get rid of. Since this does not appear to have an easy and simple
fix, just disable the AHCI controller for now until this gets resolved.

Fixes: 70725d6e97ac ("ARM: dts: NSP: Enable SATA on bcm958625hr")
Fixes: d454c3762437 ("ARM: dts: NSP: Add new DT file for bcm958623hr")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/boot/dts/bcm958623hr.dts | 4 ----
 arch/arm/boot/dts/bcm958625hr.dts | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/bcm958623hr.dts b/arch/arm/boot/dts/bcm958623hr.dts
index 3bc50849d013..b8bde13de90a 100644
--- a/arch/arm/boot/dts/bcm958623hr.dts
+++ b/arch/arm/boot/dts/bcm958623hr.dts
@@ -141,10 +141,6 @@
 	status = "okay";
 };
 
-&sata {
-	status = "okay";
-};
-
 &qspi {
 	bspi-sel = <0>;
 	flash: m25p80@0 {
diff --git a/arch/arm/boot/dts/bcm958625hr.dts b/arch/arm/boot/dts/bcm958625hr.dts
index d94d14b3c745..6a44b8021702 100644
--- a/arch/arm/boot/dts/bcm958625hr.dts
+++ b/arch/arm/boot/dts/bcm958625hr.dts
@@ -177,10 +177,6 @@
 	status = "okay";
 };
 
-&sata {
-	status = "okay";
-};
-
 &srab {
 	compatible = "brcm,bcm58625-srab", "brcm,nsp-srab";
 	status = "okay";
-- 
2.9.3
