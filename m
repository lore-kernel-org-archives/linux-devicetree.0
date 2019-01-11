From: Min Guo <min.guo@mediatek.com>
Subject: Re: [PATCH 4/4] usb: musb: Add support for MediaTek musb controller
Date: Fri, 11 Jan 2019 13:24:37 +0800
Message-ID: <1547184277.4433.164.camel@mhfsdcap03>
References: <1545896066-897-1-git-send-email-min.guo@mediatek.com>
         <1545896066-897-5-git-send-email-min.guo@mediatek.com>
         <20190108154441.GG25910@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190108154441.GG25910@uda0271908>
Sender: linux-kernel-owner@vger.kernel.org
To: Bin Liu <b-liu@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Yonglong Wu <yonglong.wu@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi Bin,

I have some questions about
musbhs_dma_controller_destroy/create_noirq().
1,Because of controller->irq=0 in noirq case, destroy_noirq can reuse
musbhs_dma_controller_destroy. Is it necessary to write a destroy_noirq
function?
2, How about creating a common function for create musb dma controller
as following:
static struct musb_dma_controller *dma_controller_alloc(struct musb
*musb, void __iomem *base)
then musbhs_dma_controller_create() and
musbhs_dma_controller_create_noirq() call it to alloc common resource.


On Tue, 2019-01-08 at 09:44 -0600, Bin Liu wrote:
> Hi,
> 
> On Thu, Dec 27, 2018 at 03:34:26PM +0800, min.guo@mediatek.com wrote:
> > From: Min Guo <min.guo@mediatek.com>
> > 
> > This adds support for MediaTek musb controller in
> > host, peripheral and otg mode
> > 

> > diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
> > index 824adcb..c545475 100644
> > --- a/drivers/usb/musb/musbhsdma.c
> > +++ b/drivers/usb/musb/musbhsdma.c

> >  
> >  void musbhs_dma_controller_destroy(struct dma_controller *c)
> >  {
> >  	struct musb_dma_controller *controller = container_of(c,
> >  			struct musb_dma_controller, controller);
> > +	struct musb *musb = controller->private_data;
> >  
> >  	dma_controller_stop(controller);
> >  
> > -	if (controller->irq)
> > +	if (!(musb->ops->quirks & MUSB_MTK_QUIRKS) && controller->irq)
> >  		free_irq(controller->irq, c);
> >  
> >  	kfree(controller);
> > @@ -398,11 +402,15 @@ struct dma_controller *musbhs_dma_controller_create(struct musb *musb,
> >  	struct musb_dma_controller *controller;
> >  	struct device *dev = musb->controller;
> >  	struct platform_device *pdev = to_platform_device(dev);
> > -	int irq = platform_get_irq_byname(pdev, "dma");
> > +	int irq = -1;
> >  
> > -	if (irq <= 0) {
> > -		dev_err(dev, "No DMA interrupt line!\n");
> > -		return NULL;
> > +	if (!(musb->ops->quirks & MUSB_MTK_QUIRKS)) {
> > +		irq = platform_get_irq_byname(pdev, "dma");
> > +
> > +		if (irq < 0) {
> > +			dev_err(dev, "No DMA interrupt line!\n");
> > +			return NULL;
> > +		}
> >  	}
> 
> Please create musbhs_dma_controller_destroy_noirq() for your platform to
> not use the quirk.
> 
> >  
> >  	controller = kzalloc(sizeof(*controller), GFP_KERNEL);
> > @@ -418,15 +426,17 @@ struct dma_controller *musbhs_dma_controller_create(struct musb *musb,
> >  	controller->controller.channel_program = dma_channel_program;
> >  	controller->controller.channel_abort = dma_channel_abort;
> >  
> > -	if (request_irq(irq, dma_controller_irq, 0,
> > +	if (!(musb->ops->quirks & MUSB_MTK_QUIRKS)) {
> > +		if (request_irq(irq, dma_controller_irq, 0,
> >  			dev_name(musb->controller), &controller->controller)) {
> > -		dev_err(dev, "request_irq %d failed!\n", irq);
> > -		musb_dma_controller_destroy(&controller->controller);
> > +			dev_err(dev, "request_irq %d failed!\n", irq);
> > +			musb_dma_controller_destroy(&controller->controller);
> >  
> > -		return NULL;
> > -	}
> > +			return NULL;
> > +		}
> >  
> > -	controller->irq = irq;
> > +		controller->irq = irq;
> > +	}
> >  
> >  	return &controller->controller;
> >  }
> 
> Same here, create musbhs_dma_controller_create_noirq(). Then use both
> new API for the mtk glue driver.



> Regards,
> -Bin.
