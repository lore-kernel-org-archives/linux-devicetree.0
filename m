From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2 07/14] of/reconfig: Always use the same structure for
 notifiers
Date: Wed, 26 Nov 2014 10:07:54 +1100
Message-ID: <1416956874.5089.13.camel@kernel.crashing.org>
References: <1416868422-22103-1-git-send-email-grant.likely@linaro.org>
	 <1416868422-22103-8-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416868422-22103-8-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-11-24 at 22:33 +0000, Grant Likely wrote:
> The OF_RECONFIG notifier callback uses a different structure depending
> on whether it is a node change or a property change. This is silly, and
> not very safe. Rework the code to use the same data structure regardless
> of the type of notifier.

I fell pretty good about this one except...

> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index b9d1dfdbe5bb..9fe6002c1d5a 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1711,12 +1711,11 @@ static void stage_topology_update(int core_id)
>  static int dt_update_callback(struct notifier_block *nb,
>  				unsigned long action, void *data)
>  {
> -	struct of_prop_reconfig *update;
> +	struct of_reconfig_data *update = data;
>  	int rc = NOTIFY_DONE;
>  
>  	switch (action) {
>  	case OF_RECONFIG_UPDATE_PROPERTY:
> -		update = (struct of_prop_reconfig *)data;

Should we assert/bug on !update->dn / update->prop ?

(Same for the rest of the patch)

Or do you reckon it's pointless ?

Ben.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
