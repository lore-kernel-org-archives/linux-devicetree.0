From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND v2] mfd: sm501: Add device property
Date: Thu, 30 Jun 2016 08:48:00 +0100
Message-ID: <20160630074800.GE1707@dell>
References: <1467219419-22901-1-git-send-email-ysato@users.sourceforge.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467219419-22901-1-git-send-email-ysato@users.sourceforge.jp>
Sender: linux-kernel-owner@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Jun 2016, Yoshinori Sato wrote:

> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  Documentation/devicetree/bindings/mfd/sm501.txt | 45 +++++++++++++++=
++++++++++
>  drivers/mfd/sm501.c                             |  9 +++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/sm501.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/sm501.txt b/Docume=
ntation/devicetree/bindings/mfd/sm501.txt
> new file mode 100644
> index 0000000..9290094
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/sm501.txt
> @@ -0,0 +1,45 @@
> +* SM SM501
> +
> +The SM SM501 is a LCD controller, with proper hardware, it can also
> +drive DVI monitors.
> +
> +Required properties:
> +- compatible : should be "smi,sm501".
> +- reg : contain two entries:
> +    - First entry: System Configuration register
> +    - Second entry: IO space (Display Controller register)
> +- interrupts : SMI interrupt to the cpu should be described here.
> +- interrupt-parent : the phandle for the interrupt controller that
> +  services interrupts for this device.
> +
> +Optional properties:
> +- mode : select a video mode:
> +    <xres>x<yres>[-<bpp>][@<refresh>]
> +- edid : verbatim EDID data block describing attached display.
> +  Data from the detailed timing descriptor will be used to
> +  program the display controller.
> +- little-endian: available on big endian systems, to
> +  set different foreign endian.
> +- big-endian: available on little endian systems, to
> +  set different foreign endian.
> +- smi,devices: function block enable bitmap.
> +	bit0: USB host
> +	bit1: USB slave
> +	bit2: SSP Ch0
> +	bit3: SSP Ch1
> +	bit4: UART Ch0
> +	bit5: UART Ch1
> +	bit6: Accelerator
> +	bit7: AC97
> +	bit8: I2S
> +	bit9: GPIO
> +
> +Example for MPC5200:
> +	display@1,0 {
> +		compatible =3D "smi,sm501";
> +		reg =3D <1 0x00000000 0x00800000
> +		       1 0x03e00000 0x00200000>;
> +		interrupts =3D <1 1 3>;
> +		mode =3D "640x480-32@60";
> +		edid =3D [edid-data];
> +	};
> diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
> index 65cd0d2..e2e3f9b 100644
> --- a/drivers/mfd/sm501.c
> +++ b/drivers/mfd/sm501.c
> @@ -21,6 +21,7 @@
>  #include <linux/pci.h>
>  #include <linux/i2c-gpio.h>
>  #include <linux/slab.h>
> +#include <linux/of.h>
> =20
>  #include <linux/sm501.h>
>  #include <linux/sm501-regs.h>
> @@ -1377,6 +1378,8 @@ static int sm501_plat_probe(struct platform_dev=
ice *dev)
>  {
>  	struct sm501_devdata *sm;
>  	int ret;
> +	struct sm501_platdata private_platdata;
> +	struct sm501_initdata private_initdata;
> =20
>  	sm =3D kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);
>  	if (sm =3D=3D NULL) {
> @@ -1388,6 +1391,12 @@ static int sm501_plat_probe(struct platform_de=
vice *dev)
>  	sm->dev =3D &dev->dev;
>  	sm->pdev_id =3D dev->id;
>  	sm->platdata =3D dev_get_platdata(&dev->dev);
> +	if (!sm->platdata) {
> +		of_property_read_u32(dev->dev.of_node, "smi,devices",
> +				     (u32 *)&private_initdata.devices);
> +		private_platdata.init =3D &private_initdata;
> +		sm->platdata =3D &private_platdata;
> +	}

I've asked about this 3 times now.

What consumes this platform data?

It also looks ugly and fragile.

>  	ret =3D platform_get_irq(dev, 0);
>  	if (ret < 0) {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
