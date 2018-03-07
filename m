From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 2/5] MIPS: mscc: add ocelot dtsi
Date: Wed, 7 Mar 2018 10:08:28 -0600
Message-ID: <CAL_JsqKzEUO1DiaVtw8vBtiO9Xw7_5EprrC8z3C9JA6bFq1KmQ@mail.gmail.com>
References: <20180306121607.1567-1-alexandre.belloni@bootlin.com> <20180306121607.1567-3-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180306121607.1567-3-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Allan Nielsen <Allan.Nielsen@microsemi.com>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 6, 2018 at 6:16 AM, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> Add a device tree include file for the Microsemi Ocelot SoC.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  arch/mips/boot/dts/Makefile         |   1 +
>  arch/mips/boot/dts/mscc/Makefile    |   1 +
>  arch/mips/boot/dts/mscc/ocelot.dtsi | 117 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 119 insertions(+)
>  create mode 100644 arch/mips/boot/dts/mscc/Makefile
>  create mode 100644 arch/mips/boot/dts/mscc/ocelot.dtsi
>
> diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
> index e2c6f131c8eb..1e79cab8e269 100644
> --- a/arch/mips/boot/dts/Makefile
> +++ b/arch/mips/boot/dts/Makefile
> @@ -4,6 +4,7 @@ subdir-y        += cavium-octeon
>  subdir-y       += img
>  subdir-y       += ingenic
>  subdir-y       += lantiq
> +subdir-y       += mscc
>  subdir-y       += mti
>  subdir-y       += netlogic
>  subdir-y       += ni
> diff --git a/arch/mips/boot/dts/mscc/Makefile b/arch/mips/boot/dts/mscc/Makefile
> new file mode 100644
> index 000000000000..dd08e63a10ba
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/Makefile
> @@ -0,0 +1 @@
> +obj-y                          += $(patsubst %.dtb, %.dtb.o, $(dtb-y))
> diff --git a/arch/mips/boot/dts/mscc/ocelot.dtsi b/arch/mips/boot/dts/mscc/ocelot.dtsi
> new file mode 100644
> index 000000000000..8c3210577410
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/ocelot.dtsi
> @@ -0,0 +1,117 @@
> +//SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2017 Microsemi Corporation */
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       compatible = "mscc,ocelot";
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu@0 {
> +                       compatible = "mips,mips24KEc";
> +                       device_type = "cpu";
> +                       clocks = <&cpu_clk>;
> +                       reg = <0>;
> +               };
> +       };
> +
> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       cpuintc: interrupt-controller@0 {

Please compile with W=1 and fix any issues like this one which is a
unit-address without a reg property. Drop the unit-address.

> +               #address-cells = <0>;
> +               #interrupt-cells = <1>;
> +               interrupt-controller;
> +               compatible = "mti,cpu-interrupt-controller";
