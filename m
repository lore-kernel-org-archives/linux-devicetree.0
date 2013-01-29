From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/6] ARM: dts: Add MFC codec support to SMDKV310 DT
Date: Tue, 29 Jan 2013 09:43:39 +0530
Message-ID: <1359432822-23846-4-git-send-email-sachin.kamat@linaro.org>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Added MFC codec support to SMDKV310 DT file.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/boot/dts/exynos4210-smdkv310.dts |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index f634907..8481f8f 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -189,4 +189,9 @@
 			};
 		};
 	};
+
+	codec@13400000 {
+		samsung,mfc-r = <0x43000000 0x800000>;
+		samsung,mfc-l = <0x51000000 0x800000>;
+	};
 };
-- 
1.7.4.1
