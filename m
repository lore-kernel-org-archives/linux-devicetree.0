From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 8/9] ARM/dts: add phy property to exynos5250 hdmi dt node
Date: Tue, 11 Jun 2013 19:41:30 +0530
Message-ID: <1370959891-8923-9-git-send-email-rahul.sharma@samsung.com>
References: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1370959891-8923-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

Add property to hdmi node to get phandle for hdmiphy node. This
is required to check the compatible type of phy in hdmi driver.
If phy is compatible to exynos5420, it needs to be treated as a
platform device rather than a i2c device.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 0ec6856..239341d 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -101,7 +101,7 @@
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-max-bus-freq = <66000>;
 
-		hdmiphy@38 {
+		hdmiphy: hdmiphy@38 {
 			compatible = "samsung,exynos4210-hdmiphy";
 			reg = <0x38>;
 		};
@@ -187,6 +187,7 @@
 
 	hdmi {
 		hpd-gpio = <&gpx3 7 0>;
+		phy = <&hdmiphy>;
 	};
 
 	codec@11000000 {
-- 
1.7.10.4
