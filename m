From: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v5 2/6] ath10k: Add support to create boardname for non-bmi target
Date: Wed, 15 Aug 2018 14:56:33 +0530
Message-ID: <20180815092637.11455-3-govinds@codeaurora.org>
References: <20180815092637.11455-1-govinds@codeaurora.org>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180815092637.11455-1-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, niklas.cassel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rakesh Pillai <pillair-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rakesh Pillai <pillair-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Add support to create the boardname for non-bmi targets
like WCN3990, which uses qmi for bdf download. This
boardname is used to parse the board data from board-2.bin.

Signed-off-by: Rakesh Pillai <pillair-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 drivers/net/wireless/ath/ath10k/core.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 85c58ebbfb26..840e301b6a6e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1440,6 +1440,14 @@ static int ath10k_core_create_board_name(struct ath10k *ar, char *name,
 		goto out;
 	}
 
+	if (ar->id.qmi_ids_valid) {
+		scnprintf(name, name_len,
+			  "bus=%s,qmi-board-id=%x",
+			  ath10k_bus_str(ar->hif.bus),
+			  ar->id.qmi_board_id);
+		goto out;
+	}
+
 	scnprintf(name, name_len,
 		  "bus=%s,vendor=%04x,device=%04x,subsystem-vendor=%04x,subsystem-device=%04x%s",
 		  ath10k_bus_str(ar->hif.bus),
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 427ee5752bb0..3a4ac3c0d5a6 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -941,6 +941,8 @@ struct ath10k {
 		u32 subsystem_device;
 
 		bool bmi_ids_valid;
+		bool qmi_ids_valid;
+		u32 qmi_board_id;
 		u8 bmi_board_id;
 		u8 bmi_chip_id;
 
-- 
2.17.0
