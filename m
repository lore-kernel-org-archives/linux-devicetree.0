From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 06/16] arm: dts: add pmic nodes to the mt7623 dtsi file
Date: Mon, 23 Jan 2017 12:29:25 +0100
Message-ID: <1485170975-51813-7-git-send-email-john@phrozen.org>
References: <1485170975-51813-1-git-send-email-john@phrozen.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485170975-51813-1-git-send-email-john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add PMIC node to the mt7623.dtsi file.

Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
---
 arch/arm/boot/dts/mt7623.dtsi |   13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index c64117b..6099f05 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -155,6 +155,19 @@
 		clock-names = "system-clk", "rtc-clk";
 	};
 
+	pwrap: pwrap@1000d000 {
+		compatible = "mediatek,mt7623-pwrap",
+			     "mediatek,mt2701-pwrap";
+		reg = <0 0x1000d000 0 0x1000>;
+		reg-names = "pwrap";
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+		resets = <&infracfg MT2701_INFRA_PMIC_WRAP_RST>;
+		reset-names = "pwrap";
+		clocks = <&infracfg CLK_INFRA_PMICSPI>,
+			 <&infracfg CLK_INFRA_PMICWRAP>;
+		clock-names = "spi", "wrap";
+	};
+
 	sysirq: interrupt-controller@10200100 {
 		compatible = "mediatek,mt7623-sysirq",
 			     "mediatek,mt6577-sysirq";
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
