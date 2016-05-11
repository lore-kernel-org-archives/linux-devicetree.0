From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: Add support for parsing operation mode
Date: Wed, 11 May 2016 18:53:10 +0800
Message-ID: <CAGS+omBy4neiPwQ60x6m4SRHFUkp_v80t+swQUL8JF45Uph+yw@mail.gmail.com>
References: <1462957929-20105-1-git-send-email-henryc.chen@mediatek.com> <1462957929-20105-2-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462957929-20105-2-git-send-email-henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Henry,

On Wed, May 11, 2016 at 5:12 PM, Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>
> Some regulators support their operating mode to be changed by
> consumers for module specific purpose.
>
> This patch adds support to parse those properties and fill the
> regulator constraints so the regulator core can call the
> regualtor_set_mode to change the modes.
>
> Signed-off-by: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/regulator/regulator.txt | 10 ++++++++++
>  drivers/regulator/of_regulator.c                          | 14 ++++++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Documentation/devicetree/bindings/regulator/regulator.txt
> index ecfc593..88f98f0 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/regulator.txt
> @@ -49,6 +49,16 @@ Optional properties:
>         0: Disable active discharge.
>         1: Enable active discharge.
>         Absence of this property will leave configuration to default.
> +- regulator-allow-change-mode: allow the regulator mode to be configured

As mentioned by broonie earlier, the explicit 'allow' property is
redundant, if regulator-supported-modes is present, then set
REGULATOR_CHANGE_MODE invalid_ops_mask , else leave it clear.

> +- regulator-supported-modes: Regulators can run in a variety of different operating
> +  modes depending on output load. This allows further system power savings by
> +  selecting the best (and most efficient) regulator mode for a desired load.
> +  The definition for each of these operation is defined at
> +  include/linux/regulator/consumer.h
> +       0: FAST.
> +       1: NORMAL.
> +       2: IDLE.
> +       3: STANDBY.
>
>  Deprecated properties:
>  - regulator-compatible: If a regulator chip contains multiple
> diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
> index 6b0aa80..12fe8c8 100644
> --- a/drivers/regulator/of_regulator.c
> +++ b/drivers/regulator/of_regulator.c

Also, I thought binding document changes are generally in a separate
patch from their implementation.

-Dan

> @@ -167,6 +167,20 @@ static void of_get_regulation_constraints(struct device_node *np,
>                 suspend_state = NULL;
>                 suspend_np = NULL;
>         }
> +
> +       if (of_property_read_bool(np, "regulator-allow-change-mode"))
> +               constraints->valid_ops_mask |= REGULATOR_CHANGE_MODE;
> +
> +       ret = of_property_count_elems_of_size(np,
> +                                             "regulator-supported-modes",
> +                                             sizeof(u32));
> +       for (i = 0; i < ret; i++) {
> +               u32 mode;
> +
> +               of_property_read_u32_index(np, "regulator-supported-modes",
> +                                          i, &mode);
> +               constraints->valid_modes_mask |= (1 << mode);
> +       }
>  }
>
>  /**
> --
> 1.8.1.1.dirty
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
