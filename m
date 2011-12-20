From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 1/1] dt: reform for_each_property to
 for_each_property_of_node_of_node
Date: Tue, 20 Dec 2011 12:49:52 -0600
Message-ID: <4EF0D8D0.1020505@gmail.com>
References: <1324403518-3462-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1324403518-3462-1-git-send-email-b29396@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <b29396@freescale.com>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, shawn.guo@freescale.com
List-Id: devicetree@vger.kernel.org


On 12/20/2011 11:51 AM, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> Make this micro more easy to use(do not need to pass properties, a node is

Make this macro easier to use...

> enough), also change to a more sensible name as for_each_child_of_node.
> 
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Shawn Guo <shawn.guo@freescale.com>
> ---
>  drivers/of/base.c  |    2 +-
>  include/linux/of.h |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 9b6588e..f6f6fe8 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1159,7 +1159,7 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
>  	if (!of_aliases)
>  		return;
>  
> -	for_each_property(pp, of_aliases->properties) {
> +	for_each_property_of_node(of_aliases, pp) {
>  		const char *start = pp->name;
>  		const char *end = start + strlen(start);
>  		struct device_node *np;
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 4948552..f1a490c 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -219,8 +219,8 @@ extern int of_device_is_available(const struct device_node *device);
>  extern const void *of_get_property(const struct device_node *node,
>  				const char *name,
>  				int *lenp);
> -#define for_each_property(pp, properties) \
> -	for (pp = properties; pp != NULL; pp = pp->next)
> +#define for_each_property_of_node(dn, pp) \
> +	for (pp = dn->properties; pp != NULL; pp = pp->next)

Probably should prepend it with "of_" while you're at it.

Rob
