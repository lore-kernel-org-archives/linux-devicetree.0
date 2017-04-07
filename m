From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: aspeed: add a fastread property
Date: Fri, 7 Apr 2017 11:40:25 +0930
Message-ID: <CACPK8XedrYaeBq5P5g0XUzXS6WHzPLwXAMF5V7cp9ntuxC=0hQ@mail.gmail.com>
References: <1491498153-26564-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491498153-26564-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 7, 2017 at 2:32 AM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote:
> All chips on OpenPOWER platforms support the fastread SPI command.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

Thanks, applied.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts      | 2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 2 ++
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts=
/aspeed-ast2500-evb.dts
> index 8f82e8ab1875..7c90dac99822 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -24,6 +24,7 @@
>         status =3D "okay";
>         flash@0 {
>                 status =3D "okay";
> +               m25p,fast-read;
>                 label =3D "bmc";
>         };
>  };
> @@ -32,6 +33,7 @@
>         status =3D "okay";
>         flash@0 {
>                 status =3D "okay";
> +               m25p,fast-read;
>                 label =3D "pnor";
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index aab1889f702f..112551766275 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -35,6 +35,7 @@
>         status =3D "okay";
>         flash@0 {
>                 status =3D "okay";
> +               m25p,fast-read;
>                 label =3D "bmc";
>         };
>  };
> @@ -43,6 +44,7 @@
>         status =3D "okay";
>         flash@0 {
>                 status =3D "okay";
> +               m25p,fast-read;
>                 label =3D "pnor";
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index e3c6358bc7d9..b82f67eb3dae 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -35,6 +35,7 @@
>         status =3D "okay";
>         flash@0 {
>                 status =3D "okay";
> +               m25p,fast-read;
>                 label =3D "bmc";
>         };
>  };
> @@ -43,6 +44,7 @@
>         status =3D "okay";
>         flash@0 {
>                 status =3D "okay";
> +               m25p,fast-read;
>                 label =3D "pnor";
>         };
>  };
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
