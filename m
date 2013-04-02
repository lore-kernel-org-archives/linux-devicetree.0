From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dmaengine: mpc512x_dma: use generic DMA DT bindings
Date: Tue, 2 Apr 2013 23:52:15 +0530
Message-ID: <20130402182215.GO10326@intel.com>
References: <1364746680-6564-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1364746680-6564-1-git-send-email-agust-ynQEQJNshbs@public.gmane.org>
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
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Mar 31, 2013 at 06:17:59PM +0200, Anatolij Gustschin wrote:
> Add generic DMA bindings and register the DMA controller
> to DT DMA helpers.
I need someone who understands DT better than me to comment/ack...
Arnd...?

> 
> Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/mpc5121.dtsi |    5 ++-
>  drivers/dma/mpc512x_dma.c          |   63 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 64 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/mpc5121.dtsi b/arch/powerpc/boot/dts/mpc5121.dtsi
> index 723e292..d1fe070 100644
> --- a/arch/powerpc/boot/dts/mpc5121.dtsi
> +++ b/arch/powerpc/boot/dts/mpc5121.dtsi
> @@ -384,10 +384,13 @@
>  			interrupts = <40 0x8>;
>  		};
>  
> -		dma@14000 {
> +		dma0: dma@14000 {
>  			compatible = "fsl,mpc5121-dma";
>  			reg = <0x14000 0x1800>;
>  			interrupts = <65 0x8>;
> +			#dma-cells = <1>;
> +			#dma-channels = <64>;
> +			#dma-requests = <64>;
>  		};
>  	};
>  
> diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
> index 2d95673..bc6c356 100644
> --- a/drivers/dma/mpc512x_dma.c
> +++ b/drivers/dma/mpc512x_dma.c
> @@ -40,6 +40,7 @@
>  #include <linux/io.h>
>  #include <linux/slab.h>
>  #include <linux/of_device.h>
> +#include <linux/of_dma.h>
>  #include <linux/of_platform.h>
>  
>  #include <linux/random.h>
> @@ -641,6 +642,44 @@ mpc_dma_prep_memcpy(struct dma_chan *chan, dma_addr_t dst, dma_addr_t src,
>  	return &mdesc->desc;
>  }
>  
> +struct mpc_dma_filter_args {
> +	struct mpc_dma *mdma;
> +	unsigned int chan_id;
> +};
> +
> +static bool mpc_dma_filter(struct dma_chan *chan, void *param)
> +{
> +	struct mpc_dma_filter_args *fargs = param;
> +
> +	if (chan->device != &fargs->mdma->dma)
> +		return false;
> +
> +	return (chan->chan_id == fargs->chan_id);
> +}
> +
> +static struct dma_chan *mpc_dma_xlate(struct of_phandle_args *dma_spec,
> +						struct of_dma *ofdma)
> +{
> +	int count = dma_spec->args_count;
> +	struct mpc_dma *mdma = ofdma->of_dma_data;
> +	struct mpc_dma_filter_args fargs;
> +	dma_cap_mask_t cap;
> +
> +	if (!mdma)
> +		return NULL;
> +
> +	if (count != 1)
> +		return NULL;
> +
> +	fargs.mdma = mdma;
> +	fargs.chan_id = dma_spec->args[0];
> +
> +	dma_cap_zero(cap);
> +	dma_cap_set(DMA_SLAVE, cap);
> +
> +	return dma_request_channel(cap, mpc_dma_filter, &fargs);
> +}
> +
>  static int mpc_dma_probe(struct platform_device *op)
>  {
>  	struct device_node *dn = op->dev.of_node;
> @@ -791,11 +830,26 @@ static int mpc_dma_probe(struct platform_device *op)
>  	/* Register DMA engine */
>  	dev_set_drvdata(dev, mdma);
>  	retval = dma_async_device_register(dma);
> -	if (retval) {
> -		devm_free_irq(dev, mdma->irq, mdma);
> -		irq_dispose_mapping(mdma->irq);
> +	if (retval)
> +		goto reg_err;
> +
> +	if (dev->of_node) {
> +		retval = of_dma_controller_register(dev->of_node,
> +						    mpc_dma_xlate, mdma);
> +		if (retval) {
> +			dev_err(&op->dev,
> +				"could not register of_dma_controller\n");
> +			goto of_err;
> +		}
>  	}
>  
> +	return 0;
> +
> +of_err:
> +	dma_async_device_unregister(&mdma->dma);
> +reg_err:
> +	devm_free_irq(dev, mdma->irq, mdma);
> +	irq_dispose_mapping(mdma->irq);
>  	return retval;
>  }
>  
> @@ -804,6 +858,9 @@ static int mpc_dma_remove(struct platform_device *op)
>  	struct device *dev = &op->dev;
>  	struct mpc_dma *mdma = dev_get_drvdata(dev);
>  
> +	if (dev->of_node)
> +		of_dma_controller_free(dev->of_node);
> +
>  	dma_async_device_unregister(&mdma->dma);
>  	devm_free_irq(dev, mdma->irq, mdma);
>  	irq_dispose_mapping(mdma->irq);
> -- 
> 1.7.5.4
> 
