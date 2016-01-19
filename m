From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] arm64: dts: Add PSCI function IDs for cpu-{on,off} on exynos7
Date: Tue, 19 Jan 2016 15:51:24 +0530
Message-ID: <1453198884-28723-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, k.kozlowski@samsung.com, devicetree@vger.kernel.org, kgene@kernel.org, alim.akhtar@samsung.com
List-Id: devicetree@vger.kernel.org

This patch adds cpu-{on,off} function IDs as per PSCI specification,
with this we can boot multiple CPUs and can use cpu hotplug on
exynos7 platform.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index f9c5a549c2c0..1a2bb3b453e5 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -65,6 +65,8 @@
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
+		cpu_on = <0xC4000003>;
+		cpu_off = <0x84000002>;
 	};
 
 	soc: soc {
-- 
1.7.10.4
