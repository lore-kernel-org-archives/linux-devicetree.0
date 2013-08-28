From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] dma: cppi41: off by one in desc_to_chan()
Date: Wed, 28 Aug 2013 13:48:44 +0300
Message-ID: <20130828104844.GG19256@mwanda>
References: <20130826083220.GM2748@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130826083220.GM2748@intel.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The test here should be ">=" instead of ">".  The cdd->chan_busy[] array
has "ALLOC_DECS_NUM" elements.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Vinod Koul <vinod.koul@intel.com>
---
Resending to Greg and the USB people because Vinod says this goes
through the USB tree.

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

