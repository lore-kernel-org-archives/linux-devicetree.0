From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v8 16/18] ARM: DT: STi: stihxxx-b2120: Add DT nodes for STi audio card
Date: Fri, 26 Aug 2016 15:56:51 +0100
Message-ID: <1472223413-7254-17-git-send-email-peter.griffin@linaro.org>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472223413-7254-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch enables the uniperif players 2 & 3 for b2120 boards
and also adds the "simple-audio-card" device node to interconnect
the SoC sound device and the codec.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stihxxx-b2120.dtsi | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index 722c63f..1f64bb6 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -131,5 +131,50 @@
 				dvb-card	= <STV0367_TDA18212_NIMA_1>;
 			};
 		};
+
+		sti_uni_player2: sti-uni-player@2 {
+			status = "okay";
+		};
+
+		sti_uni_player3: sti-uni-player@3 {
+			status = "okay";
+		};
+
+		sti_sasg_codec: sti-sasg-codec {
+			status = "okay";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_spdif_out>;
+		};
+
+		sound {
+			compatible = "simple-audio-card";
+			simple-audio-card,name = "sti audio card";
+			status = "okay";
+
+			simple-audio-card,dai-link@0 {
+				/* DAC */
+				format = "i2s";
+				mclk-fs = <256>;
+				cpu {
+					sound-dai = <&sti_uni_player2>;
+				};
+
+				codec {
+					sound-dai = <&sti_sasg_codec 1>;
+				};
+			};
+			simple-audio-card,dai-link@1 {
+				/* SPDIF */
+				format = "left_j";
+				mclk-fs = <128>;
+				cpu {
+					sound-dai = <&sti_uni_player3>;
+				};
+
+				codec {
+					sound-dai = <&sti_sasg_codec 0>;
+				};
+			};
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
