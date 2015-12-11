From: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 1/2] mfd: arizona: Add device tree binding to specify mono outputs
Date: Fri, 11 Dec 2015 10:28:22 +0000
Message-ID: <1449829703-600-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device tree bindings to support specifying outputs from the chip as
mono outputs. Whilst we are doing it change the out_mono pdata from a
bool to an int, because Sparse gets upset about using ARRAY_SIZE on
bools.

Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/mfd/arizona-core.c        | 10 ++++++++++
 include/linux/mfd/arizona/pdata.h |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index b9489a0..4bb4866 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -861,6 +861,16 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
 		count++;
 	}
 
+	count = 0;
+	of_property_for_each_u32(arizona->dev->of_node, "wlf,out-mono", prop,
+				 cur, val) {
+		if (count == ARRAY_SIZE(pdata->out_mono))
+			break;
+
+		pdata->out_mono[count] = !!val;
+		count++;
+	}
+
 	return 0;
 }
 
diff --git a/include/linux/mfd/arizona/pdata.h b/include/linux/mfd/arizona/pdata.h
index 57b45ca..64faeef 100644
--- a/include/linux/mfd/arizona/pdata.h
+++ b/include/linux/mfd/arizona/pdata.h
@@ -171,7 +171,7 @@ struct arizona_pdata {
 	int inmode[ARIZONA_MAX_INPUT];
 
 	/** Mode for outputs */
-	bool out_mono[ARIZONA_MAX_OUTPUT];
+	int out_mono[ARIZONA_MAX_OUTPUT];
 
 	/** PDM speaker mute setting */
 	unsigned int spk_mute[ARIZONA_MAX_PDM_SPK];
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
