From: <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 2/5] ARM: multi_v7_defconfig: Remove ST_THERMAL_SYSCFG Kconfig symbol
Date: Fri, 21 Oct 2016 17:57:20 +0200
Message-ID: <1477065443-10668-3-git-send-email-patrice.chotard@st.com>
References: <1477065443-10668-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477065443-10668-1-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>

STiH415/6 SoC support is being removed from the kernel and
was the only platform using this Kconfig symbol

Signed-off-by: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
Cc: <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 437d074..15b2f99 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -450,7 +450,6 @@ CONFIG_RCAR_THERMAL=y
 CONFIG_ARMADA_THERMAL=y
 CONFIG_DAVINCI_WATCHDOG=m
 CONFIG_EXYNOS_THERMAL=m
-CONFIG_ST_THERMAL_SYSCFG=y
 CONFIG_ST_THERMAL_MEMMAP=y
 CONFIG_WATCHDOG=y
 CONFIG_DA9063_WATCHDOG=m
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
