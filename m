From: Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH 4/4] usb: musb: Add support for MediaTek musb controller
Date: Tue, 8 Jan 2019 09:44:41 -0600
Message-ID: <20190108154441.GG25910@uda0271908>
References: <1545896066-897-1-git-send-email-min.guo@mediatek.com>
 <1545896066-897-5-git-send-email-min.guo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1545896066-897-5-git-send-email-min.guo@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: min.guo@mediatek.com
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Yonglong Wu <yonglong.wu@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Dec 27, 2018 at 03:34:26PM +0800, min.guo@mediatek.com wrote:
> From: Min Guo <min.guo@mediatek.com>
> 
> This adds support for MediaTek musb controller in
> host, peripheral and otg mode
> 
> Signed-off-by: Min Guo <min.guo@mediatek.com>
> Signed-off-by: Yonglong Wu <yonglong.wu@mediatek.com>
> ---
>  drivers/usb/musb/Kconfig     |   8 +-
>  drivers/usb/musb/Makefile    |   1 +
>  drivers/usb/musb/mediatek.c  | 562 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/musb/musb_core.c |  10 +
>  drivers/usb/musb/musb_core.h |   1 +
>  drivers/usb/musb/musb_dma.h  |   1 +
>  drivers/usb/musb/musb_host.c |  79 ++++--
>  drivers/usb/musb/musb_regs.h |   6 +
>  drivers/usb/musb/musbhsdma.c |  34 ++-
>  9 files changed, 671 insertions(+), 31 deletions(-)
>  create mode 100644 drivers/usb/musb/mediatek.c
> 
> diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
> index ad08895..540fc9f 100644
> --- a/drivers/usb/musb/Kconfig
> +++ b/drivers/usb/musb/Kconfig
> @@ -115,6 +115,12 @@ config USB_MUSB_JZ4740
>  	depends on USB_MUSB_GADGET
>  	depends on USB_OTG_BLACKLIST_HUB
>  
> +config USB_MUSB_MEDIATEK
> +	tristate "MediaTek platforms"
> +	depends on ARCH_MEDIATEK

Please also add '|| COMPILE_TEST' to make testing easier.

> +	depends on NOP_USB_XCEIV
> +	depends on GENERIC_PHY
> +
>  config USB_MUSB_AM335X_CHILD
>  	tristate
>  
> @@ -141,7 +147,7 @@ config USB_UX500_DMA
>  
>  config USB_INVENTRA_DMA
>  	bool 'Inventra'
> -	depends on USB_MUSB_OMAP2PLUS
> +	depends on USB_MUSB_OMAP2PLUS || USB_MUSB_MEDIATEK
>  	help
>  	  Enable DMA transfers using Mentor's engine.
>  
> diff --git a/drivers/usb/musb/Makefile b/drivers/usb/musb/Makefile
> index 3a88c79..63d82d0 100644
> --- a/drivers/usb/musb/Makefile
> +++ b/drivers/usb/musb/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_USB_MUSB_DA8XX)			+= da8xx.o
>  obj-$(CONFIG_USB_MUSB_UX500)			+= ux500.o
>  obj-$(CONFIG_USB_MUSB_JZ4740)			+= jz4740.o
>  obj-$(CONFIG_USB_MUSB_SUNXI)			+= sunxi.o
> +obj-$(CONFIG_USB_MUSB_MEDIATEK)      		+= mediatek.o
>  
>  
>  obj-$(CONFIG_USB_MUSB_AM335X_CHILD)		+= musb_am335x.o
> diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
> new file mode 100644
> index 0000000..15a6460
> --- /dev/null
> +++ b/drivers/usb/musb/mediatek.c

[snip]
I will review this section later after we sorted out other things.

> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index b7d5627..d60f76f 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -1028,6 +1028,16 @@ static void musb_disable_interrupts(struct musb *musb)
>  	temp = musb_readb(mbase, MUSB_INTRUSB);
>  	temp = musb_readw(mbase, MUSB_INTRTX);
>  	temp = musb_readw(mbase, MUSB_INTRRX);
> +
> +	/*  MediaTek controller interrupt status is W1C */

This W1C doesn't match to the MUSB Programming Guide that I have. Those
registers are read-only.
Is the difference due to the IP intergration in the mtk platforms? or is
it a new version of the MUSB controller? If latter, what is the version?

