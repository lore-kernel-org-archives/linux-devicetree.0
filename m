From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/base: Replace alias if it already exists
Date: Mon, 02 Jun 2014 15:59:54 +0100
Message-ID: <20140602145959.7E669C426F6@trevor.secretlab.ca>
References: <1401624083-30796-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401624083-30796-1-git-send-email-ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun,  1 Jun 2014 15:01:23 +0300, Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> The current code unconditionally adds aliases without check if it already
> exists, so it is not possible to alter an alias, from board DT file for
> example. Fix that by replacing an alias if it already exists
> 

Can you describe a more detailed use-case for altering an alias?

g.

> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/base.c |   34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 03e7fc6..99215f0 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -2036,6 +2036,23 @@ static void of_alias_add(struct alias_prop *ap, struct device_node *np,
>  		 ap->alias, ap->stem, ap->id, of_node_full_name(np));
>  }
>  
> +static int of_alias_replace(struct device_node *np, int id, const char *stem,
> +			    int stem_len)
> +{
> +	struct alias_prop *ap;
> +
> +	list_for_each_entry(ap, &aliases_lookup, link) {
> +		if (strncmp(ap->stem, stem, stem_len))
> +			continue;
> +
> +		if (np == ap->np) {
> +			ap->id = id;
> +			return 0;
> +		}
> +	}
> +
> +	return -ENODEV;
> +}
>  /**
>   * of_alias_scan - Scan all properties of 'aliases' node
>   *
> @@ -2092,13 +2109,16 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
>  		if (kstrtoint(end, 10, &id) < 0)
>  			continue;
>  
> -		/* Allocate an alias_prop with enough space for the stem */
> -		ap = dt_alloc(sizeof(*ap) + len + 1, 4);
> -		if (!ap)
> -			continue;
> -		memset(ap, 0, sizeof(*ap) + len + 1);
> -		ap->alias = start;
> -		of_alias_add(ap, np, id, start, len);
> +		if (of_alias_replace(np, id, start, len)) {
> +			/* Allocate an alias_prop with enough space for the stem
> +			 */
> +			ap = dt_alloc(sizeof(*ap) + len + 1, 4);
> +			if (!ap)
> +				continue;
> +			memset(ap, 0, sizeof(*ap) + len + 1);
> +			ap->alias = start;
> +			of_alias_add(ap, np, id, start, len);
> +		}
>  	}
>  }
>  
> -- 
> 1.7.9.5
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
