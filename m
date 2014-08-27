From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of: Fix constantness of of_n_size_cells
Date: Wed, 27 Aug 2014 11:28:27 +0100
Message-ID: <20140827102827.50E15C409CB@trevor.secretlab.ca>
References: <cover.1408729200.git.geoff@infradead.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1408729200.git.geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 22 Aug 2014 17:43:36 +0000, Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> The of_n_size_cells() routine only does a read-only operation on the device tree
> passed in, so add the const keyword to that argument so that of_n_size_cells()
> can be called with read-only data without casting.
> 
> Signed-off-by: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>

What is the code that exposed this problem?

g.

> ---
> The following changes since commit 7d1311b93e58ed55f3a31cc8f94c4b8fe988a2b9:
> 
>   Linux 3.17-rc1 (2014-08-16 10:40:26 -0600)
> 
> are available in the git repository at:
> 
>   git://git.linaro.org/people/geoff.levand/linux-kexec.git for-of
> 
> for you to fetch changes up to e7667576c053daedba1da0b14d4476bc25a86a11:
> 
>   of: Fix constantness of of_n_size_cells (2014-08-22 10:33:59 -0700)
> 
> ----------------------------------------------------------------
> Geoff Levand (1):
>       of: Fix constantness of of_n_size_cells
>  drivers/of/base.c  | 4 ++--
>  include/linux/of.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d8574ad..f773679 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -53,7 +53,7 @@ DEFINE_MUTEX(of_mutex);
>   */
>  DEFINE_RAW_SPINLOCK(devtree_lock);
>  
> -int of_n_addr_cells(struct device_node *np)
> +int of_n_addr_cells(const struct device_node *np)
>  {
>  	const __be32 *ip;
>  
> @@ -69,7 +69,7 @@ int of_n_addr_cells(struct device_node *np)
>  }
>  EXPORT_SYMBOL(of_n_addr_cells);
>  
> -int of_n_size_cells(struct device_node *np)
> +int of_n_size_cells(const struct device_node *np)
>  {
>  	const __be32 *ip;
>  
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 6c4363b..6eebcf6 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -285,8 +285,8 @@ extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
>  #define for_each_property_of_node(dn, pp) \
>  	for (pp = dn->properties; pp != NULL; pp = pp->next)
>  
> -extern int of_n_addr_cells(struct device_node *np);
> -extern int of_n_size_cells(struct device_node *np);
> +extern int of_n_addr_cells(const struct device_node *np);
> +extern int of_n_size_cells(const struct device_node *np);
>  extern const struct of_device_id *of_match_node(
>  	const struct of_device_id *matches, const struct device_node *node);
>  extern int of_modalias_node(struct device_node *node, char *modalias, int len);
> -- 
> 1.9.1
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
