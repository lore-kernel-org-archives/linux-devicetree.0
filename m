From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v2 6/6] mailbox: arm_mhu: add support to read and record mbox-name
Date: Wed, 24 May 2017 11:16:43 +0100
Message-ID: <1495621003-4291-7-git-send-email-sudeep.holla@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, Alexey Klimov <alexey.klimov@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

It's sometimes useful to identify the mailbox controller with the name
as specified in the devicetree via mbox-name property especially in a
system with multiple controllers.

This patch adds support to read and record the mailbox controller name.

Cc: Alexey Klimov <alexey.klimov@arm.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/mailbox/arm_mhu.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
index 79d2392d7f3b..08ed22e9e347 100644
--- a/drivers/mailbox/arm_mhu.c
+++ b/drivers/mailbox/arm_mhu.c
@@ -47,6 +47,7 @@ struct arm_mhu {
 	struct mhu_link mlink[MHU_NUM_PCHANS];
 	struct mbox_controller mbox;
 	struct device *dev;
+	const char *name;
 };
 
 /**
@@ -257,8 +258,8 @@ static struct mbox_chan *mhu_mbox_xlate(struct mbox_controller *mbox,
 
 	chan->con_priv = chan_info;
 
-	dev_dbg(mbox->dev, "mbox: created channel phys: %d doorbell: %d\n",
-		pchan, doorbell);
+	dev_dbg(mbox->dev, "mbox: %s, created channel phys: %d doorbell: %d\n",
+		mhu->name, pchan, doorbell);
 
 	return chan;
 }
@@ -366,6 +367,7 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
 	struct mhu_mbox_pdata *pdata;
 	const struct of_device_id *match;
 	struct device *dev = &adev->dev;
+	struct device_node *np = dev->of_node;
 	int mhu_reg[MHU_NUM_PCHANS] = {
 		MHU_LP_OFFSET, MHU_HP_OFFSET, MHU_SEC_OFFSET,
 	};
@@ -395,6 +397,10 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
 		return PTR_ERR(mhu->base);
 	}
 
+	err = of_property_read_string(np, "mbox-name", &mhu->name);
+	if (err)
+		mhu->name = np->full_name;
+
 	chans = devm_kcalloc(dev, max_chans, sizeof(*chans), GFP_KERNEL);
 	if (!chans)
 		return -ENOMEM;
@@ -446,7 +452,7 @@ static int mhu_probe(struct amba_device *adev, const struct amba_id *id)
 		}
 	}
 
-	dev_info(dev, "ARM MHU Mailbox registered\n");
+	dev_info(dev, "%s mailbox registered\n", mhu->name);
 	return 0;
 }
 
-- 
2.7.4
