From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V4 1/3] mfd: add support for ams AS3722 PMIC
Date: Wed, 2 Oct 2013 16:52:41 +0100
Message-ID: <20131002155241.GN9048@lee--X1>
References: <1380729030-25896-1-git-send-email-ldewangan@nvidia.com>
 <1380729030-25896-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1380729030-25896-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Florian Lobmaier <florian.lobmaier-QzQKeY2x7wg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 02 Oct 2013, Laxman Dewangan wrote:

> The ams AS3722 is a compact system PMU suitable for mobile phones,
> tablets etc. It has 4 DC/DC step-down regulators, 3 DC/DC step-down
> controller, 11 LDOs, RTC, automatic battery, temperature and
> over-current monitoring, 8 GPIOs, ADC and a watchdog.
>=20
> Add MFD core driver for the AS3722 to support core functionality.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Florian Lobmaier <florian.lobmaier-QzQKeY2x7wg@public.gmane.org>
> ---
> Changes from V1:
> - Remove compatible string from DT for subnode.
> - Nit cleanups in driver and use module_i2c_driver
>        =20
> Changes from V2:
> - Change DT file to reflect the changes in gpio/pincntrl driver.
>   Now there is no extra subnode.
>=20
> Changes from V3:
> - Combine DT of pincontrol and regulator to mfd.
> - Nits cleanups.
> - AMS to ams.
>=20
>  Documentation/devicetree/bindings/mfd/as3722.txt |  174 +++++++++
>  drivers/mfd/Kconfig                              |   12 +
>  drivers/mfd/Makefile                             |    1 +
>  drivers/mfd/as3722.c                             |  449 ++++++++++++=
++++++++++
>  include/linux/mfd/as3722.h                       |  423 ++++++++++++=
++++++++
>  5 files changed, 1059 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/as3722.txt
>  create mode 100644 drivers/mfd/as3722.c
>  create mode 100644 include/linux/mfd/as3722.h

<snip>

> +Required properties:
> +-------------------
> +- compatible: Must be "ams,as3722".
> +- reg: I2C device address.
> +- interrupt-controller: AS3722 has internal interrupt controller whi=
ch takes the
> +  interrupt request from  internal sub-blocks like RTC, regulators,

Silly nit: Attention to detail 'from..internal'.

> GPIOs as well

>80 chars

> +  as external input.
> +- #interrupt-cells: Should be set to 2 for IRQ number and flags.
> +  The first cell is the IRQ number.
> +  The second cell is the flags, encoded as the trigger masks from bi=
nding document

>80 chars

<snip>

> +Optional properties:
> +-------------------
> +The input supply of regulators are the optional properties on the
> +regulator node. The input supply of these regulators are provided
> +through following properties:
> +vsup-sd2-supply: Input supply for SD2.
> +vsup-sd3-supply: Input supply for SD3.
> +vsup-sd4-supply: Input supply for SD4.
> +vsup-sd5-supply: Input supply for SD5.
> +vin-ldo0-supply: Input supply for LDO0.
> +vin-ldo1-6-supply: Input supply for LDO1 and LDO6.
> +vin-ldo2-5-7-supply: Input supply for LDO2, LDO5 and LDO7.
> +vin-ldo3-4-supply: Input supply for LDO3 and LDO4.
> +vin-ldo9-10-supply: Input supply for LDO9 and LDO10.
> +vin-ldo11-supply: Input supply for LDO11.

Perhaps some indentation would be good here.

> +Optional sub nodes:
> +-----------------
> +	The subnodes name is the name of regulator and it must be one of:
> +	sd[0-6], ldo[0-7], ldo[9-11]
> +
> +	Each sub-node should contain the constraints and initialization
> +	information for that regulator. See regulator.txt for a description
> +	of standard properties for these sub-nodes.
> +	Additional custom properties  are listed below.

Silly nit: Attention to detail 'properties..are'.

<snip>

Besides all that stuff that's actually not all that important, the
code looks pretty good to me.

=46or the !DT MFD stuff:

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
