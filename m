Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <469dfad07762787ea2cf446d71d355c0b5d969b3.1523863527.git.viresh.kumar@linaro.org>
References: <469dfad07762787ea2cf446d71d355c0b5d969b3.1523863527.git.viresh.kumar@linaro.org>
Message-ID: <152389202198.51482.3779874474342173946@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH V2] of: Don't create device for OPP tables
Date: Mon, 16 Apr 2018 08:20:21 -0700
To: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Quoting Viresh Kumar (2018-04-16 00:26:21)
> ---
> V1->V2:
> - Added Reviewed-by from Stephen.

Ok

> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index c00d81dfac0b..93aff2bf56f9 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -32,6 +32,11 @@ const struct of_device_id of_default_bus_match_table[]=
 =3D {
>         {} /* Empty terminated list */
>  };
>  =

> +const struct of_device_id of_skipped_node_table[] =3D {

static?

> +       { .compatible =3D "operating-points-v2", },
> +       {} /* Empty terminated list */
> +};
> +
>  static int of_dev_node_match(struct device *dev, void *data)
>  {
>         return dev->of_node =3D=3D data;
