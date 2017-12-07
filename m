From: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v2 08/10] arm64: dts: qcom: msm8916-pins: move sdhc2 cd node with its siblings
Date: Thu,  7 Dec 2017 10:19:40 -0500
Message-ID: <20171207151942.5805-9-damien.riegel@savoirfairelinux.com>
References: <20171207151942.5805-1-damien.riegel@savoirfairelinux.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171207151942.5805-1-damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Nodes relative to the first sdhc node were interlaced with node of the
second sdhc. Move sdhc2_cd_pin with its siblings to prevent that. Also
rename the grouping node from sdhc2_cd_pin to pmx_sdc2_cd_pin, as
"pmx_sdc" is the prefix used by other nodes.

Signed-off-by: Damien Riegel <damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index c79301f204b7..7704ddecb6c4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -194,21 +194,6 @@
 		};
 	};
 
-	sdhc2_cd_pin {
-		sdc2_cd_on: cd_on {
-			pinmux {
-				function = "gpio";
-				pins = "gpio38";
-			};
-		};
-		sdc2_cd_off: cd_off {
-			pinmux {
-				function = "gpio";
-				pins = "gpio38";
-			};
-		};
-	};
-
 	pmx_sdc1_clk {
 		sdc1_clk_on: clk_on {
 			pinmux {
@@ -287,6 +272,21 @@
 		};
 	};
 
+	pmx_sdc2_cd_pin {
+		sdc2_cd_on: cd_on {
+			pinmux {
+				function = "gpio";
+				pins = "gpio38";
+			};
+		};
+		sdc2_cd_off: cd_off {
+			pinmux {
+				function = "gpio";
+				pins = "gpio38";
+			};
+		};
+	};
+
 	cdc-pdm-lines {
 		cdc_pdm_lines_act: pdm_lines_on {
 			pinmux {
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
