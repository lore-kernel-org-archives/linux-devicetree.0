From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v6 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Tue, 4 Jun 2019 13:16:09 +0530
Message-ID: <b768bde9-d6c8-f655-aecb-d08bcb9286a6@ti.com>
References: <1554882504-9010-1-git-send-email-pawell@cadence.com>
 <1554882504-9010-6-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554882504-9010-6-git-send-email-pawell@cadence.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, felipe.balbi@linux.intel.com, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On 10/04/19 1:18 PM, Pawel Laszczak wrote:
> +static void cdns3_wa1_tray_restore_cycle_bit(struct cdns3_device *priv_dev,
> +					     struct cdns3_endpoint *priv_ep)
> +{
> +	int dma_index;
> +	u32 doorbell;
> +
> +	doorbell = !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);

> +	dma_index = (readl(&priv_dev->regs->ep_traddr) -
> +		    priv_ep->trb_pool_dma) / TRB_SIZE;

This gets upgraded to 64-bit by 64-bit division whenever dma_addr_t is 
64-bit. That should be avoided. Following diff should fix it. 
But please review the logic itself. You are subtracting a 64 bit entity 
from a 32-bit entity. What is guaranteeing that priv_ep->trb_pool_dma is 
32-bit?

There is one more instance of same issue in cdns3_request_handled().

Thanks,
Sekhar

[1]
diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index bfd5dbf40c7e..e73b618501fb 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -749,8 +749,8 @@ static void cdns3_wa1_tray_restore_cycle_bit(struct cdns3_device *priv_dev,
 	u32 doorbell;
 
 	doorbell = !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
-	dma_index = (readl(&priv_dev->regs->ep_traddr) -
-		    priv_ep->trb_pool_dma) / TRB_SIZE;
+	dma_index = readl(&priv_dev->regs->ep_traddr) - priv_ep->trb_pool_dma;
+	dma_index /= TRB_SIZE;
