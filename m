From: Emmanuel Vadot <manu@freebsd.org>
Subject: [PATCH] ARM: dts: imx6: RIoTboard Add chosen stdout-path property
Date: Mon, 18 Jun 2018 17:42:57 +0200
Message-ID: <20180618154257.16919-1-manu@freebsd.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Emmanuel Vadot <manu@freebsd.org>
List-Id: devicetree@vger.kernel.org

The RIoTboard debug uart is connected to serial1.
Add a chosen property in the DTS so OS knows what serial port to use for
the console.

Signed-off-by: Emmanuel Vadot <manu@freebsd.org>
---
 arch/arm/boot/dts/imx6dl-riotboard.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts/imx6dl-riotboard.dts
index 2e98c92adff7..315d2ae6fa45 100644
--- a/arch/arm/boot/dts/imx6dl-riotboard.dts
+++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
@@ -19,6 +19,10 @@
 		reg = <0x10000000 0x40000000>;
 	};
 
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.17.0
