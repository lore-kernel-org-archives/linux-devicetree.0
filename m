From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] of: OF_IRQ should depend on IRQ_DOMAIN
Date: Wed, 15 Apr 2015 07:54:10 -0500
Message-ID: <CAL_JsqL_s2AY=P8Nn3euY5GddsrC2nKj-nSpkYLL-ZqZm0ZJaQ@mail.gmail.com>
References: <1428245965-19618-1-git-send-email-geert@linux-m68k.org> <1428245965-19618-3-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428245965-19618-3-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 5, 2015 at 9:59 AM, Geert Uytterhoeven <geert-Td1EMuHUCqygBwfqmJ+zsg@public.gmane.org=
g> wrote:
> If CONFIG_IRQ_DOMAIN=3Dn:
>
> drivers/of/irq.c: In function =E2=80=98of_irq_get=E2=80=99:
> drivers/of/irq.c:406: error: implicit declaration of function =E2=80=98=
irq_find_host=E2=80=99
> drivers/of/irq.c:406: warning: assignment makes pointer from integer =
without a cast
> make[2]: *** [drivers/of/irq.o] Error 1
>
> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>

Applied. Thanks.

Rob

> ---
>  drivers/of/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 4c98f14694458794..92adecd3ecb28fc7 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -50,7 +50,7 @@ config OF_ADDRESS_PCI
>
>  config OF_IRQ
>         def_bool y
> -       depends on !SPARC
> +       depends on !SPARC && IRQ_DOMAIN
>
>  config OF_NET
>         depends on NETDEVICES
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
