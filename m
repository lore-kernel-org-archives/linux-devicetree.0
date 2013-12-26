From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] of: introduces helper to manage optional property
Date: Thu, 26 Dec 2013 15:38:51 +0100
Message-ID: <20131226143851.GL8064@book.gsilab.sittig.org>
References: <1388035115-893-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1388035115-893-1-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 26, 2013 at 13:18 +0800, Xiubo Li wrote:
> 
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -601,6 +601,23 @@ static inline int of_property_read_u32(const struct device_node *np,
>  	return of_property_read_u32_array(np, propname, out_value, 1);
>  }
>  
> +/**
> + * of_property_optional - Find one optional property
> + * @np:		device node from which the property to be searched.
> + * @propname:	name of the optional property to be searched for.
> + *
> + * Get to know whether one optional property is present or not in a
> + * device node.
> + * Returns true if the property is present, false otherwise.
> + */
> +static inline bool of_property_optional(const struct device_node *np,
> +					 const char *propname)
> +{
> +	struct property *prop = of_find_property(np, propname, NULL);
> +
> +	return prop ? true : false;
> +}
> +

Exactly how is this different from of_property_read_bool()?
AFAICS it's identical!  You may be trying to solve the wrong
problem.

And I'm afraid that the routine's name you picked is even more
confusing.  The call site ("if (of_property_optional() ...") will
no longer reflect that it's evaluating a boolean condition.
Being an optional property and being boolean are two completely
different things.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
