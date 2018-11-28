From: Roger Quadros <rogerq@ti.com>
Subject: Re: [RFC PATCH v2 08/15] usb:cdns3: Implements device operations part
 of the API
Date: Wed, 28 Nov 2018 14:22:27 +0200
Message-ID: <5BFE8883.7090802@ti.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-9-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542535751-16079-9-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Felipe Balbi <balbi@kernel.org>
List-Id: devicetree@vger.kernel.org



On 18/11/18 12:09, Pawel Laszczak wrote:
> Patch adds implementation callback function defined in
> usb_gadget_ops object.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  drivers/usb/cdns3/gadget.c | 249 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 247 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> index 376b68b13d1b..702a05faa664 100644
> --- a/drivers/usb/cdns3/gadget.c
> +++ b/drivers/usb/cdns3/gadget.c
> @@ -17,6 +17,36 @@
>  #include "gadget-export.h"
>  #include "gadget.h"
>  
> +/**
> + * cdns3_handshake - spin reading  until handshake completes or fails
> + * @ptr: address of device controller register to be read
> + * @mask: bits to look at in result of read
> + * @done: value of those bits when handshake succeeds
> + * @usec: timeout in microseconds
> + *
> + * Returns negative errno, or zero on success
> + *
> + * Success happens when the "mask" bits have the specified value (hardware
> + * handshake done). There are two failure modes: "usec" have passed (major
> + * hardware flakeout), or the register reads as all-ones (hardware removed).
> + */
> +int cdns3_handshake(void __iomem *ptr, u32 mask, u32 done, int usec)
> +{
> +	u32	result;
> +
> +	do {
> +		result = readl(ptr);
> +		if (result == ~(u32)0)	/* card removed */
> +			return -ENODEV;

Is this applicable to all registers?
What is meant by card removed? We're not connected to host?

how does EP reset behave when there is no USB connection?

> +		result &= mask;
> +		if (result == done)
> +			return 0;
> +		udelay(1);
> +		usec--;
> +	} while (usec > 0);
> +	return -ETIMEDOUT;
> +}
> +
>  /**
>   * cdns3_set_register_bit - set bit in given register.
>   * @ptr: address of device controller register to be read and changed
> @@ -43,6 +73,25 @@ void cdns3_select_ep(struct cdns3_device *priv_dev, u32 ep)
>  	writel(ep, &priv_dev->regs->ep_sel);
>  }
>  
> +static void cdns3_free_trb_pool(struct cdns3_endpoint *priv_ep)
> +{
> +	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
> +
> +	if (priv_ep->trb_pool) {
> +		dma_free_coherent(priv_dev->sysdev,
> +				  TRB_RIGN_SIZE,
> +				  priv_ep->trb_pool, priv_ep->trb_pool_dma);
> +		priv_ep->trb_pool = NULL;
> +	}
> +
> +	if (priv_ep->aligned_buff) {
> +		dma_free_coherent(priv_dev->sysdev, CDNS3_UNALIGNED_BUF_SIZE,
> +				  priv_ep->aligned_buff,
> +				  priv_ep->aligned_dma_addr);
> +		priv_ep->aligned_buff = NULL;
> +	}
> +}
> +
>  /**
>   * cdns3_irq_handler - irq line interrupt handler
>   * @cdns: cdns3 instance
> @@ -58,6 +107,114 @@ static irqreturn_t cdns3_irq_handler_thread(struct cdns3 *cdns)
>  	return ret;
>  }
>  
> +/* Find correct direction for HW endpoint according to description */
> +static int cdns3_ep_dir_is_correct(struct usb_endpoint_descriptor *desc,
> +				   struct cdns3_endpoint *priv_ep)
> +{
> +	return (priv_ep->endpoint.caps.dir_in && usb_endpoint_dir_in(desc)) ||
> +	       (priv_ep->endpoint.caps.dir_out && usb_endpoint_dir_out(desc));
> +}
> +
> +static struct cdns3_endpoint *cdns3_find_available_ss_ep(struct cdns3_device *priv_dev,
> +							 struct usb_endpoint_descriptor *desc)

