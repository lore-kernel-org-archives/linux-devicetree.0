Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from office2.cesnet.cz ([195.113.144.244]:56556 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753624AbeBSVYk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 16:24:40 -0500
From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Subject: Re: [PATCH v4 1/3] pinctrl: mcp23s08: fix probing of mcp23s18
Date: Mon, 19 Feb 2018 22:24:37 +0100
MIME-Version: 1.0
Message-ID: <30843485-da3c-48b0-92b1-807058e1ad94@cesnet.cz>
In-Reply-To: <1519032320-103817-2-git-send-email-preid@electromag.com.au>
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
 <1519032320-103817-2-git-send-email-preid@electromag.com.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On pond=C4=9Bl=C3=AD 19. =C3=BAnora 2018 10:25:18 CET, Phil Reid wrote:
> one_regmap_config is always null if mcp type is MCP_TYPE_S18.
> Remove the null check so that the mcp23s18 will probe.
>
> Fixes: 1781af563aef66c2eb7cda ("pinctrl: mcp23s08: spi: Fix
> duplicate pinctrl debugfs entries")
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Thanks, and sorry for this mistake.

Reviewed-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
Fixes: 9b3e4207661e ("pinctrl: mcp23s08: spi: Fix regmap debugfs entries")

> ---
>  drivers/pinctrl/pinctrl-mcp23s08.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c=20
> b/drivers/pinctrl/pinctrl-mcp23s08.c
> index f3f9f19..83277570 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -823,8 +823,6 @@ static int mcp23s08_probe_one(struct=20
> mcp23s08 *mcp, struct device *dev,
>  =09=09break;
> =20
>  =09case MCP_TYPE_S18:
> -=09=09if (!one_regmap_config)
> -=09=09=09return -ENOMEM;
>  =09=09mcp->regmap =3D devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
>  =09=09=09=09=09       &mcp23x17_regmap);
>  =09=09mcp->reg_shift =3D 1;

