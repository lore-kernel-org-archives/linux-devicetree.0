From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: dma: protect list write operation by spin_lock
Date: Mon, 28 Jan 2013 09:52:00 -0600
Message-ID: <51069EA0.4040004@gmail.com>
References: <1359386694-20548-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359386694-20548-1-git-send-email-andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
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
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/28/2013 09:24 AM, Andy Shevchenko wrote:
> Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> ---
>  drivers/of/dma.c |    2 ++
>  1 file changed, 2 insertions(+)

You need to cc whomever has this file in their tree which is Vinod.

Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Vinod, it's probably better to move drivers/of/dma.c to drivers/dma.
That's been the direction we've been taking with new OF binding code. I
must have missed that in the review.

Rob

> 
> diff --git a/drivers/of/dma.c b/drivers/of/dma.c
> index 59631b2..1ae6120 100644
> --- a/drivers/of/dma.c
> +++ b/drivers/of/dma.c
> @@ -117,7 +117,9 @@ int of_dma_controller_register(struct device_node *np,
>  	ofdma->use_count = 0;
>  
>  	/* Now queue of_dma controller structure in list */
> +	spin_lock(&of_dma_lock);
>  	list_add_tail(&ofdma->of_dma_controllers, &of_dma_list);
> +	spin_unlock(&of_dma_lock);
>  
>  	return 0;
>  }
> 
