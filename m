From: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC 6/8] PM / devfreq: exynos: Fix typo in macro
Date: Sun, 27 Apr 2014 02:08:46 +0530
Message-ID: <1398544728-2075-7-git-send-email-a.kesavan@samsung.com>
References: <1398544728-2075-1-git-send-email-a.kesavan@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398544728-2075-1-git-send-email-a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-pm-u79uwXL29TaqPxH82wqD4g@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kesavan.abhilash-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix PPMU_BEVTSEL macro being used in the PPMU driver.

Signed-off-by: Abhilash Kesavan <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/devfreq/exynos/exynos_ppmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/exynos/exynos_ppmu.h b/drivers/devfreq/exynos/exynos_ppmu.h
index 71f17ba..d5c14eb 100644
--- a/drivers/devfreq/exynos/exynos_ppmu.h
+++ b/drivers/devfreq/exynos/exynos_ppmu.h
@@ -37,7 +37,7 @@
 
 #define PPMU_BEVT0SEL		0x1000
 #define PPMU_BEVTSEL_OFFSET	0x100
-#define PPMU_BEVTSEL(x)		(PPMU_BEVT0SEL + (ch * PPMU_BEVTSEL_OFFSET))
+#define PPMU_BEVTSEL(ch)	(PPMU_BEVT0SEL + (ch * PPMU_BEVTSEL_OFFSET))
 
 /* For Event Selection */
 #define RD_DATA_COUNT		0x5
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
