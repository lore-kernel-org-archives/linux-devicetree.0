From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: fix incorrect return value of
 of_find_matching_node_and_match()
Date: Sun, 20 Jan 2013 15:50:50 -0600
Message-ID: <50FC66BA.9030503@gmail.com>
References: <1358619642-23607-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358619642-23607-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/19/2013 12:20 PM, Thomas Abraham wrote:
> The of_find_matching_node_and_match() function incorrectly sets the matched
> entry to 'matches' when the compatible value of a node matches one of the
> possible values. This results in incorrectly selecting the the first entry in
> the 'matches' list as the matched entry. Fix this by noting down the result of
> the call to of_match_node() and setting that as the matched entry.

Looks fine, but is this breaking something in 3.8 or can it wait for 3.9?

Rob

> 
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/of/base.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 2390ddb..960ae5b 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -612,6 +612,7 @@ struct device_node *of_find_matching_node_and_match(struct device_node *from,
>  					const struct of_device_id **match)
>  {
>  	struct device_node *np;
> +	const struct of_device_id *m;
>  
>  	if (match)
>  		*match = NULL;
> @@ -619,9 +620,10 @@ struct device_node *of_find_matching_node_and_match(struct device_node *from,
>  	read_lock(&devtree_lock);
>  	np = from ? from->allnext : of_allnodes;
>  	for (; np; np = np->allnext) {
> -		if (of_match_node(matches, np) && of_node_get(np)) {
> +		m = of_match_node(matches, np);
> +		if (m && of_node_get(np)) {
>  			if (match)
> -				*match = matches;
> +				*match = m;
>  			break;
>  		}
>  	}
> 
