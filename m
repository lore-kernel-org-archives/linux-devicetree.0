From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC/PATCH] of: of_find_node_by_name - stop dropping reference
 to 'from' node
Date: Thu, 21 Apr 2016 15:35:16 -0700
Message-ID: <571955A4.7080706@gmail.com>
References: <20160419170540.GA8327@dtor-ws>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160419170540.GA8327@dtor-ws>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 4/19/2016 10:05 AM, Dmitry Torokhov wrote:
> Majority of the callers of of_find_node_by_name() do not expect that it
> will drop reference to the 'from' node if it was passed in, causing
> potential refcount underflows, etc, so let's stop doing this.
> 
> Most of the callers that were handling dropping of reference done by
> of_find_node_by_name() actually wanted for_each_node_by_name() instead.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> 
> If this is acceptable I can make changes to other of_find_node_*()
> methods...

No.  It is correct for of_find_by_name() to call of_node_put() for
the from argument.  The callers should be fixed.

-Frank

> 
>  arch/arm/mach-omap2/omap_hwmod_3xxx_data.c |  2 ++
>  arch/powerpc/platforms/83xx/mpc832x_mds.c  |  2 +-
>  arch/powerpc/platforms/83xx/mpc832x_rdb.c  |  2 +-
>  arch/powerpc/platforms/83xx/mpc836x_mds.c  |  2 +-
>  arch/powerpc/platforms/cell/interrupt.c    |  3 +--
>  arch/powerpc/platforms/cell/setup.c        |  3 +--
>  arch/powerpc/platforms/cell/spider-pic.c   |  3 +--
>  arch/powerpc/platforms/powermac/feature.c  |  2 +-
>  arch/powerpc/platforms/powermac/pic.c      |  2 --
>  drivers/input/misc/twl4030-vibra.c         |  8 +-------
>  drivers/of/base.c                          |  3 +--
>  drivers/pci/hotplug/rpadlpar_core.c        |  4 ++--
>  drivers/video/backlight/tps65217_bl.c      |  4 ++--
>  include/linux/of.h                         | 12 +++++++++---
>  14 files changed, 24 insertions(+), 28 deletions(-)

< snip >

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index b299de2..45fc458 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -826,7 +826,7 @@ EXPORT_SYMBOL(of_find_node_opts_by_path);
>   *	@from:	The node to start searching from or NULL, the node
>   *		you pass will not be searched, only the next one
>   *		will; typically, you pass what the previous call
> - *		returned. of_node_put() will be called on it
> + *		returned.
>   *	@name:	The name string to match against
>   *
>   *	Returns a node pointer with refcount incremented, use
> @@ -843,7 +843,6 @@ struct device_node *of_find_node_by_name(struct device_node *from,
>  		if (np->name && (of_node_cmp(np->name, name) == 0)
>  		    && of_node_get(np))
>  			break;
> -	of_node_put(from);
>  	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>  	return np;
>  }

< snip >


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
