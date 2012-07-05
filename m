From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH][Resend] of: Fix null pointer related warnings in base.c
 file
Date: Thu, 05 Jul 2012 11:09:26 -0500
Message-ID: <4FF5BC36.60608@gmail.com>
References: <1340770485-22670-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1340770485-22670-1-git-send-email-sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/26/2012 11:14 PM, Sachin Kamat wrote:
> Fixes the following sparse warnings:
> drivers/of/base.c:176:41: warning: Using plain integer as NULL pointer
> drivers/of/base.c:178:37: warning: Using plain integer as NULL pointer
> drivers/of/base.c:500:49: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied for 3.6.

Rob

> ---
>  drivers/of/base.c |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index d9bfd49..2031aa1 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -173,9 +173,9 @@ struct property *of_find_property(const struct device_node *np,
>  		return NULL;
>  
>  	read_lock(&devtree_lock);
> -	for (pp = np->properties; pp != 0; pp = pp->next) {
> +	for (pp = np->properties; pp; pp = pp->next) {
>  		if (of_prop_cmp(pp->name, name) == 0) {
> -			if (lenp != 0)
> +			if (lenp)
>  				*lenp = pp->length;
>  			break;
>  		}
> @@ -497,7 +497,7 @@ struct device_node *of_find_node_with_property(struct device_node *from,
>  	read_lock(&devtree_lock);
>  	np = from ? from->allnext : allnodes;
>  	for (; np; np = np->allnext) {
> -		for (pp = np->properties; pp != 0; pp = pp->next) {
> +		for (pp = np->properties; pp; pp = pp->next) {
>  			if (of_prop_cmp(pp->name, prop_name) == 0) {
>  				of_node_get(np);
>  				goto out;
> 
