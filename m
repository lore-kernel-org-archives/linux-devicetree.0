From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv3 3/3] ARM: dts: Remove unused command line from
 Exynos3250-based Rinato board
Date: Mon, 24 Nov 2014 19:57:50 +0900
Message-ID: <1416826670-29438-4-git-send-email-cw00.choi@samsung.com>
References: <1416826670-29438-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1416826670-29438-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: kgene.kim@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com
Cc: jh80.chung@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, yj44.cho@samsung.com, geunsik.lim@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch removes unused dt node of command line from Exynos3250-based
Rinato board because kernel use the command line from bootloader.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 84380fa..80aa8b4 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -28,10 +28,6 @@
 		reg =  <0x40000000 0x1ff00000>;
 	};
 
-	chosen {
-		bootargs = "console=ttySAC1,115200N8 root=/dev/mmcblk0p15 rootwait earlyprintk panic=5";
-	};
-
 	firmware@0205F000 {
 		compatible = "samsung,secure-firmware";
 		reg = <0x0205F000 0x1000>;
-- 
1.8.5.5
