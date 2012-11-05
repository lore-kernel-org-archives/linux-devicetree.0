From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 3/5] dts: exynos5: add dt node for tv iommu device
Date: Mon, 05 Nov 2012 13:01:23 +0530
Message-ID: <1352100685-7695-4-git-send-email-rahul.sharma@samsung.com>
References: <1352100685-7695-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1352100685-7695-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com
List-Id: devicetree@vger.kernel.org

This patch adds device tree node for tv iommu device and sysmmu
property to its client that is hdmi dt node.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Signed-off-by: Prathyush K <prathyush.k@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index cf6a02d..928313a 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -545,11 +545,21 @@
 		compatible = "samsung,exynos5-hdmi";
 		reg = <0x14530000 0x100000>;
 		interrupts = <0 95 0>;
+		sysmmu = <&sysmmu_28>;
 	};
 
 	mixer {
 		compatible = "samsung,exynos5-mixer";
 		reg = <0x14450000 0x10000>;
 		interrupts = <0 94 0>;
+		sysmmu = <&sysmmu_28>;
+	};
+
+	sysmmu_28: sysmmu@0x14650000 {
+		compatible = "samsung,exynos5-sysmmu";
+		temp = "sysmmu@0x14650000";
+		reg = <0x14650000 0x100>;
+		interrupts = <7 4>;
+		interrupt-parent = <&combiner>;
 	};
 };
-- 
1.7.0.4
