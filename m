MIME-Version: 1.0
Date: Fri, 9 Aug 2019 16:34:45 -0600
References: <20190809173321.19944-1-marek.vasut@gmail.com>
In-Reply-To: <20190809173321.19944-1-marek.vasut@gmail.com>
Message-ID: <CAL_JsqJyYQ99ENOkNd6yzn1eYwLTGLNihFxtovSPJajtF9SVvg@mail.gmail.com>
Subject: Re: [PATCH] of: Fix of_empty_ranges_quirk()
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Frank Rowand <frowand.list@gmail.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 9, 2019 at 11:33 AM <marek.vasut@gmail.com> wrote:
>
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
> types, which cannot work well.

It never returns a negative. The negative is used as an uninitialized
flag. Note quirk_state is static.

> Replace that with boolean only and fix
> usage logic in of_translate_one() -- the check should trigger when the
> ranges are NULL and the quirk is applicable on the hardware.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
>  drivers/of/address.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index b492176c0572..ae2819e148b8 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -616,7 +616,7 @@ static struct of_bus *of_match_bus(struct device_node *np)
>         return NULL;
>  }
>
> -static int of_empty_ranges_quirk(struct device_node *np)
> +static bool of_empty_ranges_quirk(struct device_node *np)
>  {
>         if (IS_ENABLED(CONFIG_PPC)) {
>                 /* To save cycles, we cache the result for global "Mac" setting */
> @@ -631,7 +631,8 @@ static int of_empty_ranges_quirk(struct device_node *np)
>                         quirk_state =
>                                 of_machine_is_compatible("Power Macintosh") ||
>                                 of_machine_is_compatible("MacRISC");
> -               return quirk_state;
> +               if (quirk_state > 0)
> +                       return true;
>         }
>         return false;
>  }
> @@ -662,8 +663,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
>          * This code is only enabled on powerpc. --gcl
>          */
>         ranges = of_get_property(parent, rprop, &rlen);
> -       if (ranges == NULL && !of_empty_ranges_quirk(parent)) {
> -               pr_debug("no ranges; cannot translate\n");
> +       if (ranges == NULL && of_empty_ranges_quirk(parent)) {
> +               pr_err("no ranges; cannot translate\n");

This is wrong. If you have NULL ranges and not the quirk, then no
ranges is an error. IOW, if you are getting an error here, you have an
error in your DT (because I assume you are not working on a PASemi or
Apple system).

Rob
