From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dtc: fix for_each_*() to skip first object if deleted
Date: Wed, 03 Oct 2012 18:42:32 -0500
Message-ID: <506CCD68.4030000@gmail.com>
References: <1349303574-4635-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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

On 10/03/2012 05:32 PM, Stephen Warren wrote:
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
> ---
> Rob, Grant, now that you're listed as maintainers for the Linux kernel's
> copy of dtc, will you automatically apply patches there as they are
> accepted into upstream dtc, or should I still create "backport" patches
> and send them to you separately?

I guess the fundamental question is when do we sync upstream dtc: in
sync with the kernel cycles or based on some upstream dtc milestone?
There's not really releases of dtc unless you go ask for one. So I don't
think any particular commit is more or less stable. I would guess most
users are using the in kernel version, so upstream is probably not
getting tested enough that we would gain some test coverage by waiting.
This was my rational for picking up the changes for 3.7.

Assuming we go with pick-up all the dtc changes every kernel cycle, it
should be simple enough to script picking up commits from upstream. I'm
assuming it is just a path fix-up? In that case, it wouldn't be
necessary to post both versions of patches. Now, if someone wants to do
that script and just provide me a git branch to pull, I would be more
than happy to take it.

Rob

> 
>  dtc.h |   23 +++++++++++------------
>  1 files changed, 11 insertions(+), 12 deletions(-)
> 
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
>  
>  #define for_each_label_withdel(l0, l) \
>  	for ((l) = (l0); (l); (l) = (l)->next)
>  
> -static inline struct property *for_each_property_next(struct property *p)
> +static inline struct property *skip_deleted_properties(struct property *p)
>  {
> -	do {
> +	while (p && p->deleted)
>  		p = p->next;
> -	} while (p && p->deleted);
>  
>  	return p;
>  }
>  
>  #define for_each_property(n, p) \
> -	for ((p) = (n)->proplist; (p); (p) = for_each_property_next(p))
> +	for ((p) = (n)->proplist; ((p) = skip_deleted_properties(p)); \
> +		(p) = (p)->next)
>  
>  #define for_each_property_withdel(n, p) \
>  	for ((p) = (n)->proplist; (p); (p) = (p)->next)
>  
> -static inline struct node *for_each_child_next(struct node *c)
> +static inline struct node *skip_deleted_children(struct node *c)
>  {
> -	do {
> +	while (c && c->deleted)
>  		c = c->next_sibling;
> -	} while (c && c->deleted);
>  
>  	return c;
>  }
>  
>  #define for_each_child(n, c) \
> -	for ((c) = (n)->children; (c); (c) = for_each_child_next(c))
> +	for ((c) = (n)->children; ((c) = skip_deleted_children(c)); \
> +		(c) = (c)->next_sibling)
>  
>  #define for_each_child_withdel(n, c) \
>  	for ((c) = (n)->children; (c); (c) = (c)->next_sibling)
> 
