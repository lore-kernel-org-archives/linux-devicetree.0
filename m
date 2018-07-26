Return-Path: <SRS0=Qj0e=KK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180725212220.44525-1-chris.brandt@renesas.com> <20180725212220.44525-3-chris.brandt@renesas.com>
In-Reply-To: <20180725212220.44525-3-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 14:12:08 +0200
Message-ID: <CAMuHMdW-it6EdNXLWwTY0PGicswXSEQ1HWWZ_SfWVaZSHMpOcA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] soc: renesas: identify RZ/A2
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 25, 2018 at 11:22 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for identifying the RZ/A2M (R7S9210) SoC.
> Also add support for reading the BSID register which is a different format
> than the PRR.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -20,10 +20,15 @@
>  #include <linux/string.h>
>  #include <linux/sys_soc.h>
>
> +enum {
> +       TYPE_PRR,
> +       TYPE_BSID,
> +};
>
>  struct renesas_family {
>         const char name[16];
> -       u32 reg;                        /* CCCR or PRR, if not in DT */
> +       u32 reg;                        /* CCCR, PRR or BSID, if not in DT */
> +       u8 type;

The only reason we have the reg field in this struct is because we added
SoC identification for existing SoCs, which didn't have PRR in DT from the
start.
As RZ/A2 is a new SoC family, we can assume there will always be a device
node for the BSID.  Hence I think any code to support RZ/A2 without BSID in
DT can be dropped (incl. the type field and enums, see below).

>  };
>
>  static const struct renesas_family fam_rcar_gen1 __initconst __maybe_unused = {
> @@ -46,8 +51,14 @@ static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
>         .reg    = 0xe600101c,           /* CCCR (Common Chip Code Register) */
>  };
>
> -static const struct renesas_family fam_rza __initconst __maybe_unused = {
> -       .name   = "RZ/A",
> +static const struct renesas_family fam_rza1 __initconst __maybe_unused = {
> +       .name   = "RZ/A1",
> +};
> +
> +static const struct renesas_family fam_rza2 __initconst __maybe_unused = {
> +       .name   = "RZ/A2",
> +       .reg    = 0xfcfe8004,           /* BSID (Boundary Scan ID Register) */
> +       .type   = TYPE_BSID,

Hence please drop the reg and type initialization.

> @@ -263,6 +282,7 @@ static int __init renesas_soc_init(void)
>         struct soc_device *soc_dev;
>         struct device_node *np;
>         unsigned int product;
> +       u8 reg_type = TYPE_PRR;
>
>         match = of_match_node(renesas_socs, of_root);
>         if (!match)
> @@ -271,23 +291,39 @@ static int __init renesas_soc_init(void)
>         soc = match->data;
>         family = soc->family;
>
> -       /* Try PRR first, then hardcoded fallback */
> +       /* Try PRR and BSID first, then hardcoded fallback */
>         np = of_find_compatible_node(NULL, NULL, "renesas,prr");
> +       if (!np) {
> +               np = of_find_compatible_node(NULL, NULL, "renesas,bsid");
> +               if (np)
> +                       reg_type = TYPE_BSID;
> +       }
>         if (np) {
>                 chipid = of_iomap(np, 0);
>                 of_node_put(np);
>         } else if (soc->id) {
>                 chipid = ioremap(family->reg, 4);
> +               reg_type = family->type;
>         }
>         if (chipid) {
>                 product = readl(chipid);
>                 iounmap(chipid);
> -               /* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
> -               if ((product & 0x7fff) == 0x5210)
> -                       product ^= 0x11;
> -               if (soc->id && ((product >> 8) & 0xff) != soc->id) {
> -                       pr_warn("SoC mismatch (product = 0x%x)\n", product);
> -                       return -ENODEV;
> +
> +               if (reg_type == TYPE_PRR) {
> +                       /* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
> +                       if ((product & 0x7fff) == 0x5210)
> +                               product ^= 0x11;
> +                       if (soc->id && ((product >> 8) & 0xff) != soc->id) {
> +                               pr_warn("SoC mismatch (product = 0x%x)\n",
> +                                       product);
> +                               return -ENODEV;
> +                       }
> +               } else if (reg_type == TYPE_BSID) {
> +                       if (soc->id && ((product >> 16) & 0xff) != soc->id) {
> +                               pr_warn("SoC mismatch (product = 0x%x)\n",
> +                                       product);
> +                               return -ENODEV;
> +                       }
>                 }
>         }

The complexity in the code above lies in the handling of both DT and
non-DT based product registers, and the quirk for M3-W ES1.1.
As RZ/A2 will always have it in DT, I think it make sense to simplify it
as e.g.

        np = of_find_compatible_node(NULL, NULL, "renesas,bsid");
        if (np) {
                /* New BSID handling */
                ....
        } else {
                /* Old CCCR/PRR handling for DT and non-DT */
                ...
        }

Perhaps even using "goto done" instead of the "else", so you don't have to
increase indentation of the old code?

> @@ -302,7 +338,7 @@ static int __init renesas_soc_init(void)
>         soc_dev_attr->family = kstrdup_const(family->name, GFP_KERNEL);
>         soc_dev_attr->soc_id = kstrdup_const(strchr(match->compatible, ',') + 1,
>                                              GFP_KERNEL);
> -       if (chipid)
> +       if (chipid && (reg_type == TYPE_PRR))

if you do

        unsigned int eshi = 0, eslo;
        ...
        if (/* CCCR/PRR */) {
                 eshi = ((product >> 4) & 0x0f) + 1;
                 eslo = product & 0xf;
        }

then you can replace the check by

        if (eshi)

>                 soc_dev_attr->revision = kasprintf(GFP_KERNEL, "ES%u.%u",
>                                                    ((product >> 4) & 0x0f) + 1,
>                                                    product & 0xf);

and format eshi, eslo.

BTW, the top four bits of BSID seem to indicate the chip version.
Perhaps that corresponds to the ES version on R-Car?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
