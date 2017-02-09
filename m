From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 8/8] ARM: sun8i: a33: Add the Mali OPPs
Date: Thu,  9 Feb 2017 17:39:22 +0100
Message-ID: <2e4a4f3f2f584f65f3c2d5e78f589015c651198d.1486655917.git-series.maxime.ripard@free-electrons.com>
References: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
References: <cover.7101c7323e6f22e281ad70b93488cf44caca4ca0.1486655917.git-series.maxime.ripard@free-electrons.com>
Sender: owner-linux-mm@kvack.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

The Mali GPU in the A33 has various operating frequencies used in the
Allwinner BSP.

Add them to our DT.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-a33.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index 043b1b017276..e1b0abfee42f 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -101,6 +101,22 @@
 		status = "disabled";
 	};
 
+	mali_opp_table: opp_table1 {
+		compatible = "operating-points-v2";
+
+		opp@144000000 {
+			opp-hz = /bits/ 64 <144000000>;
+		};
+
+		opp@240000000 {
+			opp-hz = /bits/ 64 <240000000>;
+		};
+
+		opp@384000000 {
+			opp-hz = /bits/ 64 <384000000>;
+		};
+	};
+
 	memory {
 		reg = <0x40000000 0x80000000>;
 	};
@@ -282,6 +298,7 @@
 
 &mali {
 	memory-region = <&display_pool>;
+	operating-points-v2 = <&mali_opp_table>;
 };
 
 &pio {
-- 
git-series 0.8.11

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
