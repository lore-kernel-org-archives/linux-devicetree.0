From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 4/4] ARM: dts: add sram for imx53 and imx6q
Date: Fri, 23 Nov 2012 15:24:15 +0100
Message-ID: <1353680655-21624-5-git-send-email-p.zabel@pengutronix.de>
References: <1353680655-21624-1-git-send-email-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1353680655-21624-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Shawn Guo <shawn.guo@linaro.org>, Richard Zhao <richard.zhao@freescale.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, Matt Porter <mporter@ti.com>, Fabio Estevam <fabio.estevam@freescale.com>, Javier Martin <javier.martin@vista-silicon.com>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm/boot/dts/imx53.dtsi |    5 +++++
 arch/arm/boot/dts/imx6q.dtsi |    6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 76ebb1a..7677218 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -541,5 +541,10 @@
 				status = "disabled";
 			};
 		};
+
+		ocram: ocram@f8000000 {
+			compatible = "fsl,imx-ocram", "sram";
+			reg = <0xf8000000 0x20000>;
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index f3990b0..855ac25 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -116,6 +116,12 @@
 			status = "disabled";
 		};
 
+		ocram: ocram@00900000 {
+			compatible = "fsl,imx-ocram", "sram";
+			reg = <0x00900000 0x3f000>;
+			clocks = <&clks 142>;
+		};
+
 		timer@00a00600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0x00a00600 0x20>;
-- 
1.7.10.4
