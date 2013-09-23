From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH -next] dma: mmp_pdma: use list_move instead of
 list_del/list_add
Date: Mon, 23 Sep 2013 15:32:53 +0530
Message-ID: <20130923100253.GG17188@intel.com>
References: <CAPgLHd9SeN1OdCKqTP2w_rFi3TWD=b+7vL4iwx53KwnMF23Nxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd9SeN1OdCKqTP2w_rFi3TWD=b+7vL4iwx53KwnMF23Nxg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: djbw@fb.com, grant.likely@linaro.org, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2013 at 02:07:20PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Using list_move() instead of list_del() + list_add().
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
Applied, thanks

~Vinod
> ---
>  drivers/dma/mmp_pdma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
> index ff8d7827..558994f 100644
> --- a/drivers/dma/mmp_pdma.c
> +++ b/drivers/dma/mmp_pdma.c
> @@ -798,8 +798,7 @@ static void dma_do_tasklet(unsigned long data)
>  		 * move the descriptors to a temporary list so we can drop
>  		 * the lock during the entire cleanup operation
>  		 */
> -		list_del(&desc->node);
> -		list_add(&desc->node, &chain_cleanup);
> +		list_move(&desc->node, &chain_cleanup);
>  
>  		/*
>  		 * Look for the first list entry which has the ENDIRQEN flag
> 

-- 
