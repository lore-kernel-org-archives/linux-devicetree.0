From: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] dma: tegra: use list_move_tail instead of
 list_del/list_add_tail
Date: Fri, 14 Sep 2012 08:39:06 +0530
Message-ID: <1347592146.1943.14.camel@vkoul-udesk3>
References: <CAPgLHd9DHDY9-oxFRK6coarc8JqKGporKSXTFG5fkRioZz6xFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAPgLHd9DHDY9-oxFRK6coarc8JqKGporKSXTFG5fkRioZz6xFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2012-09-05 at 15:08 +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> 
> Using list_move_tail() instead of list_del() + list_add_tail().
> 
> spatch with a semantic match is used to found this problem.
> (http://coccinelle.lip6.fr/)
> 
> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
Applied thanks
> ---
>  drivers/dma/tegra20-apb-dma.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 24acd71..6ed3f43 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -475,8 +475,7 @@ static void tegra_dma_abort_all(struct tegra_dma_channel *tdc)
>  	while (!list_empty(&tdc->pending_sg_req)) {
>  		sgreq = list_first_entry(&tdc->pending_sg_req,
>  						typeof(*sgreq), node);
> -		list_del(&sgreq->node);
> -		list_add_tail(&sgreq->node, &tdc->free_sg_req);
> +		list_move_tail(&sgreq->node, &tdc->free_sg_req);
>  		if (sgreq->last_sg) {
>  			dma_desc = sgreq->dma_desc;
>  			dma_desc->dma_status = DMA_ERROR;
> @@ -570,8 +569,7 @@ static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
>  
>  	/* If not last req then put at end of pending list */
>  	if (!list_is_last(&sgreq->node, &tdc->pending_sg_req)) {
> -		list_del(&sgreq->node);
> -		list_add_tail(&sgreq->node, &tdc->pending_sg_req);
> +		list_move_tail(&sgreq->node, &tdc->pending_sg_req);
>  		sgreq->configured = false;
>  		st = handle_continuous_head_request(tdc, sgreq, to_terminate);
>  		if (!st)
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/


-- 
~Vinod
