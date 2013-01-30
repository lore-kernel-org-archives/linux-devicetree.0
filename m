From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 6/6] ARM: dts: Add MFC codec entry to exynos4412-smdk4412 DT file
Date: Wed, 30 Jan 2013 12:41:29 +0530
Message-ID: <1359529889-26318-7-git-send-email-sachin.kamat@linaro.org>
References: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1359529889-26318-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Added MFC DT entry to exynos4412-smdk4412.dts file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4412-smdk4412.dts |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-smdk4412.dts b/arch/arm/boot/dts/exynos4412-smdk4412.dts
index e885971..6ae4276 100644
--- a/arch/arm/boot/dts/exynos4412-smdk4412.dts
+++ b/arch/arm/boot/dts/exynos4412-smdk4412.dts
@@ -34,6 +34,12 @@
 		status = "okay";
 	};
 
+	codec@13400000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+		status = "okay";
+	};
+
 	serial@13800000 {
 		status = "okay";
 	};
-- 
1.7.4.1
