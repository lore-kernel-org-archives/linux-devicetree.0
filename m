From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/4] ARM/dts: add clocks to hdmi dt node for exynos5250
Date: Tue, 11 Jun 2013 12:24:05 +0530
Message-ID: <1370933645-18344-5-git-send-email-rahul.sharma@samsung.com>
References: <1370933645-18344-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1370933645-18344-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

Fix wrong clock numbers in hdmi dt node. Removed hdmiphy
clock which was a dummy clock earlier and not required now.
Also added mux clock to change the clock parent.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 9d9496a..354e14a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -604,10 +604,10 @@
 		compatible = "samsung,exynos5-hdmi";
 		reg = <0x14530000 0x70000>;
 		interrupts = <0 95 0>;
-		clocks = <&clock 333>, <&clock 136>, <&clock 137>,
-				<&clock 333>, <&clock 333>;
+		clocks = <&clock 344>, <&clock 136>, <&clock 137>,
+				<&clock 157>, <&clock 1024>;
 		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
-				"sclk_hdmiphy", "hdmiphy";
+				"sclk_hdmiphy", "mout_hdmi";
 	};
 
 	mixer {
-- 
1.7.10.4
