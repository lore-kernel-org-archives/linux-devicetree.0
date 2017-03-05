From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: add SPI controller bindings
Date: Mon, 6 Mar 2017 09:43:45 +1030
Message-ID: <CACPK8XeaSh8MVTfPjwt=+NBPWCkMK7QqpAXF7+BYYQBViVSNKg@mail.gmail.com>
References: <1488378403-24640-1-git-send-email-clg@kaod.org> <1488378403-24640-2-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1488378403-24640-2-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Cedric,

On Thu, Mar 2, 2017 at 12:56 AM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote=
:
> Let's define the SPI controllers in the Aspeed SoCs AST2500 and
> AST2400 and also enable these, as well as the chips, on the associated
> platforms.

Thanks for this. Was there a reason you didn't modify the romulus dts as we=
ll?

Cheers,

Joel

>
> Signed-off-by: C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
> ---
>  arch/arm/boot/dts/aspeed-ast2500-evb.dts      | 20 +++++++++
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 16 +++++++
>  arch/arm/boot/dts/aspeed-g4.dtsi              | 29 ++++++++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi              | 63 +++++++++++++++++++++=
++++++
>  4 files changed, 128 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts=
/aspeed-ast2500-evb.dts
> index d967603dade8..8f82e8ab1875 100644
> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
> @@ -20,6 +20,26 @@
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
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boo=
t/dts/aspeed-bmc-opp-palmetto.dts
> index 1d2fc1e1dc29..aab1889f702f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -31,6 +31,22 @@
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
> +&spi {
> +       status =3D "okay";
> +       flash@0 {
> +               status =3D "okay";
> +               label =3D "pnor";
> +       };
> +};
> +
>  &uart5 {
>         status =3D "okay";
>  };
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-=
g4.dtsi
> index 0b4932cc02a8..7ef6442d0ade 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -33,6 +33,35 @@
>                 #size-cells =3D <1>;
>                 ranges;
>
> +               fmc: flash-controller@1e620000 {
> +                       reg =3D < 0x1e620000 0x94
> +                               0x20000000 0x02000000 >;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       compatible =3D "aspeed,ast2400-fmc";
> +                       status =3D "disabled";
> +                       interrupts =3D <19>;
> +                       flash@0 {
> +                               reg =3D < 0 >;
> +                               compatible =3D "jedec,spi-nor";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               spi: flash-controller@1e630000 {
> +                       reg =3D < 0x1e630000 0x18
> +                               0x30000000 0x02000000 >;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       compatible =3D "aspeed,ast2400-spi";
> +                       status =3D "disabled";
> +                       flash@0 {
> +                               reg =3D < 0 >;
> +                               compatible =3D "jedec,spi-nor";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
>                 vic: interrupt-controller@1e6c0080 {
>                         compatible =3D "aspeed,ast2400-vic";
>                         interrupt-controller;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-=
g5.dtsi
> index b664fe380936..8970f3cb8e2b 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -24,6 +24,69 @@
>                 #size-cells =3D <1>;
>                 ranges;
>
> +               fmc: flash-controller@1e620000 {
> +                       reg =3D < 0x1e620000 0xc4
> +                               0x20000000 0x10000000 >;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       compatible =3D "aspeed,ast2500-fmc";
> +                       status =3D "disabled";
> +                       interrupts =3D <19>;
> +                       flash@0 {
> +                               reg =3D < 0 >;
> +                               compatible =3D "jedec,spi-nor";
> +                               status =3D "disabled";
> +                       };
> +                       flash@1 {
> +                               reg =3D < 1 >;
> +                               compatible =3D "jedec,spi-nor";
> +                               status =3D "disabled";
> +                       };
> +                       flash@2 {
> +                               reg =3D < 2 >;
> +                               compatible =3D "jedec,spi-nor";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               spi1: flash-controller@1e630000 {
> +                       reg =3D < 0x1e630000 0xc4
> +                               0x30000000 0x08000000 >;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       compatible =3D "aspeed,ast2500-spi";
> +                       status =3D "disabled";
> +                       flash@0 {
> +                               reg =3D < 0 >;
> +                               compatible =3D "jedec,spi-nor";
> +                               status =3D "disabled";
> +                       };
> +                       flash@1 {
> +                               reg =3D < 1 >;
> +                               compatible =3D "jedec,spi-nor";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               spi2: flash-controller@1e631000 {
> +                       reg =3D < 0x1e631000 0xc4
> +                               0x38000000 0x08000000 >;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <0>;
> +                       compatible =3D "aspeed,ast2500-spi";
> +                       status =3D "disabled";
> +                       flash@0 {
> +                               reg =3D < 0 >;
> +                               compatible =3D "jedec,spi-nor";
> +                               status =3D "disabled";
> +                       };
> +                       flash@1 {
> +                               reg =3D < 1 >;
> +                               compatible =3D "jedec,spi-nor";
> +                               status =3D "disabled";
> +                       };
> +               };
> +
>                 vic: interrupt-controller@1e6c0080 {
>                         compatible =3D "aspeed,ast2400-vic";
>                         interrupt-controller;
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
