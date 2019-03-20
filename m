From: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: [PATCH 2/2] ARM64: dts: Remove unused properties from FSL QSPI nodes
Date: Wed, 20 Mar 2019 14:38:04 +0000
Message-ID: <20190320143800.3555-2-frieder.schrempf@kontron.de>
References: <20190320143800.3555-1-frieder.schrempf@kontron.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190320143800.3555-1-frieder.schrempf@kontron.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>
Cc: Schrempf Frieder <frieder.schrempf@kontron.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

After switching to the new FSL QSPI driver the properties
'fsl,qspi-has-second-chip' and 'big-endian' are not used anymore.

The driver now uses the 'reg' property to determine the bus and
the chipselect. The endianness is selected by the driver depending
on which SoC is used.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 1 -
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 6fd6116509cc..2fb8138c6bb0 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -296,7 +296,6 @@
 			interrupts = <0 99 0x4>;
 			clock-names = "qspi_en", "qspi";
 			clocks = <&clockgen 4 0>, <&clockgen 4 0>;
-			big-endian;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index cb7185014d3a..b0ef08b090dd 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -215,8 +215,6 @@
 			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "qspi_en", "qspi";
 			clocks = <&clockgen 4 1>, <&clockgen 4 1>;
-			big-endian;
-			fsl,qspi-has-second-chip;
 			status = "disabled";
 		};
 
-- 
2.17.1
