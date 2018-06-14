From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v1 5/5] ARM: dts: Renesas RZN1D-DB Board: Add UART0 pinmux node
Date: Thu, 14 Jun 2018 12:00:21 +0100
Message-ID: <1528974029-29617-6-git-send-email-michel.pollet@bp.renesas.com>
References: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the necessary nodes to add pin configuration for the UART0
of that board.

Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
---
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
index 4e57ae2..039ec2e 100644
--- a/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
@@ -8,6 +8,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/pinctrl/r9a06g032-pinctrl.h>
+
 #include "r9a06g032.dtsi"
 
 / {
@@ -23,6 +25,17 @@
 	};
 };
 
+&pinctrl {
+	pinsuart0: pinsuart0 {
+		renesas,rzn1-pinmux-ids = <
+			RZN1_MUX(103, UART0_I)	/* UART0_TXD */
+			RZN1_MUX(104, UART0_I)	/* UART0_RXD */
+		>;
+	};
+};
+
 &uart0 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinsuart0>;
 };
-- 
2.7.4
