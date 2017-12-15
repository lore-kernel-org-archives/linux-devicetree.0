From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 5/5] ARM: dts: iwg20d-q7-common: Sound DMA support via DVC on DTS
Date: Fri, 15 Dec 2017 14:50:53 +0000
Message-ID: <1513349453-54689-6-git-send-email-biju.das@bp.renesas.com>
References: <1513349453-54689-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513349453-54689-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

DMA transfer uses DVC

     DMA               DMApp
[MEM] -> [SRC] -> [DVC] -> [SSIU] -> [SSI]

     DMA               DMApp
[MEM] <- [DVC] <- [SRC] <- [SSIU] <- [SSI]

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 9f6ec25..ccbdf5a 100644
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
@@ -240,8 +263,8 @@
 
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
