From: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [PATCH 1/7] Make for_each_child_of_node() reference its args
 when CONFIG_OF=n
Date: Fri, 3 Jan 2014 14:30:48 -0800
Message-ID: <20140103143048.ee945c557167755871f23c5f@linux-foundation.org>
References: <20140103160723.8153.14334.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140103160723.8153.14334.stgit-S6HVgzuS8uM4Awkfq6JHfwNdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Subject: [PATCH 1/7] Make for_each_child_of_node() reference its args when CONFIG_OF=n

Nit: Documentation/SubmittingPatches, section 15.  "subsystem: " is
missing from all patche titles.

On Fri, 03 Jan 2014 16:07:23 +0000 David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> Make for_each_child_of_node() reference its args when CONFIG_OF=n to avoid
> warnings like:
> 
> 	drivers/leds/leds-pwm.c:88:22: warning: unused variable 'node' [-Wunused-variable]
> 	  struct device_node *node = pdev->dev.of_node;
> 			      ^
> ...
>
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -377,8 +377,13 @@ static inline bool of_have_populated_dt(void)
>  	return false;
>  }
>  
> +/* Kill an unused variable warning on a device_node pointer */
> +static inline void __of_use_dn(const struct device_node *np)
> +{
> +}
> +
>  #define for_each_child_of_node(parent, child) \
> -	while (0)
> +	while (__of_use_dn(parent), __of_use_dn(child), 0)
>  
>  #define for_each_available_child_of_node(parent, child) \
>  	while (0)

That's a bit ugly.  __maybe_unused fixes it appropriately but can't be
placed into the macro.


I wonder if we should instead generalise it to

static inline void reference_var_to_squish_gcc_warning(const void *p)
{
}

I guess not, until/unless we find other macros which need the same
treatment.


Yes, passing a var to an empty function suppresses the warning.  But is
this intentional or a happy accident?  Future gcc's could quite
legitimately be enhanced to detect that the arg is still unused and
then we'd need to find a new way of suppressing the warning, if such
exists.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
