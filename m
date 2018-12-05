From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3] ARM: dts: Add support for Liebherr's BK4 device (vf610 based)
Date: Wed, 5 Dec 2018 21:12:46 -0200
Message-ID: <CAOMZO5BN5KJ+s6F9CJXQPX=Ta0Ow0PaV_AmFHYSDNr78jLjziQ@mail.gmail.com>
References: <20180921152726.31742-1-lukma@denx.de> <20181009105028.17971-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181009105028.17971-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>, Rob Herring <robh+dt@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Lukasz/Rob,

On Tue, Oct 9, 2018 at 7:50 AM Lukasz Majewski <lukma@denx.de> wrote:

> +&dspi3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_dspi3>;
> +       bus-num = <3>;
> +       status = "okay";
> +       spi-slave;
> +
> +       slave@0 {
> +               compatible = "lwn,bk4";
> +               spi-max-frequency = <30000000>;
> +               reg = <0>;
> +       };
> +};

This is causing the following dtc warning in linux-next:

  DTC     arch/arm/boot/dts/vf610-bk4.dtb
arch/arm/boot/dts/vfxxx.dtsi:550.24-563.6: Warning (spi_bus_bridge):
/soc/aips-bus@40080000/spi@400ad000: incorrect #address-cells for SPI
bus
  also defined at arch/arm/boot/dts/vf610-bk4.dts:106.8-118.3
arch/arm/boot/dts/vf610-bk4.dtb: Warning (spi_bus_reg): Failed
prerequisite 'spi_bus_bridge'

If spi-slave property is removed the warning is gone.

Looking at drivers/spi/spi-fsl-dspi.c I don't see the "spi-slave"
property being handled there.

Any ideas on how to fix this?

Thanks
