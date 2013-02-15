From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/5] dmaengine: dw_dmac: move to generic DMA binding
Date: Fri, 15 Feb 2013 10:50:22 +0200
Message-ID: <1360918222.28241.20.camel@smile>
References: <1359395857-1235-1-git-send-email-arnd@arndb.de>
 <1359410300-26113-1-git-send-email-arnd@arndb.de>
 <1359410300-26113-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359410300-26113-2-git-send-email-arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2013-01-28 at 21:58 +0000, Arnd Bergmann wrote: 
> The original device tree binding for this driver, from Viresh Kumar
> unfortunately conflicted with the generic DMA binding, and did not allow
> to completely seperate slave device configuration from the controller.
> 
> This is an attempt to replace it with an implementation of the generic
> binding, but it is currently completely untested, because I do not have
> any hardware with this particular controller.
> 
> The patch applies on top of linux-next, which contains both the base
> support for the generic DMA binding, as well as the earlier attempt from
> Viresh. Both of these are currently not merged upstream however.
> 
> There are a couple of TODO items that are left remaining and are open
> for ideas from other people.

Have one question and one comment.

So, what is the status of this work? Do you manage to provide something
for v3.9? (Oh, two questions :-) )

> --- a/drivers/dma/dw_dmac.c
> +++ b/drivers/dma/dw_dmac.c

> @@ -1765,7 +1753,11 @@ static int dw_probe(struct platform_device *pdev)
>  
>  	dma_async_device_register(&dw->dma);
>  
> -	return 0;
> +	err = of_dma_controller_register(pdev->dev.of_node, dw_dma_xlate, dw);
> +	if (err)
> +		dma_async_device_unregister(&dw->dma);

I don't think this is a good idea. The impossibility to register in the
of-dma helper is not critical. Just printing debug message is enough.


-- 
Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Intel Finland Oy
