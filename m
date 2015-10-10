From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] of/fdt: fix aliases with baudrate in earlycon
Date: Sat, 10 Oct 2015 08:48:15 -0400
Message-ID: <5619090F.7040108@hurleysoftware.com>
References: <1444465770-3103-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444465770-3103-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/10/2015 04:29 AM, Stefan Agner wrote:
> Many boards use an alias in the stdout-path specification along
> with console options after a colon (e.g. serial0:115200n8). When
> using earlycon, this specification currently does not work. While
> fdt_path_offset supports alias resolution, it does not remove the
> console options by itself. Use the fdt_path_offset_namelen variant
> and provide the length of the alias to enable aliases with console
> options in the stdout-path.
> 
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
> Hi,
> 
> Stumbled upon this while testing 32-bit ARM earlycon support. It
> seems that this once already came up on the list:
> https://lkml.org/lkml/2015/3/13/562

Yeah, looks like my patch got lost somewhere.
https://lkml.org/lkml/2015/4/8/604

Regards,
Peter Hurley


> 
>  drivers/of/fdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 6e82bc42..9fc3568 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -813,8 +813,11 @@ static int __init early_init_dt_scan_chosen_serial(void)
>  	if (!p || !l)
>  		return -ENOENT;
>  
> +	/* Remove console options if present */
> +	l = strchrnul(p, ':') - p;
> +
>  	/* Get the node specified by stdout-path */
> -	offset = fdt_path_offset(fdt, p);
> +	offset = fdt_path_offset_namelen(fdt, p, l);
>  	if (offset < 0)
>  		return -ENODEV;
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
