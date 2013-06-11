From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 4/4] ARM: dts: Set BUCK7 as always on for Origen board
Date: Tue, 11 Jun 2013 11:59:52 +0530
Message-ID: <1370932192-19365-5-git-send-email-sachin.kamat@linaro.org>
References: <1370932192-19365-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1370932192-19365-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

From: Tushar Behera <tushar.behera@linaro.org>

The LDO for LCD driver is currently not handled by any of the drivers.
This disables the LDO during booting time. To fix this, the LDO
is forced to enabled always.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
No change since v1.
---
 arch/arm/boot/dts/exynos4210-origen.dts |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 4c6c3cd..08609b8 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -225,6 +225,7 @@
 					regulator-min-microvolt = <3300000>;
 					regulator-max-microvolt = <3300000>;
 					regulator-boot-on;
+					regulator-always-on;
 				};
 			};
 		};
-- 
1.7.9.5
