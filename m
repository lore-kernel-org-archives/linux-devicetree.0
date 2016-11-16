From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/4] DW DMAC: add is-memcpu property to device tree
Date: Wed, 16 Nov 2016 17:12:32 +0200
Message-ID: <1479309152.24056.45.camel@linux.intel.com>
References: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
         <1479304615-11360-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479304615-11360-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, vireshk@kernel.org, dan.j.williams@intel.com, vinod.koul@intel.com, dmaengine@vger.kernel.org, linux-snps-arc@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2016-11-16 at 16:56 +0300, Eugeniy Paltsev wrote:
> Memory-to-memory dma transfers were disabled by default if we
> used DT to cofigure DMAC.
> Add is-memcpu property, so it became possible to enable
> memory-to-memory transfers support via DT.

Fix "memcpu" to "memcpy" everywhere you use it.

> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  drivers/dma/dw/platform.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
> index 4103f1d..daeceac 100644
> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -131,6 +131,9 @@ dw_dma_parse_dt(struct platform_device *pdev)
>  	else if (of_property_read_bool(np, "is-private"))
>  		pdata->is_private = true;
>  
> +	if (of_property_read_bool(np, "is-memcpu"))
> +		pdata->is_memcpy = true;
> +
>  	if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
>  		pdata->chan_allocation_order = (unsigned char)tmp;
>  

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
