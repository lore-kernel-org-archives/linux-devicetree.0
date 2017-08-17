From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 01/16] dmaengine: bcm-sba-raid: Minor improvments in
 comments
Date: Thu, 17 Aug 2017 09:14:42 +0530
Message-ID: <20170817034441.GX3053@localhost>
References: <1501583880-32072-1-git-send-email-anup.patel@broadcom.com>
 <1501583880-32072-2-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501583880-32072-2-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 01, 2017 at 04:07:45PM +0530, Anup Patel wrote:
> Make section comments consistent across the Broadcom SBA RAID driver
> by avoiding " SBA " in some of the comments.

and you add more comments..

> 
> Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/dma/bcm-sba-raid.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
> index e41bbc7..76999b7 100644
> --- a/drivers/dma/bcm-sba-raid.c
> +++ b/drivers/dma/bcm-sba-raid.c
> @@ -48,7 +48,8 @@
>  
>  #include "dmaengine.h"
>  
> -/* SBA command related defines */
> +/* ====== Driver macros and defines ===== */
> +
>  #define SBA_TYPE_SHIFT					48
>  #define SBA_TYPE_MASK					GENMASK(1, 0)
>  #define SBA_TYPE_A					0x0
> @@ -88,6 +89,8 @@
>  #define to_sba_device(dchan)		\
>  	container_of(dchan, struct sba_device, dma_chan)
>  
> +/* ===== Driver data structures ===== */

like this!!

> +
>  enum sba_request_state {
>  	SBA_REQUEST_STATE_FREE = 1,
>  	SBA_REQUEST_STATE_ALLOCED = 2,
> @@ -164,7 +167,7 @@ struct sba_device {
>  	int reqs_free_count;
>  };
>  
> -/* ====== SBA command helper routines ===== */
> +/* ====== Command helper routines ===== */
>  
>  static inline u64 __pure sba_cmd_enc(u64 cmd, u32 val, u32 shift, u32 mask)
>  {
> @@ -196,7 +199,7 @@ static inline u32 __pure sba_cmd_pq_c_mdata(u32 d, u32 b1, u32 b0)
>  	       ((d & SBA_C_MDATA_DNUM_MASK) << SBA_C_MDATA_DNUM_SHIFT);
>  }
>  
> -/* ====== Channel resource management routines ===== */
> +/* ====== General helper routines ===== */
>  
>  static struct sba_request *sba_alloc_request(struct sba_device *sba)
>  {
> -- 
> 2.7.4
> 

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
