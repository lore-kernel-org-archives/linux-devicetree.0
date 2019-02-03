From: Benjamin Drung <bdrung@posteo.de>
Subject: [PATCH] ARM: dts: exynos: Fix spelling mistake of EXYNOS5420
Date: Sun, 03 Feb 2019 21:13:30 +0100
Message-ID: <bb0903e066484e02f5dcd0e9cbe94a491a179fba.camel@posteo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The SoC name EXYNOS5420 was misspelled.

Signed-off-by: Benjamin Drung <bdrung@posteo.de>
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index aaff15880761..5fb2326875dc 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -5,7 +5,7 @@
  * Copyright (c) 2013 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
- * SAMSUNG EXYNOS54200 SoC device nodes are listed in this file.
+ * SAMSUNG EXYNOS5420 SoC device nodes are listed in this file.
  * EXYNOS5420 based board files can include this file and provide
  * values for board specfic bindings.
  */
-- 
2.19.1
