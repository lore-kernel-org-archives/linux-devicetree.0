MIME-Version: 1.0
Date: Mon, 9 Sep 2019 18:37:24 +0100
References: <20190907161537.27258-1-marek.vasut@gmail.com>
In-Reply-To: <20190907161537.27258-1-marek.vasut@gmail.com>
Message-ID: <CAL_JsqJk40bRhvrtjtpCzhm_jTX=D5pEgWHd8csrVDn77nwWvQ@mail.gmail.com>
Subject: Re: [PATCH V2] of: Fix of_empty_ranges_quirk()
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Frank Rowand <frowand.list@gmail.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, Sep 7, 2019 at 5:15 PM <marek.vasut@gmail.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
> types, which cannot work well. Replace that with boolean only and fix
> usage logic in of_translate_one() -- the check should trigger when the
> ranges are NULL and the quirk is applicable on the hardware.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Rename of_empty_ranges_quirk() to of_missing_ranges_is_ok()
>     - Move comment into the of_missing_ranges_is_ok() function
>     - Make of_missing_ranges_is_ok() a bit more readable by adding
>       a variable marking the quirk_state as initialized.
>     - Reinstate check for !of_missing_ranges_is_ok() in of_translate_one()
> ---
>  drivers/of/address.c | 47 ++++++++++++++++++++++++--------------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 978427a9d5e6..df82ef88823f 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -473,21 +473,42 @@ static struct of_bus *of_match_bus(struct device_node *np)
>         return NULL;
>  }
>
> -static int of_empty_ranges_quirk(struct device_node *np)
> +static bool of_missing_ranges_is_ok(struct device_node *np)
>  {
> +       /*
> +        * Normally, an absence of a "ranges" property means we are
> +        * crossing a non-translatable boundary, and thus the addresses
> +        * below the current cannot be converted to CPU physical ones.
> +        * Unfortunately, while this is very clear in the spec, it's not
> +        * what Apple understood, and they do have things like /uni-n or
> +        * /ht nodes with no "ranges" property and a lot of perfectly
> +        * useable mapped devices below them. Thus we treat the absence of
> +        * "ranges" as equivalent to an empty "ranges" property which means
> +        * a 1:1 translation at that level. It's up to the caller not to try
> +        * to translate addresses that aren't supposed to be translated in
> +        * the first place. --BenH.
> +        *
> +        * As far as we know, this damage only exists on Apple machines, so
> +        * This code is only enabled on powerpc.

You dropped Grant's name on this. Wouldn't matter too much as we can
run 'git blame', but now we have another level to trace back thru.

> +        */
> +
>         if (IS_ENABLED(CONFIG_PPC)) {
>                 /* To save cycles, we cache the result for global "Mac" setting */
> -               static int quirk_state = -1;
> +               static int quirk_state_initialized;

This can be bool too.

> +               static bool quirk_state;
>
>                 /* PA-SEMI sdc DT bug */
>                 if (of_device_is_compatible(np, "1682m-sdc"))
>                         return true;
>
>                 /* Make quirk cached */
> -               if (quirk_state < 0)
> +               if (!quirk_state_initialized) {
> +                       quirk_state_initialized = 1;
>                         quirk_state =
>                                 of_machine_is_compatible("Power Macintosh") ||
>                                 of_machine_is_compatible("MacRISC");
> +               }
> +
>                 return quirk_state;
>         }
>         return false;
> @@ -502,25 +523,9 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>         int rone;
>         u64 offset = OF_BAD_ADDR;
>
> -       /*
> -        * Normally, an absence of a "ranges" property means we are
> -        * crossing a non-translatable boundary, and thus the addresses
> -        * below the current cannot be converted to CPU physical ones.
> -        * Unfortunately, while this is very clear in the spec, it's not
> -        * what Apple understood, and they do have things like /uni-n or
> -        * /ht nodes with no "ranges" property and a lot of perfectly
> -        * useable mapped devices below them. Thus we treat the absence of
> -        * "ranges" as equivalent to an empty "ranges" property which means
> -        * a 1:1 translation at that level. It's up to the caller not to try
> -        * to translate addresses that aren't supposed to be translated in
> -        * the first place. --BenH.
> -        *
> -        * As far as we know, this damage only exists on Apple machines, so
> -        * This code is only enabled on powerpc. --gcl
> -        */
>         ranges = of_get_property(parent, rprop, &rlen);
> -       if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
> -               pr_debug("no ranges; cannot translate\n");
> +       if (ranges == NULL && !of_missing_ranges_is_ok(parent)) {
> +               pr_err("no ranges; cannot translate\n");
>                 return 1;
>         }
>         if (ranges == NULL || rlen == 0) {
> --
> 2.23.0.rc1
>
