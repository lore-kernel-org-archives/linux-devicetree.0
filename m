From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 2/4] uio: UIO_IRQ_NONE is a valid option for uioinfo->irq
Date: Wed, 31 Aug 2016 13:04:08 +0200
Message-ID: <20160831110408.GA21059@kroah.com>
References: <1463476940-26791-1-git-send-email-viktorin@rehivetech.com>
 <1463476940-26791-3-git-send-email-viktorin@rehivetech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1463476940-26791-3-git-send-email-viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Hans J. Koch" <hjk-vqZO0P4V72/QD6PfKP4TzA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 17, 2016 at 11:22:18AM +0200, Jan Viktorin wrote:
> We can simplify handling of platform_get_irq into one place as it is
> acceptable to see UIO_IRQ_NONE instead of a valid IRQ number. Some
> devices don't have or don't need any interrupt to be handled. The
> same change has been already done for uio_pdrv_genirq.
> 
> Signed-off-by: Jan Viktorin <viktorin-MQpMGdXoZmMqDJ6do+/SaQ@public.gmane.org>
> ---
>  drivers/uio/uio_dmem_genirq.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/uio/uio_dmem_genirq.c b/drivers/uio/uio_dmem_genirq.c
> index e1134a4..945515d 100644
> --- a/drivers/uio/uio_dmem_genirq.c
> +++ b/drivers/uio/uio_dmem_genirq.c
> @@ -165,13 +165,6 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
>  		}
>  		uioinfo->name = pdev->dev.of_node->name;
>  		uioinfo->version = "devicetree";
> -
> -		/* Multiple IRQs are not supported */
> -		irq = platform_get_irq(pdev, 0);
> -		if (irq == -ENXIO)
> -			uioinfo->irq = UIO_IRQ_NONE;
> -		else
> -			uioinfo->irq = irq;
>  	}
>  
>  	if (!uioinfo || !uioinfo->name || !uioinfo->version) {
> @@ -200,14 +193,18 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
>  	priv->pdev = pdev;
>  	mutex_init(&priv->alloc_lock);
>  
> +	/* Multiple IRQs are not supported */
>  	if (!uioinfo->irq) {
>  		ret = platform_get_irq(pdev, 0);
> -		if (ret < 0) {
> +		uioinfo->irq = ret;
> +		if (ret == -ENXIO && pdev->dev.of_node)
> +			uioinfo->irq = UIO_IRQ_NONE;
> +		else if (ret < 0) {
>  			dev_err(&pdev->dev, "failed to get IRQ\n");
>  			goto bad1;
>  		}
> -		uioinfo->irq = ret;
>  	}
> +
>  	uiomem = &uioinfo->mem[0];
>  
>  	for (i = 0; i < pdev->num_resources; ++i) {

This adds a build warning to the system, always test your patches before
you send them out :(

Now dropped.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
