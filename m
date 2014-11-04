From: "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
Subject: Re: [PATCH] of: Fix overflow bug in string property parsing functions
Date: Tue, 04 Nov 2014 01:43:24 +0100
Message-ID: <4744029.MmARg0u2A0@vostro.rjw.lan>
References: <1415057904-6187-1-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415057904-6187-1-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darren Hart <darren.hart-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, November 03, 2014 11:38:24 PM Grant Likely wrote:

[cut]

> diff --git a/include/linux/of.h b/include/linux/of.h
> index 6545e7aec7bb..3b3c6e849ae8 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -267,14 +267,12 @@ extern int of_property_read_u64(const struct device_node *np,
>  extern int of_property_read_string(struct device_node *np,
>  				   const char *propname,
>  				   const char **out_string);
> -extern int of_property_read_string_index(struct device_node *np,
> -					 const char *propname,
> -					 int index, const char **output);
>  extern int of_property_match_string(struct device_node *np,
>  				    const char *propname,
>  				    const char *string);
> -extern int of_property_count_strings(struct device_node *np,
> -				     const char *propname);
> +extern int of_property_read_string_helper(struct device_node *np,
> +					      const char *propname,
> +					      const char **out_strs, size_t sz, int index);
>  extern int of_device_is_compatible(const struct device_node *device,
>  				   const char *);
>  extern int of_device_is_available(const struct device_node *device);
> @@ -486,15 +484,9 @@ static inline int of_property_read_string(struct device_node *np,
>  	return -ENOSYS;
>  }
>  
> -static inline int of_property_read_string_index(struct device_node *np,
> -						const char *propname, int index,
> -						const char **out_string)
> -{
> -	return -ENOSYS;
> -}
> -
> -static inline int of_property_count_strings(struct device_node *np,
> -					    const char *propname)
> +static inline int of_property_read_string_helper(struct device_node *np,
> +						 const char *propname,
> +						 char **out_strs, size_t sz, int index)

	const char **out_strs, size_t sz, int index)

>  {
>  	return -ENOSYS;
>  }

Other than that, looks good to me.

Rafael

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