why is this function called ss_ep? This doesn't seem like only for superspeed endpoints.

> +{
> +	struct usb_ep *ep;
> +	struct cdns3_endpoint *priv_ep;
> +
> +	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
> +		unsigned long num;
> +		int ret;
> +		/* ep name pattern likes epXin or epXout */
> +		char c[2] = {ep->name[2], '\0'};
> +
> +		ret = kstrtoul(c, 10, &num);
> +		if (ret)
> +			return ERR_PTR(ret);
> +
> +		priv_ep = ep_to_cdns3_ep(ep);
> +		if (cdns3_ep_dir_is_correct(desc, priv_ep)) {
> +			if (!(priv_ep->flags & EP_USED)) {
> +				priv_ep->num  = num;
> +				priv_ep->flags |= EP_USED;
> +				return priv_ep;
> +			}
> +		}
> +	}
> +	return ERR_PTR(-ENOENT);
> +}
> +
> +static struct usb_ep *cdns3_gadget_match_ep(struct usb_gadget *gadget,
> +					    struct usb_endpoint_descriptor *desc,
> +					    struct usb_ss_ep_comp_descriptor *comp_desc)
> +{
> +	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
> +	struct cdns3_endpoint *priv_ep;
> +	unsigned long flags;
> +
> +	priv_ep = cdns3_find_available_ss_ep(priv_dev, desc);
> +	if (IS_ERR(priv_ep)) {
> +		dev_err(&priv_dev->dev, "no available ep\n");
> +		return NULL;
> +	}
> +
> +	dev_dbg(&priv_dev->dev, "match endpoint: %s\n", priv_ep->name);
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +	priv_ep->endpoint.desc = desc;
> +	priv_ep->dir  = usb_endpoint_dir_in(desc) ? USB_DIR_IN : USB_DIR_OUT;
> +	priv_ep->type = usb_endpoint_type(desc);
> +
> +	list_add_tail(&priv_ep->ep_match_pending_list,
> +		      &priv_dev->ep_match_list);
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return &priv_ep->endpoint;
> +}

Why do you need a custom match_ep?
doesn't usb_ep_autoconfig suffice?

You can check if EP is claimed or not by checking the ep->claimed flag.

