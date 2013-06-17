From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] dmaengine: Add hisilicon k3 DMA engine driver
Date: Mon, 17 Jun 2013 22:58:07 +0200
Message-ID: <201306172258.08185.arnd@arndb.de>
References: <1371444872-26994-1-git-send-email-zhangfei.gao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371444872-26994-1-git-send-email-zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 17 June 2013, Zhangfei Gao wrote:
> Add dmaengine driver for hisilicon k3 platform based on virt_dma
> 
> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Tested-by: Kai Yang <jean.yangkai-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/dma/k3dma.txt b/Documentation/devicetree/bindings/dma/k3dma.txt
> new file mode 100644
> index 0000000..cf156f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/k3dma.txt
> @@ -0,0 +1,44 @@
> +* Hisilicon K3 DMA controller
> +
> +See dma.txt first
> +
> +Required properties:
> +- compatible: Should be "hisilicon,k3-dma-1.0"
> +- reg: Should contain DMA registers location and length.
> +- interrupts: Should contain one interrupt shared by all channel
> +- #dma-cells: see dma.txt, should be 1, para number
> +- dma-channels: virtual channels supported, each virtual channel
> +		have specific request line
> +- clocks: clock required
> +
> +Example:
> +
> +Controller:
> +		dma0: dma@fcd02000 {
> +			compatible = "hisilicon,k3-dma-1.0";
> +			reg = <0xfcd02000 0x1000>;
> +			#dma-cells = <1>;
> +			dma-channels = <27>;
> +			interrupts = <0 12 4>;
> +			clocks = <&pclk>;
> +			status = "disable";
> +		};
> +
> +Client:
> +Use specific request line passing from dmax
> +For example, i2c0 read channel request line is 18, while write channel use 19
> +
> +		i2c0: i2c@fcb08000 {
> +			compatible = "snps,designware-i2c";
> +			dmas =	<&dma0 18          /* read channel */
> +				 &dma0 19>;        /* write channel */
> +			dma-names = "rx", "tx";
> +		};
> +
> +		i2c1: i2c@fcb09000 {
> +			compatible = "snps,designware-i2c";
> +			dmas =	<&dma0 20          /* read channel */
> +				 &dma0 21>;        /* write channel */
> +			dma-names = "rx", "tx";
> +		};

The binding looks good to me. 

I'd like to make sure the "dma-channels" property is right though:
You specify that number in DT but ...

> +#define DRIVER_NAME		"k3-dma"
> +#define NR_PHY_CHAN		16
> +#define DMA_ALIGN		3

... you also hardcode the number to 16. Shouldn't the channels be
allocated dynamically based on the dma-channels property?

You do allocate "virtual channels" based on the "dma-channels"
later. Wouldn't that be request line numbers, i.e. "dma-requests"
rather than "dma-channels"?

> +static struct of_dma_filter_info k3_dma_filter;
> +static bool k3_dma_filter_fn(struct dma_chan *chan, void *param)
> +{
> +	return  (*(int *)param == chan->chan_id);
> +}

This filter function works only as long as there is no more than
one DMA engine in the system, which is something that needs to
be documented better. Unfortunately, providing a filter
function to be called by .xlate is currently the only way that
the dma-engine API supports, but we should really get over that.

Vinod: I think we need to add a way for a dmaengine driver to
just return one of its channels to the xlate function. The
current method is getting very silly, and it adds run-time and
code complexity without any need.

How about something like

int dma_get_slave_channel(struct dma_chan *chan)
{
	/* lock against __dma_request_channel */
	mutex_lock(&dma_list_mutex);

	if (chan->client_count == 0)
		ret = dma_chan_get(chan);
	else	
		ret = -EBUSY;

	mutex_unlock(&dma_list_mutex);

	return ret;
}
EXPORT_SYMBOL_GPL(dma_get_slave_channel);

> +	/* init virtual channel */
> +	for (i = 0; i < dma_channels; i++) {
> +		struct k3_dma_chan *c;
> +
> +		c = devm_kzalloc(&op->dev,
> +				sizeof(struct k3_dma_chan), GFP_KERNEL);
> +		if (c == NULL)
> +			return -ENOMEM;
> +
> +		INIT_LIST_HEAD(&c->node);
> +		c->vc.desc_free = k3_dma_free_desc;
> +		vchan_init(&c->vc, &d->slave);
> +	}

Note that a single devm_kzalloc would be slightly more space efficient
here.

	Arnd
