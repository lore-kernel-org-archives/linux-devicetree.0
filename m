From: Jagan Teki <jagannadh.teki@gmail.com>
Subject: [PATCH v5 4/5] ARM: dts: imx6dl-icore: Add touchscreen node
Date: Mon, 18 Sep 2017 16:58:32 +0530
Message-ID: <1505734113-9708-4-git-send-email-jteki@openedev.com>
References: <1505734113-9708-1-git-send-email-jteki@openedev.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505734113-9708-1-git-send-email-jteki@openedev.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>, Michael Trimarchi <michael@amarulasolutions.com>, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

From: Jagan Teki <jagan@amarulasolutions.com>

max11801 touchscreen on Engicam iCoreM6 DualLite/Solo module is
connected via i2c1, so add max11801: touchscreen@48 on i2c1.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v5, v4, v3,v2:
- none

 arch/arm/boot/dts/imx6dl-icore.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/imx6dl-icore.dts b/arch/arm/boot/dts/imx6dl-icore.dts
index 6de83c7..971f9fc 100644
--- a/arch/arm/boot/dts/imx6dl-icore.dts
+++ b/arch/arm/boot/dts/imx6dl-icore.dts
@@ -57,3 +57,12 @@
 &can2 {
 	status = "okay";
 };
+
+&i2c1 {
+	max11801: touchscreen@48 {
+		compatible = "maxim,max11801";
+		reg = <0x48>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
-- 
2.7.4
