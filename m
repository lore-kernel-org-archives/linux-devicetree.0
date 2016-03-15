From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 5/5] gpio: of: Add support to have multiple gpios in gpio-hog
Date: Tue, 15 Mar 2016 15:21:43 +0100
Message-ID: <CACRpkdaoKeKAJX1mOD2v1rG_5ZVjAo66agoZrs6E606syUDLSQ@mail.gmail.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com>
	<1457703804-3016-6-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457703804-3016-6-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Markus Pargmann <mpa@pengutronix.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <treding@nvidia.com>, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 11, 2016 at 2:43 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> The child node for gpio hogs under gpio controller's node
> provide the mechanism to automatic GPIO request and
> configuration as part of the gpio-controller's driver
> probe function.
>
> Currently, property "gpio" takes one gpios for such
> configuration. Add support to have multiple GPIOs in
> this property so that multiple GPIOs of gpio-controller
> can be configured by this mechanism with one child node.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Benoit Parrot <bparrot@ti.com>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
>
> ---
> Changes from V1:
> - Add "labels" property for GPIO label names.

Actually it's just "label" as seen from the code and the binding.
Though it would make sense to have labels (pluralis) as it can be more
than one and accompanies "gpios" which is plural.

Rob: what is the pattern here?

(Grep the existing bindings to check how multiple labels are handled
in other subsystems...)

(...)
> -       if (name && of_property_read_string(np, "line-name", name))
> -               *name = np->name;
> +       if (!name)
> +               goto out;
>
> +       ret = of_property_read_string(np, "line-name", name);
> +       if (ret)
> +               ret = of_property_read_string_index(np, "label", gpio_index,
> +                                                   name);
> +       if (ret)
> +               *name = np->name;

This looks to me like if "line-name" is specified, all lines will get the
same name if gpios contain more than one item. Is this what we want?

Yours,
Linus Walleij
