From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Remove "reg" data prints from early_init_dt_scan_memory
Date: Wed, 15 Apr 2015 07:52:12 -0500
Message-ID: <CAL_JsqLr=0bYWCzTQ7BiFy9+nUWDTSw8sK2yLAK6jdH6fwy-WA@mail.gmail.com>
References: <55259B4D.2020304@gmail.com> <1428869786-26897-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428869786-26897-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 12, 2015 at 3:16 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Commit 51975db0b7333 ("of/flattree: merge early_init_dt_scan_memory()
> common code") consolidated some code from PowerPC (typically
> big-endian), and ended-up adding a pr_debug() printing reg properties in
> big-endian (DT native) format, not CPU endian.
>
> This debug print suffers from two problems:
> - we only print 4 "reg" values, while there could be more on typical
>   systems having multiple memory ranges
> - we print these 4 "reg" values in FDT endianess, that is big-endian,
>   and these values could be confusing for little-endian configurations
>
> Since we are already printing the base address and size of the memory
> regions parsed by early_init_dt_scan_memory() later in a way that is
> both endian correct, and takes into account arbitrary number of memory
> banks, just remove that part of the debug print.
>
> Suggested-by: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Patch against devicetree/next

Applied. Thanks.

Rob

>
>  drivers/of/fdt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 3a896c9..34bdc4d 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -879,8 +879,7 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
>
>         endp = reg + (l / sizeof(__be32));
>
> -       pr_debug("memory scan node %s, reg size %d, data: %x %x %x %x,\n",
> -           uname, l, reg[0], reg[1], reg[2], reg[3]);
> +       pr_debug("memory scan node %s, reg size %d,\n", uname, l);
>
>         while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
>                 u64 base, size;
> --
> 2.1.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
