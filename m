From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 2/3] dt/bindings: qoriq-clock: Add binding for the platform PLL
Date: Thu, 6 Nov 2014 09:48:12 -0600
Message-ID: <1415288893-4457-2-git-send-email-Emilian.Medve@Freescale.com>
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
Change-Id: I7950afa9650d15ec7ce2cca89bb2a1e38586d4a5
---

v2: Whitespace fixes

 Documentation/devicetree/bindings/clock/qoriq-clock.txt | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
index 5666812..266ff9d 100644
--- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
+++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
@@ -62,6 +62,8 @@ Required properties:
 		It takes parent's clock-frequency as its clock.
 	* "fsl,qoriq-sysclk-2.0": for input system clock (v2.0).
 		It takes parent's clock-frequency as its clock.
+	* "fsl,qoriq-platform-pll-1.0" for the platform PLL clock (v1.0)
+	* "fsl,qoriq-platform-pll-2.0" for the platform PLL clock (v2.0)
 - #clock-cells: From common clock binding. The number of cells in a
 	clock-specifier. Should be <0> for "fsl,qoriq-sysclk-[1,2].0"
 	clocks, or <1> for "fsl,qoriq-core-pll-[1,2].0" clocks.
@@ -128,8 +130,16 @@ Example for clock block and clock provider:
 			clock-names = "pll0", "pll0-div2", "pll1", "pll1-div2";
 			clock-output-names = "cmux1";
 		};
+
+		platform-pll: platform-pll@c00 {
+			#clock-cells = <1>;
+			reg = <0xc00 0x4>;
+			compatible = "fsl,qoriq-platform-pll-1.0";
+			clocks = <&sysclk>;
+			clock-output-names = "platform-pll", "platform-pll-div2";
+		};
 	};
-  }
+};
 
 Example for clock consumer:
 
@@ -139,4 +149,4 @@ Example for clock consumer:
 		clocks = <&mux0>;
 		...
 	};
-  }
+};
-- 
2.1.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
