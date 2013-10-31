From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V5 1/3] ARM: dts: Add pmu sysreg node to Exynos5 dtsi file
Date: Thu, 31 Oct 2013 11:30:48 +0530
Message-ID: <1383199250-15405-2-git-send-email-l.krishna@samsung.com>
References: <1383199250-15405-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1383199250-15405-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, wim@iguana.be
Cc: t.figa@samsung.com, devicetree@vger.kernel.org, dianders@chromium.org, linux-watchdog@vger.kernel.org, cpgs@samsung.com, sachin.kamat@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds pmusysreg node to Exynos5 dtsi file to handle PMU
register accesses in a centralized way using syscon driver

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index e52b038..ad6e47c9 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -106,4 +106,9 @@
 		#size-cells = <0>;
 		status = "disabled";
 	};
+
+	pmu_syscon: syscon@10040000 {
+		compatible = "syscon";
+		reg = <0x10040000 0x5000>;
+	};
 };
-- 
1.7.10.4
