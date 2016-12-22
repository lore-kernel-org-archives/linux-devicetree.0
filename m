From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 01/21] MIPS memblock: Unpin dts memblock sanity check method
Date: Thu, 22 Dec 2016 14:57:07 -0600
Message-ID: <CAL_JsqKNZRXzYKVFWRJraEZMvZ0Oj8CBoVFSAy+EWTi5Uavesw@mail.gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com> <1482113266-13207-2-git-send-email-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482113266-13207-2-git-send-email-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, rabinv-VrBV9hrLPhE@public.gmane.org, matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 18, 2016 at 8:07 PM, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> It's necessary to check whether retrieved from dts memory regions
> fits to page alignment and limits restrictions. Sometimes it is
> necessary to perform the same checks, but ito add the memory regions

s/ito/to/

> into a different subsystem. MIPS is going to be that case.
>
> Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/of/fdt.c       | 47 +++++++++++++++++++++++---------
>  include/linux/of_fdt.h |  1 +
>  2 files changed, 35 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 1f98156..1ee958f 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -983,44 +983,65 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  #define MAX_MEMBLOCK_ADDR      ((phys_addr_t)~0)
>  #endif
>
> -void __init __weak early_init_dt_add_memory_arch(u64 base, u64 size)
> +int __init sanity_check_dt_memory(phys_addr_t *out_base,
> +                                 phys_addr_t *out_size)

As kbuild robot found, you don't want to use phys_addr_t here.
phys_addr_t varies with kernel config such as LPAE on ARM and the DT
does not.

>  {
> +       phys_addr_t base = *out_base, size = *out_size;
>         const u64 phys_offset = MIN_MEMBLOCK_ADDR;
>
>         if (!PAGE_ALIGNED(base)) {
>                 if (size < PAGE_SIZE - (base & ~PAGE_MASK)) {
> -                       pr_warn("Ignoring memory block 0x%llx - 0x%llx\n",
> +                       pr_err("Memblock 0x%llx - 0x%llx isn't page aligned\n",

These are not errors. The page alignment is an OS restriction. h/w
(which the DT describes) generally has little concept of page size
outside the MMUs.

Too many unrelated changes in this patch. Add the error return only
and make anything else a separate patch (though I would just drop
everything else).

I've not looked at the rest of the series, but why can't MIPS migrate
to using memblock directly and using the default DT functions using
memblock?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
