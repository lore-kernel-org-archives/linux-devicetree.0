From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dma: imx-dma: Add oftree support
Date: Sat, 2 Mar 2013 22:12:38 +0000
Message-ID: <201303022212.38322.arnd@arndb.de>
References: <1362243213-29399-1-git-send-email-mpa@pengutronix.de>
 <1362243213-29399-2-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1362243213-29399-2-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 02 March 2013, Markus Pargmann wrote:
> Adding devicetree support for imx-dma driver. Use driver name for
> function 'imx_dma_is_general_purpose' because the devicename for
> devicetree initialized devices is different.
 
Just one small comment this time:

> @@ -734,8 +757,9 @@ static int imxdma_alloc_chan_resources(struct dma_chan *chan)
>  	struct imxdma_channel *imxdmac = to_imxdma_chan(chan);
>  	struct imx_dma_data *data = chan->private;
>  
> -	if (data != NULL)
> +	if (data != NULL) {
>  		imxdmac->dma_request = data->dma_request;
> +	}
>  
>  	while (imxdmac->descs_allocated < IMXDMA_MAX_CHAN_DESCRIPTORS) {
>  		struct imxdma_desc *desc;

I assume that this change wasn't meant to be in here.

	Arnd
