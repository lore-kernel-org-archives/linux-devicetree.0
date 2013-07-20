From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/irq: Avoid calling list_first_entry() for empty list
Date: Sat, 20 Jul 2013 06:35:18 +0100
Message-ID: <20130720053519.41B773E170B@localhost>
References: <1371973807.23555.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371973807.23555.1.camel@phoenix>
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
To: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 23 Jun 2013 15:50:07 +0800, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org> wrote:
> list_first_entry() expects the list is not empty, we need to check if list is
> empty before calling list_first_entry(). Thus use list_first_entry_or_null()
> instead of list_first_entry().
> 
> Signed-off-by: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

g.

> ---
>  drivers/of/irq.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index a3c1c5a..5c645c7 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -482,8 +482,9 @@ void __init of_irq_init(const struct of_device_id *matches)
>  		}
>  
>  		/* Get the next pending parent that might have children */
> -		desc = list_first_entry(&intc_parent_list, typeof(*desc), list);
> -		if (list_empty(&intc_parent_list) || !desc) {
> +		desc = list_first_entry_or_null(&intc_parent_list,
> +						typeof(*desc), list);
> +		if (!desc) {
>  			pr_err("of_irq_init: children remain, but no parents\n");
>  			break;
>  		}
> -- 
> 1.8.1.2
> 
> 
> 
