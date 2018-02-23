Return-Path: <SRS0=V9ZR=FR=samsung.com=jh80.chung@kernel.org>
From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH 4/6] arm64: dts: stratix10: remove 'num-slots' property for
 dwmmc
Date: Fri, 23 Feb 2018 15:41:36 +0900
Message-id: <20180223064138.18401-4-jh80.chung@samsung.com>
In-reply-to: <20180223064138.18401-1-jh80.chung@samsung.com>
References: <20180223064138.18401-1-jh80.chung@samsung.com>
	<CGME20180223064140epcas2p3804fe3b7d63e4b7975d94a178e94dffb@epcas2p3.samsung.com>
To: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, manabian@gmail.com, dinguyen@kernel.org, will.deacon@arm.com, xuwei5@hisilicon.com, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Since 'num-slots' had already deprecated, remove the property in
device-tree file.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
index a37c46112876..4e146b4e6487 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
@@ -88,7 +88,6 @@
 
 &mmc {
 	status = "okay";
-	num-slots = <1>;
 	cap-sd-highspeed;
 	broken-cd;
 	bus-width = <4>;
-- 
2.15.1
