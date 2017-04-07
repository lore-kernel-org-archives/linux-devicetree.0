From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: aspeed: add SPI controller bindings to Romulus
Date: Fri, 7 Apr 2017 11:20:07 +0930
Message-ID: <CACPK8Xc4yNRe4RsAd+M+WuEpfjcHAULfGirDvAUB4eMcj_h20g@mail.gmail.com>
References: <1490198683-5796-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490198683-5796-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 23, 2017 at 2:34 AM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote=
:
> Romulus systems have one MX25L25635 (32768 Kbytes) flash module for
> the BMC firmware and other MT25QL512A (65536 Kbytes) for the host.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>

Thanks, applied.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-romulus.dts
> index 7a3b2b50c884..e3c6358bc7d9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -31,6 +31,26 @@
>         };
>  };
>
> +&fmc {
> +       status =3D "okay";
> +       flash@0 {
> +               status =3D "okay";
> +               label =3D "bmc";
> +       };
> +};
> +
> +&spi1 {
> +       status =3D "okay";
> +       flash@0 {
> +               status =3D "okay";
> +               label =3D "pnor";
> +       };
> +};
> +
> +&spi2 {
> +       status =3D "okay";
> +};
> +
>  &uart5 {
>         status =3D "okay";
>  };
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
