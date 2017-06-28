From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH 4/8] usb: bdc: Small code cleanup
Date: Wed, 28 Jun 2017 08:47:34 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6DD002C93C@AcuExch.aculab.com>
References: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
 <1498587806-24781-5-git-send-email-alcooperx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498587806-24781-5-git-send-email-alcooperx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Al Cooper' <alcooperx@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Al Cooper
> Sent: 27 June 2017 19:23
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> ---
>  drivers/usb/gadget/udc/bdc/bdc_core.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> index 3bd82d2..621328f 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> @@ -488,28 +488,29 @@ static int bdc_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, bdc);
>  	bdc->irq = irq;
>  	bdc->dev = dev;
> -	dev_dbg(bdc->dev, "bdc->regs: %p irq=%d\n", bdc->regs, bdc->irq);
> +	dev_dbg(dev, "bdc->regs: %p irq=%d\n", bdc->regs, bdc->irq);

The compiler will use the value without re-reading it.
In the other places it makes very little difference.
The changed code might require one less memory read, but if the extra
'live' local variable causes gcc to save registers to stack all
bets are off.

The more explicit bdc->dev is probably more readable.

> 
>  	temp = bdc_readl(bdc->regs, BDC_BDCSC);
>  	if ((temp & BDC_P64) &&
>  			!dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64))) {
> -		dev_dbg(bdc->dev, "Using 64-bit address\n");
> +		dev_dbg(dev, "Using 64-bit address\n");
>  	} else {
> -		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));

That just wrong...
Or was wrong before.

...

	David
