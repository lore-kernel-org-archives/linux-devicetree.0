From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5 18/18] ARM: DT: STi: stihxxx-b2120: Add DT nodes for STi audio card
Date: Tue,  7 Jun 2016 17:19:12 +0100
Message-ID: <1465316352-20691-19-git-send-email-peter.griffin@linaro.org>
References: <1465316352-20691-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465316352-20691-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
