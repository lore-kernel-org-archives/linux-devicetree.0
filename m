Return-Path: <devicetree-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:40657 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753772Ab3HWJbQ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 23 Aug 2013 05:31:16 -0400
Date: Fri, 23 Aug 2013 12:30:56 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] dma: cppi41: off by one in desc_to_chan()
Message-ID: <20130823093056.GG31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

The test here should be ">=" instead of ">".  The cdd->chan_busy[] array
has "ALLOC_DECS_NUM" elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/dma/cppi41.c b/drivers/dma/cppi41.c
index 5dcebca..7f6524c 100644
--- a/drivers/dma/cppi41.c
+++ b/drivers/dma/cppi41.c
@@ -241,7 +241,7 @@ static struct cppi41_channel *desc_to_chan(struct cppi41_dd *cdd, u32 desc)
 	}
 
 	desc_num = (desc - cdd->descs_phys) / sizeof(struct cppi41_desc);
-	BUG_ON(desc_num > ALLOC_DECS_NUM);
+	BUG_ON(desc_num >= ALLOC_DECS_NUM);
 	c = cdd->chan_busy[desc_num];
 	cdd->chan_busy[desc_num] = NULL;
 	return c;
