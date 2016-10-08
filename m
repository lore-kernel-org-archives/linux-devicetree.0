From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v10 09/11] ARM: multi_v7_defconfig: Enable st_remoteproc driver.
Date: Sat,  8 Oct 2016 13:52:31 +0100
Message-ID: <1475931154-1021-10-git-send-email-peter.griffin@linaro.org>
References: <1475931154-1021-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475931154-1021-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The st231 remote coprocessors are found on all STi chipsets.

Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c94611c..33f7a8a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -818,6 +818,7 @@ CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_GART=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_REMOTEPROC=m
+CONFIG_ST_REMOTEPROC=m
 CONFIG_PM_DEVFREQ=y
 CONFIG_ARM_TEGRA_DEVFREQ=m
 CONFIG_MEMORY=y
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
