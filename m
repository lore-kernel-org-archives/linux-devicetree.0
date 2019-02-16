From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH] ARM: dts: rockchip: rk3188-bqedison2qc: remove cap-mmc-highspeed from mmc1 node
Date: Sat, 16 Feb 2019 11:25:45 +0100
Message-ID: <20190216102545.1809-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The mmc1 pins are used for SDIO with a wifi chip.
The function mmc_sdio_switch_hs() only checks for MMC_CAP_SD_HIGHSPEED and
not for MMC_CAP_MMC_HIGHSPEED, so cap-mmc-highspeed can be removed.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3188-bqedison2qc.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk3188-bqedison2qc.dts b/arch/arm/boot/dts/rk3188-bqedison2qc.dts
index e0424daf2..4b798d1a5 100644
--- a/arch/arm/boot/dts/rk3188-bqedison2qc.dts
+++ b/arch/arm/boot/dts/rk3188-bqedison2qc.dts
@@ -446,7 +446,6 @@
 &mmc1 {
 	bus-width = <4>;
 	cap-sd-highspeed;
-	cap-mmc-highspeed;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&sdio_pwrseq>;
 	non-removable;
-- 
2.11.0
