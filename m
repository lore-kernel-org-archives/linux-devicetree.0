From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] Partially Revert "of: fix sparse warnings in fdt, irq,
 reserved mem, and resolver code"
Date: Wed, 17 May 2017 16:41:05 +0200
Message-ID: <CAMuHMdUEJ68f6tEvGtn6mdDj1bY69g+xMBtz3DDNJydc=+pgiw@mail.gmail.com>
References: <20170511153048.3586-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170511153048.3586-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, May 11, 2017 at 5:30 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> A change to function pointers that was meant to address a sparse warning
> turned out to cause hundreds of new gcc-7 warnings:
>
> include/linux/of_irq.h:11:13: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
> drivers/of/of_reserved_mem.c: In function '__reserved_mem_init_node':
> drivers/of/of_reserved_mem.c:200:7: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
>    int const (*initfn)(struct reserved_mem *rmem) = i->data;

Not just gcc-7. Also with the good old 4.1.2 ;-)

> Turns out the sparse warnings were spurious and have been fixed in
> upstream sparse since 0.5.0 in commit "sparse: treat function pointers
> as pointers to const data".
>
> This partially reverts commit 17a70355ea576843a7ac851f1db26872a50b2850.
>
> Fixes: 17a70355ea57 ("of: fix sparse warnings in fdt, irq, reserved mem, and resolver code")
> Reported-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
