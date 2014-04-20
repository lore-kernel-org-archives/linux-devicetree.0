From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/5] ARM: dts: enable fimd for exynos5420 based peach-pit board
Date: Sun, 20 Apr 2014 17:18:44 +0530
Message-ID: <1397994525-18537-5-git-send-email-rahul.sharma@samsung.com>
References: <1397994525-18537-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1397994525-18537-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Enable fimd for peach-pit board.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 5b70522..d6eaa1f 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -248,4 +248,9 @@
 		ddc = <&i2c_2>;
 		status = "okay";
 	};
+
+	fimd@14400000 {
+		status = "okay";
+		samsung,invert-vclk;
+	};
 };
-- 
1.7.9.5
