From: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 4/5] ARM: DT: STiHxxx-b2120: Add support of HDMI audio
Date: Tue, 4 Oct 2016 18:11:56 +0200
Message-ID: <1475597517-14225-5-git-send-email-arnaud.pouliquen@st.com>
References: <1475597517-14225-1-git-send-email-arnaud.pouliquen@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475597517-14225-1-git-send-email-arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Moise Gergaud <moise.gergaud-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add new dai link in sound card to support HDMI output
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stihxxx-b2120.dtsi | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index ed2b7a9..313c1f8 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -135,6 +135,10 @@
 			};
 		};
 
+		sti_uni_player0: sti-uni-player@8d80000 {
+			status = "okay";
+		};
+
 		sti_uni_player2: sti-uni-player@8d82000 {
 			status = "okay";
 		};
@@ -155,9 +159,22 @@
 			status = "okay";
 
 			simple-audio-card,dai-link@0 {
+				/* HDMI */
+				format = "i2s";
+				mclk-fs = <128>;
+				cpu {
+					sound-dai = <&sti_uni_player0>;
+				};
+
+				codec {
+					sound-dai = <&sti_hdmi>;
+				};
+			};
+			simple-audio-card,dai-link@1 {
 				/* DAC */
 				format = "i2s";
 				mclk-fs = <256>;
+				frame-inversion = <1>;
 				cpu {
 					sound-dai = <&sti_uni_player2>;
 				};
@@ -166,7 +183,7 @@
 					sound-dai = <&sti_sasg_codec 1>;
 				};
 			};
-			simple-audio-card,dai-link@1 {
+			simple-audio-card,dai-link@2 {
 				/* SPDIF */
 				format = "left_j";
 				mclk-fs = <128>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
