From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 5/5] arm64: dts: mt8173: Add subsystem clock controller device nodes
Date: Fri, 10 Jul 2015 18:00:05 +0800
Message-ID: <1436522405-13923-6-git-send-email-jamesjj.liao@mediatek.com>
References: <1436522405-13923-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436522405-13923-1-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds device nodes providing subsystem clocks on MT8173,
includes mmsys, imgsys, vdecsys, vencsys and vencltsys.

Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index a2f63e4..9d74ce5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -227,6 +227,36 @@
 			clocks = <&uart_clk>;
 			status = "disabled";
 		};
+
+		mmsys: mmsys@14000000 {
+			compatible = "mediatek,mt8173-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys: imgsys@15000000 {
+			compatible = "mediatek,mt8173-imgsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys: vdecsys@16000000 {
+			compatible = "mediatek,mt8173-vdecsys", "syscon";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: vencsys@18000000 {
+			compatible = "mediatek,mt8173-vencsys", "syscon";
+			reg = <0 0x18000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencltsys: vencltsys@19000000 {
+			compatible = "mediatek,mt8173-vencltsys", "syscon";
+			reg = <0 0x19000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 };
 
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
