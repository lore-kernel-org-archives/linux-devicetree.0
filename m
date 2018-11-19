From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 04/16] arm: dts: Add devicetree for RDA8810PL SoC
Date: Mon, 19 Nov 2018 12:25:58 -0600
Message-ID: <CAL_JsqLf_9ryCUtUkkE6P4GS8tC7nQ0pLHwLCQzy_HLJNTNMrw@mail.gmail.com>
References: <20181119170939.19153-1-manivannan.sadhasivam@linaro.org> <20181119170939.19153-5-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181119170939.19153-5-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, zhao_steven@263.net, service@rdamicro.com, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 19, 2018 at 11:11 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Add initial device tree for RDA8810PL SoC from RDA Microelectronics.
>
> Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/rda8810pl.dtsi | 95 ++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rda8810pl.dtsi
>
> diff --git a/arch/arm/boot/dts/rda8810pl.dtsi b/arch/arm/boot/dts/rda8810=
pl.dtsi
> new file mode 100644
> index 000000000000..7f1ff2021eff
> --- /dev/null
> +++ b/arch/arm/boot/dts/rda8810pl.dtsi
> @@ -0,0 +1,95 @@
> +/*
> + * RDA8810PL SoC
> + *
> + * Copyright (c) 2017 Andreas F=C3=A4rber
> + * Copyright (c) 2018 Manivannan Sadhasivam
> + *
> + * SPDX-License-Identifier: (GPL-2.0+ OR MIT)

Goes on 1st line. checkpatch.pl will tell you this.

> + */
> +
> +/ {
> +       compatible =3D "rda,8810pl";
> +       #address-cells =3D <1>;
> +       #size-cells =3D <1>;
> +
> +       aliases {
> +               serial0 =3D &uart0;
> +               serial1 =3D &uart1;
> +               serial2 =3D &uart2;
> +       };
> +
> +       cpus {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               cpu@0 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a5";
> +                       reg =3D <0x0>;
> +               };
> +       };
> +
> +       soc {

soc@0

> +               compatible =3D "simple-bus";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges =3D <0x0 0x0 0x80000000>;
> +
> +               sram@100000 {
> +                       compatible =3D "mmio-sram";
> +                       reg =3D <0x100000 0x10000>;

Based on the address of this and everything else, perhaps you should
move this to the top-level (or another bus node) and then either get
rid of the soc node level or make it start at 0x20000000. Kind of
depends on what the rest of the memory map looks like.

> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges;
> +               };
> +
> +               apb@20800000 {
> +                       compatible =3D "simple-bus";
> +                       reg =3D <0x20800000 0x100000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges =3D <0x0 0x20800000 0x100000>;
> +               };
> +
> +               apb@20900000 {
> +                       compatible =3D "simple-bus";
> +                       reg =3D <0x20900000 0x100000>;

By definition of a simple-bus, it should not have any registers. Or
you should also have a specific compatible.

> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges =3D <0x0 0x20900000 0x100000>;
> +               };
> +
> +               apb@20a00000 {
> +                       compatible =3D "simple-bus";
> +                       reg =3D <0x20a00000 0x100000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       ranges =3D <0x0 0x20a00000 0x100000>;
> +
> +                       uart0: serial@0 {
> +                               compatible =3D "rda,8810pl-uart";
> +                               reg =3D <0x0 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       uart1: serial@10000 {
> +                               compatible =3D "rda,8810pl-uart";
> +                               reg =3D <0x10000 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +
> +                       uart2: serial@90000 {
> +                               compatible =3D "rda,8810pl-uart";
> +                               reg =3D <0x90000 0x1000>;
> +                               status =3D "disabled";
> +                       };
> +               };
> +
> +               l2: cache-controller@21100000 {
> +                       compatible =3D "arm,pl310-cache";
> +                       reg =3D <0x21100000 0x1000>;
> +                       cache-unified;
> +                       cache-level =3D <2>;
> +               };
> +       };
> +};
> --
> 2.17.1
>
