From: <jiada_wang@mentor.com>
Subject: [PATCH linux-next v1 4/4] arm64: salvator-common: Add avb counter clock
Date: Thu, 25 Oct 2018 16:23:49 +0900
Message-ID: <20181025072349.15173-5-jiada_wang@mentor.com>
References: <20181025072349.15173-1-jiada_wang@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025072349.15173-1-jiada_wang@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, jiada_wang@mentor.com
List-Id: devicetree@vger.kernel.org

From: Jiada Wang <jiada_wang@mentor.com>

Add avb counter clock node to R-Car Salvator boards

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 7f91ff524109..09a228d04b9e 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -63,6 +63,12 @@
 		enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;
 	};
 
+	clk_avb: avb-clock@ec5a011c {
+		compatible = "renesas,clk-avb";
+		reg = <0 0xec5a011c 0 0x24>;
+		#clock-cells = <1>;
+	};
+
 	cvbs-in {
 		compatible = "composite-video-connector";
 		label = "CVBS IN";
-- 
2.17.0