> +
> +/**
> + * cdns3_gadget_get_frame Returns number of actual ITP frame
> + * @gadget: gadget object
> + *
> + * Returns number of actual ITP frame
> + */
> +static int cdns3_gadget_get_frame(struct usb_gadget *gadget)
> +{
> +	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
> +
> +	return readl(&priv_dev->regs->usb_iptn);
> +}
> +
> +static int cdns3_gadget_wakeup(struct usb_gadget *gadget)
> +{
> +	return 0;
> +}
> +
> +static int cdns3_gadget_set_selfpowered(struct usb_gadget *gadget,
> +					int is_selfpowered)
> +{
> +	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +	gadget->is_selfpowered = !!is_selfpowered;
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return 0;
> +}
> +
> +static int cdns3_gadget_pullup(struct usb_gadget *gadget, int is_on)
> +{
> +	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
> +
> +	if (!priv_dev->start_gadget)
> +		return 0;
> +
> +	if (is_on)
> +		writel(USB_CONF_DEVEN, &priv_dev->regs->usb_conf);
> +	else
> +		writel(USB_CONF_DEVDS, &priv_dev->regs->usb_conf);
> +
> +	return 0;
> +}
> +
>  static void cdns3_gadget_config(struct cdns3_device *priv_dev)
>  {
>  	struct cdns3_usb_regs __iomem *regs = priv_dev->regs;
> @@ -74,6 +231,95 @@ static void cdns3_gadget_config(struct cdns3_device *priv_dev)
>  	writel(USB_CONF_DEVEN, &regs->usb_conf);
>  }
>  
> +/**
> + * cdns3_gadget_udc_start Gadget start
> + * @gadget: gadget object
> + * @driver: driver which operates on this gadget
> + *
> + * Returns 0 on success, error code elsewhere
> + */
> +static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
> +				  struct usb_gadget_driver *driver)
> +{
> +	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
> +	unsigned long flags;
> +
> +	if (priv_dev->gadget_driver) {
> +		dev_err(&priv_dev->dev, "%s is already bound to %s\n",
> +			priv_dev->gadget.name,
> +			priv_dev->gadget_driver->driver.name);
> +		return -EBUSY;
> +	}

Not sure if this check is required. UDC core should be doing that.

> +
> +	spin_lock_irqsave(&priv_dev->lock, flags);
> +	priv_dev->gadget_driver = driver;
> +	if (!priv_dev->start_gadget)
> +		goto unlock;
> +
> +	cdns3_gadget_config(priv_dev);
> +unlock:
> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
> +	return 0;
> +}
> +
> +/**
> + * cdns3_gadget_udc_stop Stops gadget
> + * @gadget: gadget object
> + *
> + * Returns 0
> + */
> +static int cdns3_gadget_udc_stop(struct usb_gadget *gadget)
> +{
> +	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
> +	struct cdns3_endpoint *priv_ep, *temp_ep;
> +	u32 bEndpointAddress;
> +	struct usb_ep *ep;
> +	int ret = 0;
> +	int i;
> +
> +	priv_dev->gadget_driver = NULL;
> +	list_for_each_entry_safe(priv_ep, temp_ep, &priv_dev->ep_match_list,
> +				 ep_match_pending_list) {
> +		list_del(&priv_ep->ep_match_pending_list);
> +		priv_ep->flags &= ~EP_USED;
> +	}
> +
> +	priv_dev->onchip_mem_allocated_size = 0;
> +	priv_dev->out_mem_is_allocated = 0;
> +	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
> +
> +	for (i = 0; i < priv_dev->ep_nums ; i++)
> +		cdns3_free_trb_pool(priv_dev->eps[i]);
> +
> +	if (!priv_dev->start_gadget)
> +		return 0;

This looks tricky. Why do we need this flag?

> +
> +	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
> +		priv_ep = ep_to_cdns3_ep(ep);
> +		bEndpointAddress = priv_ep->num | priv_ep->dir;
> +		cdns3_select_ep(priv_dev, bEndpointAddress);
> +		writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
> +		ret = cdns3_handshake(&priv_dev->regs->ep_cmd,
> +				      EP_CMD_EPRST, 0, 100);
> +	}
> +
> +	/* disable interrupt for device */
> +	writel(0, &priv_dev->regs->usb_ien);
> +	writel(USB_CONF_DEVDS, &priv_dev->regs->usb_conf);

where are you requesting the interrupt? Looks like it should be done in
udc_start() no?

> +
> +	return ret;
> +}

Can we combine cdns3_gadget_udc_start() and cdns3_gadget_udc_start()
with cdns3_gadget_start() and cdns3_gadget_stop() respectively so that
cdns3_gadget_config() and cleanup() is done at one place.

> +
> +static const struct usb_gadget_ops cdns3_gadget_ops = {
> +	.get_frame = cdns3_gadget_get_frame,
> +	.wakeup = cdns3_gadget_wakeup,
> +	.set_selfpowered = cdns3_gadget_set_selfpowered,
> +	.pullup = cdns3_gadget_pullup,
> +	.udc_start = cdns3_gadget_udc_start,
> +	.udc_stop = cdns3_gadget_udc_stop,
> +	.match_ep = cdns3_gadget_match_ep,
> +};
> +
>  /**
>   * cdns3_init_ep Initializes software endpoints of gadget
>   * @cdns3: extended gadget object
> @@ -184,8 +430,7 @@ static int __cdns3_gadget_init(struct cdns3 *cdns)
>  	/* fill gadget fields */
>  	priv_dev->gadget.max_speed = USB_SPEED_SUPER;
>  	priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
> -	//TODO: Add implementation of cdns3_gadget_ops
> -	//priv_dev->gadget.ops = &cdns3_gadget_ops;
> +	priv_dev->gadget.ops = &cdns3_gadget_ops;
>  	priv_dev->gadget.name = "usb-ss-gadget";
>  	priv_dev->gadget.sg_supported = 1;
>  	priv_dev->is_connected = 0;
> 

cheers,
-roger

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
