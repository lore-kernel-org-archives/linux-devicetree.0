From: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 47/49] ath: add ath11k to Makefile
Date: Tue, 20 Aug 2019 18:48:13 +0300
Message-ID: <1566316095-27507-48-git-send-email-kvalo@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1566316095-27507-1-git-send-email-kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

---
 drivers/net/wireless/ath/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/Makefile b/drivers/net/wireless/ath/Makefile
index e4e460b5498e..72f8e3a24c67 100644
--- a/drivers/net/wireless/ath/Makefile
+++ b/drivers/net/wireless/ath/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_AR5523)		+= ar5523/
 obj-$(CONFIG_WIL6210)		+= wil6210/
 obj-$(CONFIG_ATH10K)		+= ath10k/
 obj-$(CONFIG_WCN36XX)		+= wcn36xx/
+obj-$(CONFIG_ATH11K)		+= ath11k/
 
 obj-$(CONFIG_ATH_COMMON)	+= ath.o
 
