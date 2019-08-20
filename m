From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 48/49] ath: add ath11k to Kconfig
Date: Tue, 20 Aug 2019 18:48:14 +0300
Message-ID: <1566316095-27507-49-git-send-email-kvalo@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-1-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

---
 drivers/net/wireless/ath/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/Kconfig b/drivers/net/wireless/ath/Kconfig
index 82ab7c33cf97..88473bcdd196 100644
--- a/drivers/net/wireless/ath/Kconfig
+++ b/drivers/net/wireless/ath/Kconfig
@@ -61,5 +61,6 @@ source "drivers/net/wireless/ath/ar5523/Kconfig"
 source "drivers/net/wireless/ath/wil6210/Kconfig"
 source "drivers/net/wireless/ath/ath10k/Kconfig"
 source "drivers/net/wireless/ath/wcn36xx/Kconfig"
+source "drivers/net/wireless/ath/ath11k/Kconfig"
 
 endif