> +	if (musb->ops->quirks & MUSB_MTK_QUIRKS) {

Basically we don't want to use this type of platform specific quirks if
possible, so let's try to not use it.

> +		musb_writeb(mbase, MUSB_INTRUSB,
> +			musb_readb(mbase, MUSB_INTRUSB));

For this clearing register bit operation, please create platform hooks
musb_clearb() and musb_clearw() in struct musb_platform_ops instead,
then follow how musb_readb() pointer is assigned in
musb_init_controller() to use the W1C version for mtk platform.

> +		musb_writew(mbase, MUSB_INTRRX,
> +			musb_readw(mbase, MUSB_INTRRX));
> +		musb_writew(mbase, MUSB_INTRTX,
> +			musb_readw(mbase, MUSB_INTRTX));
> +	}
>  }
>  
>  static void musb_enable_interrupts(struct musb *musb)
> diff --git a/drivers/usb/musb/musb_core.h b/drivers/usb/musb/musb_core.h
> index 04203b7..1bf4e9a 100644
> --- a/drivers/usb/musb/musb_core.h
> +++ b/drivers/usb/musb/musb_core.h
> @@ -138,6 +138,7 @@ enum musb_g_ep0_state {
>   */
>  struct musb_platform_ops {
>  
> +#define MUSB_MTK_QUIRKS	BIT(10)
>  #define MUSB_G_NO_SKB_RESERVE	BIT(9)
>  #define MUSB_DA8XX		BIT(8)
>  #define MUSB_PRESERVE_SESSION	BIT(7)
> diff --git a/drivers/usb/musb/musb_dma.h b/drivers/usb/musb/musb_dma.h
> index 281e75d3..b218210 100644
> --- a/drivers/usb/musb/musb_dma.h
> +++ b/drivers/usb/musb/musb_dma.h
> @@ -197,6 +197,7 @@ static inline void musb_dma_controller_destroy(struct dma_controller *d) { }
>  extern struct dma_controller *
>  musbhs_dma_controller_create(struct musb *musb, void __iomem *base);
>  extern void musbhs_dma_controller_destroy(struct dma_controller *c);
> +extern irqreturn_t dma_controller_irq(int irq, void *private_data);
>  
>  extern struct dma_controller *
>  tusb_dma_controller_create(struct musb *musb, void __iomem *base);
> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> index b59ce9a..b1b0216 100644
> --- a/drivers/usb/musb/musb_host.c
> +++ b/drivers/usb/musb/musb_host.c
> @@ -292,20 +292,73 @@ static inline void musb_save_toggle(struct musb_qh *qh, int is_in,
>  {
>  	void __iomem		*epio = qh->hw_ep->regs;
>  	u16			csr;
> +	struct musb *musb = qh->hw_ep->musb;
>  
>  	/*
>  	 * FIXME: the current Mentor DMA code seems to have
>  	 * problems getting toggle correct.
>  	 */
>  
> -	if (is_in)
> -		csr = musb_readw(epio, MUSB_RXCSR) & MUSB_RXCSR_H_DATATOGGLE;
> -	else
> -		csr = musb_readw(epio, MUSB_TXCSR) & MUSB_TXCSR_H_DATATOGGLE;
> +	/* MediaTek controller has private toggle register */

only one toggle register for all endpoints? how does it handle
difference toggle values for different endpoints?

> +	if (musb->ops->quirks & MUSB_MTK_QUIRKS) {
> +		u16 toggle;
> +		u8 epnum = qh->hw_ep->epnum;
> +
> +		if (is_in)
> +			toggle = musb_readl(musb->mregs, MUSB_RXTOG);

should use musb_readw() instead? MUSB_RXTOG seems to be 16bit.

> +		else
> +			toggle = musb_readl(musb->mregs, MUSB_TXTOG);
> +
> +		csr = toggle & (1 << epnum);
> +	} else {
> +		if (is_in)
> +			csr = musb_readw(epio, MUSB_RXCSR)
> +				& MUSB_RXCSR_H_DATATOGGLE;
> +		else
> +			csr = musb_readw(epio, MUSB_TXCSR)
> +				& MUSB_TXCSR_H_DATATOGGLE;

Does this logic still work for the mtk platform even if it has its own
private toggle register? If so, we don't need to change here.

If not, let's try to not use this quirk flag. Please create a hook
musb_platform_get_toggle() in struct musb_platform_ops.

> +	}
>  
>  	usb_settoggle(urb->dev, qh->epnum, !is_in, csr ? 1 : 0);
>  }
>  
> +static inline u16 musb_set_toggle(struct musb_qh *qh, int is_in,
> +					struct urb *urb)
> +{
> +	u16 csr = 0;
> +	u16 toggle = 0;
> +	struct musb *musb = qh->hw_ep->musb;
> +	u8 epnum = qh->hw_ep->epnum;
> +
> +	toggle = usb_gettoggle(urb->dev, qh->epnum, !is_in);
> +
> +	/* MediaTek controller has private toggle register */
> +	if (musb->ops->quirks & MUSB_MTK_QUIRKS) {
> +		if (is_in) {
> +			musb_writel(musb->mregs, MUSB_RXTOGEN, (1 << epnum));
> +			musb_writel(musb->mregs, MUSB_RXTOG, (toggle << epnum));
> +		} else {
> +			musb_writel(musb->mregs, MUSB_TXTOGEN, (1 << epnum));
> +			musb_writel(musb->mregs, MUSB_TXTOG, (toggle << epnum));
> +		}
> +	} else {
> +		if (is_in) {
> +			if (toggle)
> +				csr = MUSB_RXCSR_H_WR_DATATOGGLE
> +						| MUSB_RXCSR_H_DATATOGGLE;
> +			else
> +				csr = 0;
> +		} else {
> +			if (toggle)
> +				csr |= MUSB_TXCSR_H_WR_DATATOGGLE
> +						| MUSB_TXCSR_H_DATATOGGLE;
> +			else
> +				csr |= MUSB_TXCSR_CLRDATATOG;
> +		}
> +	}
> +	return csr;

Please create a seperate patch for this musb_set_toggle() without adding
the mtk logic. It is a nice cleanup.

> +}
> +
>  /*
>   * Advance this hardware endpoint's queue, completing the specified URB and
>   * advancing to either the next URB queued to that qh, or else invalidating
> @@ -772,13 +825,8 @@ static void musb_ep_program(struct musb *musb, u8 epnum,
>  					);
>  			csr |= MUSB_TXCSR_MODE;
>  
> -			if (!hw_ep->tx_double_buffered) {
> -				if (usb_gettoggle(urb->dev, qh->epnum, 1))
> -					csr |= MUSB_TXCSR_H_WR_DATATOGGLE
> -						| MUSB_TXCSR_H_DATATOGGLE;
> -				else
> -					csr |= MUSB_TXCSR_CLRDATATOG;
> -			}
> +			if (!hw_ep->tx_double_buffered)
> +				csr |= musb_set_toggle(qh, !is_out, urb);
>  
>  			musb_writew(epio, MUSB_TXCSR, csr);
>  			/* REVISIT may need to clear FLUSHFIFO ... */
> @@ -860,17 +908,12 @@ static void musb_ep_program(struct musb *musb, u8 epnum,
>  
>  	/* IN/receive */
>  	} else {
> -		u16	csr;
> +		u16	csr = 0;
>  
>  		if (hw_ep->rx_reinit) {
>  			musb_rx_reinit(musb, qh, epnum);
> +			csr |= musb_set_toggle(qh, !is_out, urb);
>  
> -			/* init new state: toggle and NYET, maybe DMA later */
> -			if (usb_gettoggle(urb->dev, qh->epnum, 0))
> -				csr = MUSB_RXCSR_H_WR_DATATOGGLE
> -					| MUSB_RXCSR_H_DATATOGGLE;
> -			else
> -				csr = 0;
>  			if (qh->type == USB_ENDPOINT_XFER_INT)
>  				csr |= MUSB_RXCSR_DISNYET;
>  
> diff --git a/drivers/usb/musb/musb_regs.h b/drivers/usb/musb/musb_regs.h
> index 5cd7264..ffbe267 100644
> --- a/drivers/usb/musb/musb_regs.h
> +++ b/drivers/usb/musb/musb_regs.h
> @@ -273,6 +273,12 @@
>  #define MUSB_RXHUBADDR		0x06
>  #define MUSB_RXHUBPORT		0x07
>  
> +/* MediaTek controller toggle enable and status reg */
> +#define MUSB_RXTOG		0x80
> +#define MUSB_RXTOGEN		0x82
> +#define MUSB_TXTOG		0x84
> +#define MUSB_TXTOGEN		0x86

Again, these offsets are for different registers in the MUSB version I
have, please let me know if you have different version of the MUSB IP.

> +
>  static inline u8 musb_read_configdata(void __iomem *mbase)
>  {
>  	musb_writeb(mbase, MUSB_INDEX, 0);
> diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> index 824adcb..c545475 100644
> --- a/drivers/usb/musb/musbhsdma.c
> +++ b/drivers/usb/musb/musbhsdma.c
> @@ -263,7 +263,7 @@ static int dma_channel_abort(struct dma_channel *channel)
>  	return 0;
>  }
>  
> -static irqreturn_t dma_controller_irq(int irq, void *private_data)
> +irqreturn_t dma_controller_irq(int irq, void *private_data)
>  {
>  	struct musb_dma_controller *controller = private_data;
>  	struct musb *musb = controller->private_data;
> @@ -285,6 +285,8 @@ static irqreturn_t dma_controller_irq(int irq, void *private_data)
>  	spin_lock_irqsave(&musb->lock, flags);
>  
>  	int_hsdma = musb_readb(mbase, MUSB_HSDMA_INTR);
> +	if (musb->ops->quirks & MUSB_MTK_QUIRKS)
> +		musb_writeb(musb->mregs, MUSB_HSDMA_INTR, int_hsdma);

you can use musb_clearb() defined above to get rid of this quirk.

>  
>  	if (!int_hsdma) {
>  		musb_dbg(musb, "spurious DMA irq");
> @@ -377,15 +379,17 @@ static irqreturn_t dma_controller_irq(int irq, void *private_data)
>  	spin_unlock_irqrestore(&musb->lock, flags);
>  	return retval;
>  }
> +EXPORT_SYMBOL_GPL(dma_controller_irq);
>  
>  void musbhs_dma_controller_destroy(struct dma_controller *c)
>  {
>  	struct musb_dma_controller *controller = container_of(c,
>  			struct musb_dma_controller, controller);
> +	struct musb *musb = controller->private_data;
>  
>  	dma_controller_stop(controller);
>  
> -	if (controller->irq)
> +	if (!(musb->ops->quirks & MUSB_MTK_QUIRKS) && controller->irq)
>  		free_irq(controller->irq, c);
>  
>  	kfree(controller);
> @@ -398,11 +402,15 @@ struct dma_controller *musbhs_dma_controller_create(struct musb *musb,
>  	struct musb_dma_controller *controller;
>  	struct device *dev = musb->controller;
>  	struct platform_device *pdev = to_platform_device(dev);
> -	int irq = platform_get_irq_byname(pdev, "dma");
> +	int irq = -1;
>  
> -	if (irq <= 0) {
> -		dev_err(dev, "No DMA interrupt line!\n");
> -		return NULL;
> +	if (!(musb->ops->quirks & MUSB_MTK_QUIRKS)) {
> +		irq = platform_get_irq_byname(pdev, "dma");
> +
> +		if (irq < 0) {
> +			dev_err(dev, "No DMA interrupt line!\n");
> +			return NULL;
> +		}
>  	}

Please create musbhs_dma_controller_destroy_noirq() for your platform to
not use the quirk.

>  
>  	controller = kzalloc(sizeof(*controller), GFP_KERNEL);
> @@ -418,15 +426,17 @@ struct dma_controller *musbhs_dma_controller_create(struct musb *musb,
>  	controller->controller.channel_program = dma_channel_program;
>  	controller->controller.channel_abort = dma_channel_abort;
>  
> -	if (request_irq(irq, dma_controller_irq, 0,
> +	if (!(musb->ops->quirks & MUSB_MTK_QUIRKS)) {
> +		if (request_irq(irq, dma_controller_irq, 0,
>  			dev_name(musb->controller), &controller->controller)) {
> -		dev_err(dev, "request_irq %d failed!\n", irq);
> -		musb_dma_controller_destroy(&controller->controller);
> +			dev_err(dev, "request_irq %d failed!\n", irq);
> +			musb_dma_controller_destroy(&controller->controller);
>  
> -		return NULL;
> -	}
> +			return NULL;
> +		}
>  
> -	controller->irq = irq;
> +		controller->irq = irq;
> +	}
>  
>  	return &controller->controller;
>  }

Same here, create musbhs_dma_controller_create_noirq(). Then use both
new API for the mtk glue driver.

Regards,
-Bin.
