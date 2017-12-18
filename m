From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH v2 5/5] ARM: dts: iwg20d-q7-common: Sound DMA support via DVC on DTS
Date: Mon, 18 Dec 2017 18:22:41 +0000
Message-ID: <1513621361-10944-6-git-send-email-biju.das@bp.renesas.com>
References: <1513621361-10944-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1513621361-10944-1-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DMA transfer uses DVC

     DMA               DMApp
[MEM] -> [SRC] -> [DVC] -> [SSIU] -> [SSI]

     DMA               DMApp
[MEM] <- [DVC] <- [SRC] <- [SSIU] <- [SSI]

Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Reviewed-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
v1->v2
 * No change

 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 7b283e0..5c604c74 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -8,6 +8,29 @@
  * kind, whether express or implied.
  */
 
+/*
+ * SSI-SGTL5000
+ *
+ * This command is required when Playback/Capture
+ *
+ *      amixer set "DVC Out" 100%
+ *      amixer set "DVC In" 100%
+ *
+ * You can use Mute
+ *
+ *      amixer set "DVC Out Mute" on
+ *      amixer set "DVC In Mute" on
+ *
+ * You can use Volume Ramp
+ *
+ *      amixer set "DVC Out Ramp Up Rate"   "0.125 dB/64 steps"
+ *      amixer set "DVC Out Ramp Down Rate" "0.125 dB/512 steps"
+ *      amixer set "DVC Out Ramp" on
+ *      aplay xxx.wav &
+ *      amixer set "DVC Out"  80%  // Volume Down
+ *      amixer set "DVC Out" 100%  // Volume Up
+ */
+
 / {
 	aliases {
 		serial0 = &scif0;
@@ -208,8 +231,8 @@
 
 	rcar_sound,dai {
 		dai0 {
-			playback = <&ssi1 &src3>;
-			capture = <&ssi0 &src2>;
+			playback = <&ssi1 &src3 &dvc1>;
+			capture = <&ssi0 &src2 &dvc0>;
 		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
