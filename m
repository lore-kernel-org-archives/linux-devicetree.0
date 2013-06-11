From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [RFC 2/2] ARM/dts: add hdmiphy power control pmu register to hdmi dt
 node
Date: Tue, 11 Jun 2013 12:47:53 +0530
Message-ID: <1370935073-7475-3-git-send-email-rahul.sharma@samsung.com>
References: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1370935073-7475-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

Add hdmiphy power control node as a child to hdmi node. This
node will be parsed by hdmi driver to map phy control pmu reg and
control the phy power.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 354e14a..5549236 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -608,6 +608,12 @@
 				<&clock 157>, <&clock 1024>;
 		clock-names = "hdmi", "sclk_hdmi", "sclk_pixel",
 				"sclk_hdmiphy", "mout_hdmi";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		phy-power-control {
+			reg = <0x10040700 0x04>;
+		};
 	};
 
 	mixer {
-- 
1.7.10.4
