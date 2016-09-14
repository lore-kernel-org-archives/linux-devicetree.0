From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 04/19] MAINTAINERS: Remove phy-stih41x-usb.c entry from STi arch
Date: Wed, 14 Sep 2016 14:27:42 +0100
Message-ID: <1473859677-9231-5-git-send-email-peter.griffin@linaro.org>
References: <1473859677-9231-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473859677-9231-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove this driver as the IP is only found on STiH415/6
silicon, and support for these SoC's is being removed
from the kernel.

Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: <kishon-l0cyMroinI0@public.gmane.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 12c271c..6a278b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1755,7 +1755,6 @@ F:	drivers/media/platform/sti/c8sectpfe/
 F:	drivers/mmc/host/sdhci-st.c
 F:	drivers/phy/phy-miphy28lp.c
 F:	drivers/phy/phy-stih407-usb.c
-F:	drivers/phy/phy-stih41x-usb.c
 F:	drivers/pinctrl/pinctrl-st.c
 F:	drivers/remoteproc/st_remoteproc.c
 F:	drivers/reset/sti/
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
