From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: add 'const' for of_parse_phandle parameter *np
Date: Mon, 26 Nov 2012 14:10:53 +0000
Message-ID: <20121126141053.D096C3E199D@localhost>
References: <1353583003-4560-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1353583003-4560-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Grant Likely <grant.likely-LR4i4eoOvxHyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 22 Nov 2012 12:16:43 +0100, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> The existing function does not change the passed device_node pointer. It is
> only handed to of_get_property which itself takes a const struct device_node.
> 
> of_parse_phandle can therefore take a const pointer as well.
> 
> Cc: Grant Likely <grant.likely-LR4i4eoOvxHyB63q8FvJNQ@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Applied, thanks.

g.

> ---
>  drivers/of/base.c  |    5 +++--
>  include/linux/of.h |    4 ++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index af3b22a..eca45b1 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -893,8 +893,8 @@ EXPORT_SYMBOL_GPL(of_property_count_strings);
>   * Returns the device_node pointer with refcount incremented.  Use
>   * of_node_put() on it when done.
>   */
> -struct device_node *
> -of_parse_phandle(struct device_node *np, const char *phandle_name, int index)
> +struct device_node *of_parse_phandle(const struct device_node *np,
> +				     const char *phandle_name, int index)
>  {
>  	const __be32 *phandle;
>  	int size;
> @@ -905,6 +905,7 @@ of_parse_phandle(struct device_node *np, const char *phandle_name, int index)
>  
>  	return of_find_node_by_phandle(be32_to_cpup(phandle + index));
>  }
> +
>  EXPORT_SYMBOL(of_parse_phandle);
>  
>  /**
> diff --git a/include/linux/of.h b/include/linux/of.h
> index b4e50d5..634b03f 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -255,7 +255,7 @@ extern int of_n_size_cells(struct device_node *np);
>  extern const struct of_device_id *of_match_node(
>  	const struct of_device_id *matches, const struct device_node *node);
>  extern int of_modalias_node(struct device_node *node, char *modalias, int len);
> -extern struct device_node *of_parse_phandle(struct device_node *np,
> +extern struct device_node *of_parse_phandle(const struct device_node *np,
>  					    const char *phandle_name,
>  					    int index);
>  extern int of_parse_phandle_with_args(struct device_node *np,
> @@ -411,7 +411,7 @@ static inline int of_property_match_string(struct device_node *np,
>  	return -ENOSYS;
>  }
>  
> -static inline struct device_node *of_parse_phandle(struct device_node *np,
> +static inline struct device_node *of_parse_phandle(const struct device_node *np,
>  						   const char *phandle_name,
>  						   int index)
>  {
> -- 
> 1.7.10.4
> 
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
