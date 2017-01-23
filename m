From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: [PATCH 02/16] arm: dts: add subsystem clock controller device nodes
Date: Mon, 23 Jan 2017 12:29:21 +0100
Message-ID: <1485170975-51813-3-git-send-email-john@phrozen.org>
References: <1485170975-51813-1-git-send-email-john@phrozen.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1485170975-51813-1-git-send-email-john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add MT7623 subsystem clock controllers for hifsys amd ethsys.

Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
---
 arch/arm/boot/dts/mt7623.dtsi |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index 592fc0a..87a55f5 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -186,4 +186,20 @@
 		clock-names = "baud", "bus";
 		status = "disabled";
 	};
+
+	hifsys: syscon@1a000000 {
+		compatible = "mediatek,mt7623-hifsys",
+			     "mediatek,mt2701-hifsys",
+			     "syscon";
+		reg = <0 0x1a000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+	ethsys: syscon@1b000000 {
+		compatible = "mediatek,mt7623-ethsys",
+			     "mediatek,mt2701-ethsys",
+			     "syscon";
+		reg = <0 0x1b000000 0 0x1000>;
+		#clock-cells = <1>;
+	};
 };
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
