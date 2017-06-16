From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] ARM: dts: iwg20d-q7: Add pinctl support for scif0
Date: Fri, 16 Jun 2017 15:57:29 +0100
Message-ID: <1497625049-46802-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Adding pinctrl support for scif0 interface.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is been tested against linux-next tag next-20170616.
It depends upon the patch "[PATCH v2 1/3] ARM: dts: r8a7743: add PFC support"
https://www.spinics.net/lists/arm-kernel/msg577301.html

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
index 9b54783..497aec0 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
@@ -20,6 +20,16 @@
 	};
 };
 
+&pfc {
+	scif0_pins: scif0 {
+		groups = "scif0_data_d";
+		function = "scif0";
+	};
+};
+
 &scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };
-- 
1.9.1
