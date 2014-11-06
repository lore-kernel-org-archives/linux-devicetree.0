From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 3/3] powerpc/dts: Add node(s) for the platform PLL
Date: Thu, 6 Nov 2014 09:48:13 -0600
Message-ID: <1415288893-4457-3-git-send-email-Emilian.Medve@Freescale.com>
References: <1415288893-4457-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415288893-4457-1-git-send-email-Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, yuantian.tang-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Change-Id: If76cd705a01813abe53396c1486bc13c4289ee92
---
 arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi | 7 +++++++
 arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi
index 4871048..4ece1ed 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-clockgen1.dtsi
@@ -75,4 +75,11 @@ global-utilities@e1000 {
 		clock-names = "pll0", "pll0-div2", "pll1", "pll1-div2";
 		clock-output-names = "cmux1";
 	};
+	platform_pll: platform-pll@c00 {
+		#clock-cells = <1>;
+		reg = <0xc00 0x4>;
+		compatible = "fsl,qoriq-platform-pll-1.0";
+		clocks = <&sysclk>;
+		clock-output-names = "platform-pll", "platform-pll-div2";
+	};
 };
diff --git a/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi b/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
index 5d18d2a..48e0b6e 100644
--- a/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
+++ b/arch/powerpc/boot/dts/fsl/qoriq-clockgen2.dtsi
@@ -58,4 +58,11 @@ global-utilities@e1000 {
 		clocks = <&sysclk>;
 		clock-output-names = "pll1", "pll1-div2", "pll1-div4";
 	};
+	platform_pll: platform-pll@c00 {
+		#clock-cells = <1>;
+		reg = <0xc00 0x4>;
+		compatible = "fsl,qoriq-platform-pll-2.0";
+		clocks = <&sysclk>;
+		clock-output-names = "platform-pll", "platform-pll-div2";
+	};
 };
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
