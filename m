From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH] dma: at_xdmac: creation of the atmel eXtended DMA Controller driver
Date: Tue, 10 Jun 2014 21:15:14 +0200
Message-ID: <6544148.4RKn2Y8vCE@wuerfel>
References: <1401179736-8235-1-git-send-email-ludovic.desroches@atmel.com> <20140610154118.GA4254@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140610154118.GA4254@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 27, 2014 at 10:35:36AM +0200, Ludovic Desroches wrote:
> +static struct dma_chan *at_xdmac_xlate(struct of_phandle_args *dma_spec,
> +                                    struct of_dma *of_dma)
> +{
> +     struct at_xdmac_chan    *atchan;
> +     struct dma_chan         *chan;
> +     dma_cap_mask_t          mask;
> +     struct platform_device  *pdev = of_find_device_by_node(dma_spec->np);

No need to search through all the device nodes, you can look up the
device from of_dma->of_dma_data.

> +     if (dma_spec->args_count != 2) {
> +             dev_err(&pdev->dev, "dma phandler args: bad number of args\n");
> +             return NULL;
> +     }
> +
> +     dma_cap_zero(mask);
> +     dma_cap_set(DMA_SLAVE, mask);
> +     chan = dma_request_channel(mask, NULL, NULL);
> +     if (!chan) {
> +             dev_err(&pdev->dev, "can't get a dma channel\n");
> +             return NULL;
> +     }

You must use dma_get_any_slave_channel. dma_request_channel gives you a
channel from a random dma engine that is present in the system, not
necessarily the one you are managing here.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
