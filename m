From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 05/18] dmaengine: st_fdma: Add STMicroelectronics FDMA
 engine driver support
Date: Thu, 1 Sep 2016 11:06:19 +0100
Message-ID: <20160901100619.GA8268@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1472223413-7254-1-git-send-email-peter.griffin@linaro.org>
 <1472223413-7254-6-git-send-email-peter.griffin@linaro.org>
 <20160830163019.GM9355@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160830163019.GM9355@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vinod,

Thanks for reviewing.

On Tue, 30 Aug 2016, Vinod Koul wrote:

> On Fri, Aug 26, 2016 at 03:56:40PM +0100, Peter Griffin wrote:
> 
> >  config STM32_DMA
> >  	bool "STMicroelectronics STM32 DMA support"
> >  	depends on ARCH_STM32
> > @@ -567,7 +580,6 @@ config ZX_DMA
> >  	help
> >  	  Support the DMA engine for ZTE ZX296702 platform devices.
> >  
> > -
> 
> unrelated change?

OK will remove and send a separate patch.
> 
> > +	fdev->chans = devm_kzalloc(&pdev->dev,
> > +				   fdev->nr_channels
> > +				   * sizeof(struct st_fdma_chan), GFP_KERNEL);
> 
> devm_kcalloc()

Will fix in next version.

> 
> > +	if (!fdev->chans)
> > +		return -ENOMEM;
> > +
> > +	fdev->dev = &pdev->dev;
> > +	fdev->drvdata = drvdata;
> > +	platform_set_drvdata(pdev, fdev);
> > +
> > +	fdev->irq = platform_get_irq(pdev, 0);
> > +	if (fdev->irq < 0) {
> > +		dev_err(&pdev->dev, "Failed to get irq resource\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = devm_request_irq(&pdev->dev, fdev->irq, st_fdma_irq_handler, 0,
> > +			       dev_name(&pdev->dev), fdev);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to request irq (%d)\n", ret);
> > +		goto err;
> > +	}
> > +
> > +	fdev->slim_rproc = st_slim_rproc_alloc(pdev, fdev->fw_name);
> > +	if (!fdev->slim_rproc) {
> > +		ret = PTR_ERR(fdev->slim_rproc);
> > +		dev_err(&pdev->dev, "slim_rproc_alloc failed (%d)\n", ret);
> > +		goto err;
> > +	}
> > +
> > +	/* Initialise list of FDMA channels */
> > +	INIT_LIST_HEAD(&fdev->dma_device.channels);
> > +	for (i = 0; i < fdev->nr_channels; i++) {
> > +		struct st_fdma_chan *fchan = &fdev->chans[i];
> > +
> > +		fchan->fdev = fdev;
> > +		fchan->vchan.desc_free = st_fdma_free_desc;
> > +		vchan_init(&fchan->vchan, &fdev->dma_device);
> 
> this initialized a tasklet
> 
> > +static int st_fdma_remove(struct platform_device *pdev)
> > +{
> > +	struct st_fdma_dev *fdev = platform_get_drvdata(pdev);
> > +
> > +	devm_free_irq(&pdev->dev, fdev->irq, fdev);
> > +	st_slim_rproc_put(fdev->slim_rproc);
> > +	of_dma_controller_free(pdev->dev.of_node);
> > +	dma_async_device_unregister(&fdev->dma_device);
> 
> and that vchan tasklet is not quisced here :(

Eeek, good spot. Will fix in next version.

> 
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("STMicroelectronics FDMA engine driver");
> > +MODULE_AUTHOR("Ludovic.barre <Ludovic.barre-qxv4g6HH51o@public.gmane.org>");
> > +MODULE_AUTHOR("Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>");
> 
> No MODULE_ALIAS?

Will add in next version.

regards,

Peter. 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
