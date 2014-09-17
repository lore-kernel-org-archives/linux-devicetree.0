From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] of: amba: use of_dma_configure for AMBA devices
Date: Wed, 17 Sep 2014 18:03:38 +0100
Message-ID: <20140917170338.GC18532@arm.com>
References: <90bd1ff3c93b827c12e1b3dc9ad3f227632d0f6e.1410954967.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <90bd1ff3c93b827c12e1b3dc9ad3f227632d0f6e.1410954967.git.robin.murphy@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Robin Murphy <Robin.Murphy@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, arm@kernel.org, Catalin Marinas <Catalin.Marinas@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 17, 2014 at 12:56:07PM +0100, Robin Murphy wrote:
> Commit 591c1e ("of: configure the platform device dma parameters)
> introduced a common mechanism to configure DMA from DT properties.
> AMBA devices created from DT can take advantage of this, too.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

  Acked-by: Will Deacon <will.deacon@arm.com>

It would be great if the arm-soc guys can pick this up.

Will

> ---
>  drivers/of/platform.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 0197725..3b64d0b 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -160,11 +160,10 @@ EXPORT_SYMBOL(of_device_alloc);
>   * can use Platform bus notifier and handle BUS_NOTIFY_ADD_DEVICE event
>   * to fix up DMA configuration.
>   */
> -static void of_dma_configure(struct platform_device *pdev)
> +static void of_dma_configure(struct device *dev)
>  {
>  	u64 dma_addr, paddr, size;
>  	int ret;
> -	struct device *dev = &pdev->dev;
>  
>  	/*
>  	 * Set default dma-mask to 32 bit. Drivers are expected to setup
> @@ -229,7 +228,7 @@ static struct platform_device *of_platform_device_create_pdata(
>  	if (!dev)
>  		goto err_clear_flag;
>  
> -	of_dma_configure(dev);
> +	of_dma_configure(&dev->dev);
>  	dev->dev.bus = &platform_bus_type;
>  	dev->dev.platform_data = platform_data;
>  
> @@ -291,7 +290,6 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>  	}
>  
>  	/* setup generic device info */
> -	dev->dev.coherent_dma_mask = ~0;
>  	dev->dev.of_node = of_node_get(node);
>  	dev->dev.parent = parent;
>  	dev->dev.platform_data = platform_data;
> @@ -299,6 +297,7 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
>  		dev_set_name(&dev->dev, "%s", bus_id);
>  	else
>  		of_device_make_bus_id(&dev->dev);
> +	of_dma_configure(&dev->dev);
>  
>  	/* Allow the HW Peripheral ID to be overridden */
>  	prop = of_get_property(node, "arm,primecell-periphid", NULL);
> -- 
> 1.9.1
> 
