From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/18] dmaengine: st_fdma: Add STMicroelectronics FDMA
 engine driver support
Date: Mon, 2 May 2016 15:00:15 +0530
Message-ID: <20160502093015.GD2274@localhost>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-4-git-send-email-peter.griffin@linaro.org>
 <20160426165622.GR2274@localhost>
 <20160427125923.GA12756@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160427125923.GA12756@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 27, 2016 at 01:59:23PM +0100, Peter Griffin wrote:
> > bunch of this seems similar to cyclic case, can you create common setup
> > routine for these, anyway cyclic is a special cases of slave_sg
> 
> In v4 I've made a st_fdma_prep_common() which abstracts out all the common
> checks at the beginning of the *_prep*() functions.
> 
> In v3 fill_fw_node() is already (from one of your previous reviews)
> abstracting out all the common parts from these loops. So everything
> that is now left is actually differences between the two setups.
> 
> Is that Ok?

Sounds better

> > and you irq is still enabled and tasklets can be scheduled!!
> > 
> Eeek! Very good point. Also looking at some other drivers we
> should be doing a of_dma_controller_free() and
> dma_async_device_unregister().
> 
> So something like this: -
> 
>   st_fdma_disable(); /*disables irqs*/
>   of_dma_controller_free(pdev->dev.of_node);
>   dma_async_device_unregister(&priv->slave);
>   st_fdma_clk_disable(fdev);

you can call devm_free_irq() explictyly, that will syncronize irq and
free it up. Also you should kill the tasklet afterwards.

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
