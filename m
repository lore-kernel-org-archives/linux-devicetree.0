From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] of: set dma_mask to point to coherent_dma_mask
Date: Sat, 02 Nov 2013 18:07:24 +0000
Message-ID: <20131102180724.D8FC5C40F02@trevor.secretlab.ca>
References: <1383109522-6879-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383109522-6879-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: stefano.stabellini@eu.citrix.com, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, 30 Oct 2013 00:05:22 -0500, Rob Herring <robherring2@gmail.com> wrote:
> From: Rob Herring <rob.herring@calxeda.com>
> 
> Platform devices created by DT code don't initialize dma_mask pointer to
> anything. Set it to coherent_dma_mask by default if the architecture
> code has not set it.
> 
> Signed-off-by: Rob Herring <rob.herring@calxeda.com>

I believe this is okay. I haven't done any testing to back up that
opinion though.

g.

> ---
> I think this is at least part of what is needed to fix dma_mask issue
> raised by Stefano [1]. Things should work AFAICT with just this, but
> I suppose the xgmac driver needs to set the mask as well (not relying
> on the default), but some pointing the dma_mask to a valid value is
> needed first.
> 
> Rob
> 
> [1] http://www.mail-archive.com/linux-kernel@vger.kernel.org/msg528236.html
> 
>  drivers/of/platform.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index f6dcde2..fce088e 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -215,6 +215,8 @@ static struct platform_device *of_platform_device_create_pdata(
>  	dev->archdata.dma_mask = 0xffffffffUL;
>  #endif
>  	dev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> +	if (!dev->dev.dma_mask)
> +		dev->dev.dma_mask = &dev->dev.coherent_dma_mask;
>  	dev->dev.bus = &platform_bus_type;
>  	dev->dev.platform_data = platform_data;
>  
> -- 
> 1.8.1.2
> 
