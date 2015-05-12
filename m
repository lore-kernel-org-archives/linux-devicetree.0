From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 05/13] ARM: multi_v7_defconfig: Enable ST's PWM driver
Date: Tue, 12 May 2015 13:51:42 +0100
Message-ID: <1431435110-22595-6-git-send-email-lee.jones@linaro.org>
References: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index a841847..5dc85db 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -556,6 +556,7 @@ CONFIG_PWM_RENESAS_TPU=y
 CONFIG_PWM_TEGRA=y
 CONFIG_PWM_VT8500=y
 CONFIG_PHY_HIX5HD2_SATA=y
+CONFIG_PWM_STI=y
 CONFIG_OMAP_USB2=y
 CONFIG_TI_PIPE3=y
 CONFIG_PHY_MIPHY28LP=y
-- 
1.9.1
