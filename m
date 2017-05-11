From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] of: reserved_mem: fix 'const' annotation
Date: Thu, 11 May 2017 09:50:32 -0500
Message-ID: <CAL_Jsq+MHx8Vgj9g4-p3Xs57LNpZB-20opbq2xk9jz-K-57iSw@mail.gmail.com>
References: <20170511122458.3862716-1-arnd@arndb.de> <20170511122458.3862716-2-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170511122458.3862716-2-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 11, 2017 at 7:24 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> It's the pointer that is supposed to be const, not the return
> type of the function.
>
> drivers/of/of_reserved_mem.c: In function '__reserved_mem_init_node':
> drivers/of/of_reserved_mem.c:200:7: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
>    int const (*initfn)(struct reserved_mem *rmem) = i->data;
>
> Fixes: 17a70355ea57 ("of: fix sparse warnings in fdt, irq, reserved mem, and resolver code")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  drivers/of/of_reserved_mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 4dec07ea510f..3f03ec004829 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -197,7 +197,7 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
>         const struct of_device_id *i;
>
>         for (i = __reservedmem_of_table; i < &__rmem_of_table_sentinel; i++) {
> -               int const (*initfn)(struct reserved_mem *rmem) = i->data;
> +               int (* const initfn)(struct reserved_mem *rmem) = i->data;

Why did you move the const here? That doesn't seem to help with sparse.

I think I'll just revert this back to using reservedmem_of_init_fn.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
