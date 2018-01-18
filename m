From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: [PATCH 3/3] ARM: dts: imx53: PPD: Enable secure-reg-access
Date: Thu, 18 Jan 2018 18:43:45 +0100
Message-ID: <20180118174345.26620-4-sebastian.reichel@collabora.co.uk>
References: <20180118174345.26620-1-sebastian.reichel@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180118174345.26620-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@collabora.com>

Add secure-reg-access on PPD device tree to enable PMU and
hardware counters for perf.

Signed-off-by: Peter Senna Tschudin <peter.senna@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
---
 arch/arm/boot/dts/imx53-ppd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx53-ppd.dts b/arch/arm/boot/dts/imx53-ppd.dts
index 80224fa995f9..d8e001f02b05 100644
--- a/arch/arm/boot/dts/imx53-ppd.dts
+++ b/arch/arm/boot/dts/imx53-ppd.dts
@@ -48,6 +48,12 @@
 	model = "General Electric CS ONE";
 	compatible = "ge,imx53-cpuvo", "fsl,imx53";
 
+	soc {
+		pmu {
+			secure-reg-access;
+		};
+	};
+
 	aliases {
 		spi0 = &cspi;
 		spi1 = &ecspi1;
-- 
2.15.1
