Return-Path: <SRS0=V9ZR=FR=samsung.com=jh80.chung@kernel.org>
From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH 5/6] ARM: dts: lpc18xx: remove 'num-slots' property for
 dwmmc
Date: Fri, 23 Feb 2018 15:41:37 +0900
Message-id: <20180223064138.18401-5-jh80.chung@samsung.com>
In-reply-to: <20180223064138.18401-1-jh80.chung@samsung.com>
References: <20180223064138.18401-1-jh80.chung@samsung.com>
	<CGME20180223064140epcas2p1bf475ebcbfa8a0c46e92402e31590891@epcas2p1.samsung.com>
To: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, manabian@gmail.com, dinguyen@kernel.org, will.deacon@arm.com, xuwei5@hisilicon.com, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Since 'num-slots' had already deprecated, remove the property in
device-tree file.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 arch/arm/boot/dts/lpc18xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index 7cae9c5e27db..10b8249b8ab6 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -115,7 +115,6 @@
 			compatible = "snps,dw-mshc";
 			reg = <0x40004000 0x1000>;
 			interrupts = <6>;
-			num-slots = <1>;
 			clocks = <&ccu2 CLK_SDIO>, <&ccu1 CLK_CPU_SDIO>;
 			clock-names = "ciu", "biu";
 			resets = <&rgu 20>;
-- 
2.15.1
