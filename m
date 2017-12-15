From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 4/5] ARM: dts: iwg20d-q7-common: Sound DMA support via SRC on DTS
Date: Fri, 15 Dec 2017 14:50:52 +0000
Message-ID: <1513349453-54689-5-git-send-email-biju.das@bp.renesas.com>
References: <1513349453-54689-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513349453-54689-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

DMA transfer to/from SRC

     DMA      DMApp
[MEM] -> [SRC] -> [SSIU] -> [SSI]

     DMA      DMApp
[MEM] <- [SRC] <- [SSIU] <- [SSI]

Current sound driver is supporting SSI/SRC random connection.
So, this patch is trying
SSI1 -> SRC3
SSI0 <- SRC2

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index 38f1e2b..9f6ec25 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -240,8 +240,8 @@
 
 	rcar_sound,dai {
 		dai0 {
-			playback = <&ssi1>;
-			capture = <&ssi0>;
+			playback = <&ssi1 &src3>;
+			capture = <&ssi0 &src2>;
 		};
 	};
 };
-- 
1.9.1
