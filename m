From: "R. Chandrasekar" <rcsekar@samsung.com>
Subject: [PATCH 1/3] DTS: exynos: add device tree support for exynos mie
Date: Thu, 06 Dec 2012 17:38:13 +0530
Message-ID: <1354795695-28009-2-git-send-email-rcsekar@samsung.com>
References: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, joshi@samsung.com, rcsekar.samsung@gmail.com, rcsekar@samsung.com
List-Id: devicetree@vger.kernel.org

From: "R. Chandrasekar" <rcsekar@samsung.com>

adding device tree support for mobile image enhancement (mie)
module of exynos SoC. driver fetches the base address of mie
from the device tree.

Signed-off-by: R. Chandrasekar <rcsekar@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 8ee3139..abe6520 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -562,10 +562,15 @@
 	fimd: fimd {
 		compatible = "samsung,exynos5-fimd";
 		interrupt-parent = <&combiner>;
-		reg = <0x14400000 0x40000>;
+		reg = <0x14400000 0x30000>;
 		interrupts = <18 5>, <18 4>, <18 6>;
 	};
 
+	mie: mie {
+		compatible = "samsung,exynos5-mie";
+		reg = <0x14430000 0x400>;
+	};
+
 	sysmmu-mfc-l {
 		mmuname = "mfc_l";
 		reg = <0x11210000 0x1000>;
-- 
1.7.9.5
