Return-Path: <SRS0=V9ZR=FR=samsung.com=jh80.chung@kernel.org>
From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH 6/6] arm64: dts: hi3660: remove 'num-slots' property for
 dwmmc
Date: Fri, 23 Feb 2018 15:41:38 +0900
Message-id: <20180223064138.18401-6-jh80.chung@samsung.com>
In-reply-to: <20180223064138.18401-1-jh80.chung@samsung.com>
References: <20180223064138.18401-1-jh80.chung@samsung.com>
	<CGME20180223064140epcas2p1fcfb5920453f965d16f717931155fa2f@epcas2p1.samsung.com>
To: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, manabian@gmail.com, dinguyen@kernel.org, will.deacon@arm.com, xuwei5@hisilicon.com, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Since 'num-slots' had already deprecated, remove the property in
device-tree file.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
index ab0b95ba5ae5..d6638b1f09ca 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
@@ -910,7 +910,6 @@
 			#size-cells = <0>;
 			cd-inverted;
 			compatible = "hisilicon,hi3660-dw-mshc";
-			num-slots = <1>;
 			bus-width = <0x4>;
 			disable-wp;
 			cap-sd-highspeed;
@@ -948,7 +947,6 @@
 			compatible = "hisilicon,hi3660-dw-mshc";
 			reg = <0x0 0xff3ff000 0x0 0x1000>;
 			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
-			num-slots = <1>;
 			clocks = <&crg_ctrl HI3660_CLK_GATE_SDIO0>,
 				 <&crg_ctrl HI3660_HCLK_GATE_SDIO0>;
 			clock-names = "ciu", "biu";
-- 
2.15.1
