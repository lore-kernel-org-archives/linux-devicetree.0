From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2] ARM: dts: rockchip: remove disable-wp from rv1108-elgin-r1 emmc node
Date: Sun, 10 Mar 2019 16:19:28 +0100
Message-ID: <20190310151928.2344-1-jbx6244@gmail.com>
References: <20190219130317.2817-1-jbx6244@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219130317.2817-1-jbx6244@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The mmc.txt didn't explicitly say disable-wp is for SD card slot only,
but that is what it was designed for in the first place.
Remove all disable-wp from emmc or sdio controllers.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>
---
 arch/arm/boot/dts/rv1108-elgin-r1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/rv1108-elgin-r1.dts b/arch/arm/boot/dts/rv1108-elgin-r1.dts
index 1c4507b66..b1db92471 100644
--- a/arch/arm/boot/dts/rv1108-elgin-r1.dts
+++ b/arch/arm/boot/dts/rv1108-elgin-r1.dts
@@ -37,7 +37,6 @@
 &emmc {
 	bus-width = <8>;
 	cap-mmc-highspeed;
-	disable-wp;
 	no-sd;
 	no-sdio;
 	non-removable;
-- 
2.11.0
