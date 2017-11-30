From: tyler@opensourcefoundries.com
Subject: [PATCH 2/8] ARM: dts: imx7: build imx7d-sbc-iot-imx7 dtb
Date: Thu, 30 Nov 2017 12:14:28 -0800
Message-ID: <20171130201434.14122-3-tyler@opensourcefoundries.com>
References: <20171130201434.14122-1-tyler@opensourcefoundries.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171130201434.14122-1-tyler@opensourcefoundries.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tyler Baker <tyler@opensourcefoundries.com>
List-Id: devicetree@vger.kernel.org

From: Tyler Baker <tyler@opensourcefoundries.com>

Build the imx7d-sbc-iot-imx7 device tree blob.

Signed-off-by: Tyler Baker <tyler@opensourcefoundries.com>
---
 arch/arm/boot/dts/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0381e9..0334137 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -515,6 +515,7 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-nitrogen7.dtb \
 	imx7d-pico.dtb \
 	imx7d-sbc-imx7.dtb \
+	imx7d-sbc-iot-imx7.dtb \
 	imx7d-sdb.dtb \
 	imx7d-sdb-sht11.dtb \
 	imx7s-colibri-eval-v3.dtb \
-- 
2.9.3
