From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH 3/3] ARM: dts: replace number by macro in clock binding for
 exynos5420
Date: Wed, 21 May 2014 17:40:02 +0900
Message-ID: <537C6662.50305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: Myungjoo Ham <myungjoo.ham@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
List-Id: devicetree@vger.kernel.org

sss module device node missed clock macro.
This patch replace magic number with macro in clock
binding for exynos5420.

Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 67ba2c5..1c09c79 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -728,7 +728,7 @@
 		compatible = "samsung,exynos4210-secss";
 		reg = <0x10830000 0x10000>;
 		interrupts = <0 112 0>;
-		clocks = <&clock 471>;
+		clocks = <&clock CLK_SSS>;
 		clock-names = "secss";
 		samsung,power-domain = <&g2d_pd>;
 	};
-- 
1.7.9.5
