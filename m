From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of: constify property name parameters for helper functions
Date: Tue, 2 Aug 2011 16:51:54 +0100
Message-ID: <20110802155154.GA31611@ponder.secretlab.ca>
References: <1312296307-32527-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1312296307-32527-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 02, 2011 at 03:45:07PM +0100, Jamie Iles wrote:
> The helper functions for reading u32 integers, u32 arrays and strings
> should have the property name as a const pointer.
> 
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>

Applied, thanks.

g.

> ---
>  drivers/of/base.c  |    7 ++++---
>  include/linux/of.h |   15 +++++++++------
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 02ed367..3ff22e3 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -610,8 +610,9 @@ EXPORT_SYMBOL(of_find_node_by_phandle);
>   *
>   * The out_value is modified only if a valid u32 value can be decoded.
>   */
> -int of_property_read_u32_array(const struct device_node *np, char *propname,
> -			       u32 *out_values, size_t sz)
> +int of_property_read_u32_array(const struct device_node *np,
> +			       const char *propname, u32 *out_values,
> +			       size_t sz)
>  {
>  	struct property *prop = of_find_property(np, propname, NULL);
>  	const __be32 *val;
> @@ -645,7 +646,7 @@ EXPORT_SYMBOL_GPL(of_property_read_u32_array);
>   *
>   * The out_string pointer is modified only if a valid string can be decoded.
>   */
> -int of_property_read_string(struct device_node *np, char *propname,
> +int of_property_read_string(struct device_node *np, const char *propname,
>  				const char **out_string)
>  {
>  	struct property *prop = of_find_property(np, propname, NULL);
> diff --git a/include/linux/of.h b/include/linux/of.h
> index bd716f8..0085bb0 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -196,12 +196,13 @@ extern struct property *of_find_property(const struct device_node *np,
>  					 const char *name,
>  					 int *lenp);
>  extern int of_property_read_u32_array(const struct device_node *np,
> -				      char *propname,
> +				      const char *propname,
>  				      u32 *out_values,
>  				      size_t sz);
>  
> -extern int of_property_read_string(struct device_node *np, char *propname,
> -					const char **out_string);
> +extern int of_property_read_string(struct device_node *np,
> +				   const char *propname,
> +				   const char **out_string);
>  extern int of_device_is_compatible(const struct device_node *device,
>  				   const char *);
>  extern int of_device_is_available(const struct device_node *device);
> @@ -242,13 +243,15 @@ static inline bool of_have_populated_dt(void)
>  }
>  
>  static inline int of_property_read_u32_array(const struct device_node *np,
> -				char *propname, u32 *out_values, size_t sz)
> +					     const char *propname,
> +					     u32 *out_values, size_t sz)
>  {
>  	return -ENOSYS;
>  }
>  
>  static inline int of_property_read_string(struct device_node *np,
> -				char *propname, const char **out_string)
> +					  const char *propname,
> +					  const char **out_string)
>  {
>  	return -ENOSYS;
>  }
> @@ -256,7 +259,7 @@ static inline int of_property_read_string(struct device_node *np,
>  #endif /* CONFIG_OF */
>  
>  static inline int of_property_read_u32(const struct device_node *np,
> -				       char *propname,
> +				       const char *propname,
>  				       u32 *out_value)
>  {
>  	return of_property_read_u32_array(np, propname, out_value, 1);
> -- 
> 1.7.4.1
> 
