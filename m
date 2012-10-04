From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH] dtc: fix for_each_*() to skip first object if deleted
Date: Thu, 4 Oct 2012 15:00:43 +1000
Message-ID: <20121004050043.GQ29302@truffula.fritz.box>
References: <1349303574-4635-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1349303574-4635-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 03, 2012 at 04:32:54PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The previous definition of e.g. for_each_*() would always include the
> very first object within the list of processed labels, irrespective of
> whether it was marked deleted, since the deleted flag was not checked
> on the first object, but only on any "next" object.
> 
> Fix for_each_*() to call skip_deleted_*() prior to every loop iteration,
> including the first, i.e. as part of the for loop test expression rather
> than as part of the increment statement, to correct this.
> 
> Incidentally, this change is why commit 45013d8 dtc: "Add ability to
> delete nodes and properties" only caused two "make checkm" failures;
> only two tests actually use multiple labels on the same property or
> node. With this current change applied, but commit 317a5d9 "dtc: zero
> out new label objects" reverted, "make checkm" fails 29 times; i.e.
> for every test that uses any labels at all.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Oops, we definitely want this fix, or one like it.  This one really
could do with a testcase - or specifically extending your existing
deletion testcases to cover this variant.


> diff --git a/dtc.h b/dtc.h
> index d501c86..88da264 100644
> --- a/dtc.h
> +++ b/dtc.h
> @@ -161,47 +161,46 @@ struct node {
>  	struct label *labels;
>  };
>  
> -static inline struct label *for_each_label_next(struct label *l)
> +static inline struct label *skip_deleted_labels(struct label *l)
>  {
> -	do {
> +	while (l && l->deleted)
>  		l = l->next;
> -	} while (l && l->deleted);
>  
>  	return l;
>  }
>  
>  #define for_each_label(l0, l) \
> -	for ((l) = (l0); (l); (l) = for_each_label_next(l))
> +	for ((l) = (l0); ((l) = skip_deleted_labels(l)); (l) = (l)->next)

I think there's an easier way to implement this though, rather than
having these skip functions, it should work to just do:

#define for_each_label(l0, l) \
	for_each_label_witdel(l0, l) \
		if (!(l)->deleted)

And likewise for the other variants.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
