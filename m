From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 10/11] ARM: dts: cygnus: Enable NAND support for Cygnus
Date: Tue, 12 May 2015 17:53:43 -0700
Message-ID: <1431478424-29230-11-git-send-email-computersforpeace@gmail.com>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431478424-29230-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>

Enable NAND support for Broadcom Cygnus SoC

Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
v4: account for reworked DT binding

 arch/arm/boot/dts/bcm-cygnus.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/bcm958300k.dts  | 16 ++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 7b52c33ea69a..e1ac07a16f92 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -212,6 +212,18 @@
 		status = "disabled";
 	};
 
+	nand: nand@18046000 {
+		compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";
+		reg = <0x18046000 0x600>, <0xf8105408 0x600>, <0x18046f00 0x20>;
+		reg-names = "nand", "iproc-idm", "iproc-ext";
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		brcm,nand-has-wp;
+	};
+
 	gic: interrupt-controller@19021000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
diff --git a/arch/arm/boot/dts/bcm958300k.dts b/arch/arm/boot/dts/bcm958300k.dts
index c9eb8565eac5..2f63052f9d48 100644
--- a/arch/arm/boot/dts/bcm958300k.dts
+++ b/arch/arm/boot/dts/bcm958300k.dts
@@ -58,4 +58,20 @@
 	uart3: serial@18023000 {
 		status = "okay";
 	};
+
+	nand: nand@18046000 {
+		nandcs@1 {
+			compatible = "brcm,nandcs";
+			reg = <0>;
+			nand-on-flash-bbt;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			nand-ecc-strength = <24>;
+			nand-ecc-step-size = <1024>;
+
+			brcm,nand-oob-sector-size = <27>;
+		};
+	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
