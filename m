From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 10/16] arm: dts: add mmc nodes to the mt7623.dtsi file
Date: Mon, 23 Jan 2017 12:29:29 +0100
Message-ID: <1485170975-51813-11-git-send-email-john@phrozen.org>
References: <1485170975-51813-1-git-send-email-john@phrozen.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485170975-51813-1-git-send-email-john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add e/MMC nodes to the mt7623.dtsi file.

Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
---
 arch/arm/boot/dts/mt7623.dtsi |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 240f382..791f3b1 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -318,6 +318,28 @@
 		status = "disabled";
 	};
 
+	mmc0: mmc@11230000 {
+		compatible = "mediatek,mt7623-mmc",
+			     "mediatek,mt8135-mmc";
+		reg = <0 0x11230000 0 0x1000>;
+		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_MSDC30_0>,
+			 <&topckgen CLK_TOP_MSDC30_0_SEL>;
+		clock-names = "source", "hclk";
+		status = "disabled";
+	};
+
+	mmc1: mmc@11240000 {
+		compatible = "mediatek,mt7623-mmc",
+			     "mediatek,mt8135-mmc";
+		reg = <0 0x11240000 0 0x1000>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_MSDC30_1>,
+			 <&topckgen CLK_TOP_MSDC30_1_SEL>;
+		clock-names = "source", "hclk";
+		status = "disabled";
+	};
+
 	hifsys: syscon@1a000000 {
 		compatible = "mediatek,mt7623-hifsys",
 			     "mediatek,mt2701-hifsys",
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
