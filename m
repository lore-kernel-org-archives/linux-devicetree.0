From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 08/16] arm: dts: rda8810pl: Add interrupt controller support
Date: Mon, 19 Nov 2018 12:29:07 -0600
Message-ID: <CAL_JsqL3B3y3hYv-yf3wzXiUsvnM9pCYE7u_Y0i4zT7wFti5GA@mail.gmail.com>
References: <20181119170939.19153-1-manivannan.sadhasivam@linaro.org> <20181119170939.19153-9-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119170939.19153-9-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, zhao_steven@263.net, service@rdamicro.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2018 at 11:11 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Add interrupt controller support for RDA Micro RDA8810PL SoC.

There's no point in splitting this to a separate patch. Without it,
the DT is not functional.

> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/rda8810pl.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/rda8810pl.dtsi b/arch/arm/boot/dts/rda8810=
pl.dtsi
> index 7f1ff2021eff..093d6980bfbd 100644
> --- a/arch/arm/boot/dts/rda8810pl.dtsi
> +++ b/arch/arm/boot/dts/rda8810pl.dtsi
> @@ -9,6 +9,7 @@
>
>  / {
>         compatible =3D "rda,8810pl";
> +       interrupt-parent =3D <&intc>;
>         #address-cells =3D <1>;
>         #size-cells =3D <1>;
>
> @@ -49,6 +50,13 @@
>                         #address-cells =3D <1>;
>                         #size-cells =3D <1>;
>                         ranges =3D <0x0 0x20800000 0x100000>;
> +
> +                       intc: interrupt-controller {


unit-address?

> +                               compatible =3D "rda,8810pl-intc";
> +                               reg =3D <0x0 0x1000>;
> +                               interrupt-controller;
> +                               #interrupt-cells =3D <2>;
> +                       };
>                 };
>
>                 apb@20900000 {
> --
> 2.17.1
>
