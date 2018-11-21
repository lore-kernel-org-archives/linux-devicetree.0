Return-Path: <SRS0=YZ5O=OA=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36834 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730169AbeKUWje (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 21 Nov 2018 17:39:34 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20181121120525euoutp01c2a67a5b04ffd4c425708ed3833ea523~pIi10n0DZ1575615756euoutp01L
        for <devicetree@vger.kernel.org>; Wed, 21 Nov 2018 12:05:25 +0000 (GMT)
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH 3/4] arm64: dts: exynos: add imem clock
Date: Wed, 21 Nov 2018 13:05:08 +0100
Message-Id: <20181121120509.18892-4-k.konieczny@partner.samsung.com>
In-Reply-To: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
References: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
        <CGME20181121120524eucas1p2545f7ee0ed4064a10b3bc18f446c288c@eucas1p2.samsung.com>
Sender: devicetree-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Add description for imem clock. The users can use compatibility
"samsung,exynos5433-cmu-imem".

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 2131f12364cb..34055fa3a9d0 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -340,6 +340,21 @@
 				<&cmu_top CLK_SCLK_USBDRD30_FSYS>;
 		};
 
+		cmu_imem: clock-controller@11060000 {
+			compatible = "samsung,exynos5433-cmu-imem";
+			reg = <0x11060000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk",
+				"aclk_imem_sssx_266",
+				"aclk_imem_266",
+				"aclk_imem_200";
+			clocks = <&xxti>,
+				<&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
+				<&cmu_top CLK_DIV_ACLK_IMEM_266>,
+				<&cmu_top CLK_DIV_ACLK_IMEM_200>;
+		};
+
 		cmu_g2d: clock-controller@12460000 {
 			compatible = "samsung,exynos5433-cmu-g2d";
 			reg = <0x12460000 0x1000>;
-- 
2.19.1
