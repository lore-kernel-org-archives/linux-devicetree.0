From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dmaengine: Add STM32 MDMA driver (fwd)
Date: Sat, 8 Jul 2017 08:14:51 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1707080813400.1971@hadrien>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabrice GASNIER <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Fabien DESSENNE <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, Amelie Delaunay <amelie.delaunay-qxv4g6HH51o@public.gmane.org>, Pierre-Yves MORDRET <pierre-yves.mordret-qxv4g6HH51o@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Please check on the comparison on line 1489.

julia

---------- Forwarded message ----------
Date: Sat, 8 Jul 2017 10:13:09 +0800
From: kbuild test robot <fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
To: kbuild-JC7UmRfGjtg@public.gmane.org
Cc: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dmaengine: Add STM32 MDMA driver

Hi Pierre-Yves,

[auto build test WARNING on linus/master]
[also build test WARNING on v4.12 next-20170707]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Pierre-Yves-MORDRET/Add-STM32-MDMA-driver/20170708-013345
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago

>> drivers/dma/stm32-mdma.c:1489:5-16: WARNING: Unsigned expression compared with zero: dmadev -> irq < 0

git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout c6b3687d964d5a49aa0f297918bf26f6cb7444db
vim +1489 drivers/dma/stm32-mdma.c

c6b3687d Pierre-Yves MORDRET 2017-07-06  1473  		BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
c6b3687d Pierre-Yves MORDRET 2017-07-06  1474  	dd->directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV) |
c6b3687d Pierre-Yves MORDRET 2017-07-06  1475  		BIT(DMA_MEM_TO_MEM);
c6b3687d Pierre-Yves MORDRET 2017-07-06  1476  	dd->residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
c6b3687d Pierre-Yves MORDRET 2017-07-06  1477  	dd->max_burst = STM32_MDMA_MAX_BURST;
c6b3687d Pierre-Yves MORDRET 2017-07-06  1478  	dd->dev = &pdev->dev;
c6b3687d Pierre-Yves MORDRET 2017-07-06  1479  	INIT_LIST_HEAD(&dd->channels);
c6b3687d Pierre-Yves MORDRET 2017-07-06  1480
c6b3687d Pierre-Yves MORDRET 2017-07-06  1481  	for (i = 0; i < dmadev->nr_channels; i++) {
c6b3687d Pierre-Yves MORDRET 2017-07-06  1482  		chan = &dmadev->chan[i];
c6b3687d Pierre-Yves MORDRET 2017-07-06  1483  		chan->id = i;
c6b3687d Pierre-Yves MORDRET 2017-07-06  1484  		chan->vchan.desc_free = stm32_mdma_desc_free;
c6b3687d Pierre-Yves MORDRET 2017-07-06  1485  		vchan_init(&chan->vchan, dd);
c6b3687d Pierre-Yves MORDRET 2017-07-06  1486  	}
c6b3687d Pierre-Yves MORDRET 2017-07-06  1487
c6b3687d Pierre-Yves MORDRET 2017-07-06  1488  	dmadev->irq = platform_get_irq(pdev, 0);
c6b3687d Pierre-Yves MORDRET 2017-07-06 @1489  	if (dmadev->irq < 0) {
c6b3687d Pierre-Yves MORDRET 2017-07-06  1490  		dev_err(&pdev->dev, "failed to get IRQ\n");
c6b3687d Pierre-Yves MORDRET 2017-07-06  1491  		return dmadev->irq;
c6b3687d Pierre-Yves MORDRET 2017-07-06  1492  	}
c6b3687d Pierre-Yves MORDRET 2017-07-06  1493
c6b3687d Pierre-Yves MORDRET 2017-07-06  1494  	ret = devm_request_irq(&pdev->dev, dmadev->irq, stm32_mdma_irq_handler,
c6b3687d Pierre-Yves MORDRET 2017-07-06  1495  			       0, dev_name(&pdev->dev), dmadev);
c6b3687d Pierre-Yves MORDRET 2017-07-06  1496  	if (ret) {
c6b3687d Pierre-Yves MORDRET 2017-07-06  1497  		dev_err(&pdev->dev, "failed to request IRQ\n");

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
