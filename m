From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: powerpc/opal-irqchip: Use interrupt names if present
Date: Fri, 2 Jun 2017 14:39:19 +0200
Message-ID: <CAMuHMdWGZYkM_aQ=vXr5J9-KFGzzWgq3hf+ZRY-n-+8-ghG5nQ@mail.gmail.com>
References: <20170222190235.92E5F661CEB@gitolite.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170222190235.92E5F661CEB-OoYKEaZ2EDaWaY/ihj7yzEB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ben,

On Wed, Feb 22, 2017 at 8:02 PM, Linux Kernel Mailing List
<linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> wrote:
> Web:        https://git.kernel.org/torvalds/c/2717a33d60745f2f72e521cdaedf79b00f66f8ca
> Commit:     2717a33d60745f2f72e521cdaedf79b00f66f8ca
> Parent:     470a36a8c014e5cac7bb2df382948597f7ec1b2c
> Refname:    refs/heads/master
> Author:     Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> AuthorDate: Mon Feb 6 16:07:36 2017 +1100
> Committer:  Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
> CommitDate: Thu Feb 9 10:31:37 2017 +1100
>
>     powerpc/opal-irqchip: Use interrupt names if present
>
>     Recent versions of OPAL can provide names for the various OPAL interrupts,
>     so let's use them. This also modernises the code that fetches the
>     interrupt array to use the helpers provided by the generic code instead
>     of hand-parsing the property.
>
>     Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
>     [mpe: Free irqs on error, check allocation of names, consolidate error
>           handling, whitespace.]
>     Signed-off-by: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
> ---
>  arch/powerpc/platforms/powernv/opal-irqchip.c | 55 ++++++++++++++++++++-------
>  1 file changed, 42 insertions(+), 13 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc/platforms/powernv/opal-irqchip.c
> index 998316bf2dad..ecdcba9d1220 100644
> --- a/arch/powerpc/platforms/powernv/opal-irqchip.c
> +++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
> @@ -183,8 +183,9 @@ void opal_event_shutdown(void)

> +       /* It's not an error for the names to be missing */
> +       of_property_read_string_array(opal_node, "opal-interrupts-names",
> +                                     names, opal_irq_count);

Just double-checking, as it's different from the standard "interrupt-names":
is "opal-interrupts-names" the correct name?

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
