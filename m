Return-Path: <SRS0=tAzC=OA=partner.samsung.com=k.konieczny@kernel.org>
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH 2/4] arm64: dts: bindings: document imem clock
Date: Wed, 21 Nov 2018 13:05:07 +0100
Message-Id: <20181121120509.18892-3-k.konieczny@partner.samsung.com>
In-Reply-To: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
References: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
	<CGME20181121120523eucas1p1e8c1ef3d19d0f71bbdc57e2a470c80b0@eucas1p1.samsung.com>
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Document imem clock bindings for SSS (Security SubSystem) and SlimSSS IPs.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
index 50d5897c9849..4e4352bf5a0b 100644
--- a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
@@ -19,6 +19,8 @@ Required Properties:
     which generates clocks for PMU/TMU/MCT/WDT/RTC/SECKEY/TZPC IPs.
   - "samsung,exynos5433-cmu-fsys"  - clock controller compatible for CMU_FSYS
     which generates clocks for USB/UFS/SDMMC/TSI/PDMA IPs.
+  - "samsung,exynos5433-cmu-imem"   - clock controller compatible for CMU_IMEM
+    which generates clocks for SSS (Security SubSystem) and SlimSSS IPs.
   - "samsung,exynos5433-cmu-g2d"   - clock controller compatible for CMU_G2D
     which generates clocks for G2D/MDMA IPs.
   - "samsung,exynos5433-cmu-disp"  - clock controller compatible for CMU_DISP
@@ -88,6 +90,12 @@ Required Properties:
 		- sclk_usbhost30_fsys
 		- sclk_usbdrd30_fsys
 
+	Input clocks for imem clock controller:
+		- oscclk
+		- aclk_imem_sssx_266
+		- aclk_imem_266
+		- aclk_imem_200
+
 	Input clocks for g2d clock controller:
 		- oscclk
 		- aclk_g2d_266
@@ -264,6 +272,21 @@ Example 2: Examples of clock controller nodes are listed below.
 		       <&cmu_top CLK_SCLK_USBDRD30_FSYS>;
 	};
 
+	cmu_imem: clock-controller@11060000 {
+		compatible = "samsung,exynos5433-cmu-imem";
+		reg = <0x11060000 0x1000>;
+		#clock-cells = <1>;
+
+		clock-names = "oscclk",
+			"aclk_imem_sssx_266",
+			"aclk_imem_266",
+			"aclk_imem_200";
+		clocks = <&xxti>,
+			<&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
+			<&cmu_top CLK_DIV_ACLK_IMEM_266>,
+			<&cmu_top CLK_DIV_ACLK_IMEM_200>;
+	};
+
 	cmu_g2d: clock-controller@12460000 {
 		compatible = "samsung,exynos5433-cmu-g2d";
 		reg = <0x12460000 0x0b08>;
-- 
2.19.1
