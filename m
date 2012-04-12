From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH 04/13] i2c-pxa: Drop leftover comment
Date: Thu, 12 Apr 2012 20:45:23 +0200
Message-ID: <1334256332-29867-5-git-send-email-k.lewandowsk@samsung.com>
References: <1334256332-29867-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1334256332-29867-1-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, thomas.abraham@linaro.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, olof@lixom.net, kgene.kim@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>, Wolfram Sang <w.sang@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Commit 488bf314b ("i2c: Allow i2c_add_numbered_adapter() to assign a
bus id") reworked i2c-pxa driver leaving obsolete comment.

This commit simply drops it.

Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/i2c/busses/i2c-pxa.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index f673326..a997c7d 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1131,11 +1131,6 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	spin_lock_init(&i2c->lock);
 	init_waitqueue_head(&i2c->wait);
 
-	/*
-	 * If "dev->id" is negative we consider it as zero.
-	 * The reason to do so is to avoid sysfs names that only make
-	 * sense when there are multiple adapters.
-	 */
 	i2c->adap.nr = dev->id;
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name), "pxa_i2c-i2c.%u",
 		 i2c->adap.nr);
-- 
1.7.9.1
