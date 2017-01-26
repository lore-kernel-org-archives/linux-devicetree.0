From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 2/2] arm64: dts: h3ulcb: enable HS200 for eMMC
Date: Thu, 26 Jan 2017 18:14:00 +0300
Message-ID: <1485443640-22651-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1485443606-22566-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1485443606-22566-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

This supports HS200 mode for eMMC on H3ULCB board

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 7a8986e..51ef8bb 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -329,6 +329,7 @@
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&reg_1p8v>;
 	bus-width = <8>;
+	mmc-hs200-1_8v;
 	non-removable;
 	status = "okay";
 };
-- 
1.9.1
