From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/5] OF: export of_property_notify
Date: Mon, 11 Nov 2013 16:06:49 +0000
Message-ID: <20131111160649.58E70C4230C@trevor.secretlab.ca>
References: <1383673816-29293-1-git-send-email-panto@antoniou-consulting.com> <1383673816-29293-4-git-send-email-panto@antoniou-consulting.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383673816-29293-4-git-send-email-panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Alison Chaiken <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Lubbe <jluebbe-H4yykcOXDpCzQB+pC5nmwQ@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-OYasijW0DpE@public.gmane.org>, Michael Stickel <ms-g5CePrrZ5ROELgA04lAiVw@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Dirk Behme <dirk.behme-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Bohan <mbohan-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ionut Nicu <ioan.nicu.ext-OYasijW0DpE@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue,  5 Nov 2013 19:50:14 +0200, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> of_property_notify can be utilized by other users too, export it.

Please keep this patch in the series with the patch that actually uses
it.

g.

> 
> Signed-off-by: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> ---
>  drivers/of/base.c  |  8 +-------
>  include/linux/of.h | 11 +++++++++++
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index ca10916..0ffc5a9 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1424,7 +1424,7 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
>  EXPORT_SYMBOL(of_count_phandle_with_args);
>  
>  #if defined(CONFIG_OF_DYNAMIC)
> -static int of_property_notify(int action, struct device_node *np,
> +int of_property_notify(int action, struct device_node *np,
>  			      struct property *prop)
>  {
>  	struct of_prop_reconfig pr;
> @@ -1433,12 +1433,6 @@ static int of_property_notify(int action, struct device_node *np,
>  	pr.prop = prop;
>  	return of_reconfig_notify(action, &pr);
>  }
> -#else
> -static int of_property_notify(int action, struct device_node *np,
> -			      struct property *prop)
> -{
> -	return 0;
> -}
>  #endif
>  
>  /**
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 786c4f6..6fec255 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -307,6 +307,17 @@ extern int of_parse_phandle_with_fixed_args(const struct device_node *np,
>  extern int of_count_phandle_with_args(const struct device_node *np,
>  	const char *list_name, const char *cells_name);
>  
> +#if defined(CONFIG_OF_DYNAMIC)
> +extern int of_property_notify(int action, struct device_node *np,
> +			      struct property *prop);
> +#else
> +static inline int of_property_notify(int action, struct device_node *np,
> +			      struct property *prop)
> +{
> +	return 0;
> +}
> +#endif
> +
>  extern void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align));
>  extern int of_alias_get_id(struct device_node *np, const char *stem);
>  
> -- 
> 1.7.12
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
