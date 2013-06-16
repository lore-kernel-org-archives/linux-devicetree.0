From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] pinctrl: rockchip: correctly handle arguments of
 pinconf options
Date: Sun, 16 Jun 2013 12:35:43 +0200
Message-ID: <CACRpkdY6pmS=5rphvYdt_8yKYJq8ADu0omy48ncZ3LFtEUf7yg@mail.gmail.com>
References: <201306141741.46077.heiko@sntech.de>
	<201306141744.21117.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306141744.21117.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, James Hogan <james.hogan@imgtec.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2013 at 5:44 PM, Heiko St=FCbner <heiko@sntech.de> wrot=
e:

> Change the rockchip pinctrl driver to handle the arguments of 0 or 1 =
to
> the pull pinconfig options correctly, so that the pull gets disabled =
when
> either the bias_disable options is set or the pull option has the arg=
ument 0.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Patch applied so we can move ahead but:

>         case PIN_CONFIG_BIAS_PULL_UP:
>         case PIN_CONFIG_BIAS_PULL_DOWN:
>         case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
> +               if (!rockchip_pinconf_pull_valid(info->ctrl, param))
> +                       return -ENOTSUPP;
> +
> +               if (!arg)
> +                       param =3D PIN_CONFIG_BIAS_DISABLE;

This is what I think is counter-intuitive.

Can't you rely on the bias-disable here instead?

> -               *config =3D 0;
> +               pull =3D rockchip_get_pull(bank, pin - bank->pin_base=
);
> +               *config =3D (pull =3D=3D param) ? 1 : 0;

And then I guess you should emit PIN_CONFIG_BIAS_DISABLE
here as well.

Yours,
Linus Walleij
