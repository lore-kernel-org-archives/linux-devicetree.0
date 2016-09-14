From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 06/19] ARM: multi_v7_defconfig: Remove stih41x phy Kconfig symbol.
Date: Wed, 14 Sep 2016 14:27:44 +0100
Message-ID: <1473859677-9231-7-git-send-email-peter.griffin@linaro.org>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, devicetree@vger.kernel.org
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, kishon@ti.com
List-Id: devicetree@vger.kernel.org

This IP is only found on STiH415/6 silicon and support
for these SoCs is being removed from the kernel.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Cc: <kishon@ti.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 949ab7f..b26a541 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -855,7 +855,6 @@ CONFIG_PHY_ROCKCHIP_USB=m
 CONFIG_PHY_QCOM_APQ8064_SATA=m
 CONFIG_PHY_MIPHY28LP=y
 CONFIG_PHY_RCAR_GEN2=m
-CONFIG_PHY_STIH41X_USB=y
 CONFIG_PHY_STIH407_USB=y
 CONFIG_PHY_SUN4I_USB=y
 CONFIG_PHY_SUN9I_USB=y
-- 
1.9.1
