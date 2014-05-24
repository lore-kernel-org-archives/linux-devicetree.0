From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH] coccinelle: Check for missing NULL terminators in
 of_device_id tables
Date: Sat, 24 May 2014 09:57:00 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1405240956220.2012@localhost6.localdomain6>
References: <1400888504-31309-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400888504-31309-1-git-send-email-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Gilles Muller <Gilles.Muller-L2FTfq7BK8M@public.gmane.org>, Nicolas Palix <nicolas.palix-wMUr/XMoy4A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 23 May 2014, Stephen Boyd wrote:

> Failure to terminate an of_device_id table can lead to confusing
> failures depending on where the compiler places the array. Add a
> check to make sure these tables are terminated. Thanks to Mitchel
> Humpherys for coming up with the initial pattern.
> 
> Cc: Mitchel Humpherys <mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> Cc: Gilles Muller <Gilles.Muller-L2FTfq7BK8M@public.gmane.org>
> Cc: Nicolas Palix <nicolas.palix-wMUr/XMoy4A@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
>  scripts/coccinelle/misc/of_table.cocci | 81 ++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 scripts/coccinelle/misc/of_table.cocci
> 
> diff --git a/scripts/coccinelle/misc/of_table.cocci b/scripts/coccinelle/misc/of_table.cocci
> new file mode 100644
> index 000000000000..da8bfa69fa3e
> --- /dev/null
> +++ b/scripts/coccinelle/misc/of_table.cocci
> @@ -0,0 +1,81 @@
> +/// Make sure of_device_id tables are NULL terminated
> +//
> +// Keywords: of_table
> +// Confidence: Medium
> +// Options: --include-headers
> +
> +virtual patch
> +virtual context
> +virtual org
> +virtual report
> +
> +@bad_of_table exists@
> +identifier var, arr;
> +expression E;
> +@@
> +... struct of_device_id arr[] = {
> +	...,
> +	{
> +	...,
> +	.var = E,
> +	...
> +	}
> +};

You shouldn't need any of the ...s in these rules.

julia

> +@depends on bad_of_table && context@
> +identifier var, arr;
> +expression E;
> +@@
> + ... struct of_device_id arr[] = {
> +	...,
> +	{
> +	...,
> +*	.var = E,
> +	...
> +	}
> +};
> +
> +@depends on bad_of_table && patch@
> +identifier var, arr;
> +expression E;
> +@@
> +... struct of_device_id arr[] = {
> +	...,
> +	{
> +	...,
> +	.var = E,
> +	...
> +-	}
> ++	},
> ++	{ }
> +};
> +
> +@r depends on bad_of_table exists@
> +position p1;
> +identifier var, arr;
> +expression E;
> +@@
> +... struct of_device_id arr[] = {
> +	...,
> +	{
> +	...,
> +	.var = E,
> +	...
> +	}
> +	@p1
> +};
> +
> +@script:python depends on org@
> +p1 << r.p1;
> +arr << r.arr;
> +@@
> +
> +cocci.print_main(arr,p1)
> +
> +@script:python depends on report@
> +p1 << r.p1;
> +arr << r.arr;
> +@@
> +
> +msg = "%s is not NULL terminated at line %s" % (arr, p1[0].line)
> +coccilib.report.print_report(p1[0],msg)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> hosted by The Linux Foundation
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
