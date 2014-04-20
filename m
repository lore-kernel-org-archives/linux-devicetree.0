From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/5] ARM: dts: enable fimd for exynos5250 based snow board
Date: Sun, 20 Apr 2014 17:18:42 +0530
Message-ID: <1397994525-18537-3-git-send-email-rahul.sharma@samsung.com>
References: <1397994525-18537-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1397994525-18537-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Enable fimd node for snow board.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250-snow.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 586cd38..09f363d 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -344,6 +344,11 @@
 		};
 	};
 
+	fimd@14400000 {
+		status = "okay";
+		samsung,invert-vclk;
+	};
+
 	hdmi {
 		hdmi-en-supply = <&tps65090_fet7>;
 		vdd-supply = <&ldo8_reg>;
-- 
1.7.9.5
