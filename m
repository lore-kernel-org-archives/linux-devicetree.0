From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon-usb-gpio: add enable pin support
Date: Fri, 11 Dec 2015 13:05:43 +0900
Message-ID: <566A4B97.7080801@samsung.com>
References: <4393960.B6dD3UkQy3@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-reply-to: <4393960.B6dD3UkQy3@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On 2015=EB=85=84 12=EC=9B=94 11=EC=9D=BC 08:07, Sergei Shtylyov wrote:
> Sometimes  there's a real  OTG chip behind the USB ID signal mapped t=
o a GPIO
> pin: in my case it's Maxim Integrated MAX3355E which  integrates Vbus=
 charge
> pump and comparators and passes  thru the ID  signal  from an OTG con=
nector.

s/thru/through ?

> This chip also has the SHDN# pin which  should be  driven high for th=
e normal
> operation  and low to  save power;  it  is connected to a GPIO pin as=
 well on,
> hence  we'll have  to  teach the driver to parse the new optional dev=
ice tree
> property, "enable-gpio"...

This patch description includes the double space between words. Also, I=
 think
you need to write the patch description again for formal style.

This patch adds the specific 'enable-gpio' pin to express the SHDN#pin =
for MAX3355E.
I think it is not regular and standard case because maybe USB specifica=
tion
don't include the SHDN#pin information. I think it not appropriate way.
Instead, you better to make the MAX3355 extcon driver to support this c=
ase.

Thanks,
Chanwoo=20

>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>=20
> ---
> The patch is against the 'extcon-next' branch of the 'extcon.git' rep=
o.
>=20
>  Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt |    3 =
+++
>  drivers/extcon/extcon-usb-gpio.c                             |    5 =
+++++
>  2 files changed, 8 insertions(+)
>=20
> Index: extcon/Documentation/devicetree/bindings/extcon/extcon-usb-gpi=
o.txt
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- extcon.orig/Documentation/devicetree/bindings/extcon/extcon-usb-g=
pio.txt
> +++ extcon/Documentation/devicetree/bindings/extcon/extcon-usb-gpio.t=
xt
> @@ -7,6 +7,9 @@ Required properties:
>  - compatible: Should be "linux,extcon-usb-gpio"
>  - id-gpio: gpio for USB ID pin. See gpio binding.
> =20
> +Optional properties:
> +- enable-gpio: gpio for the enable pin. See gpio binding.
> +
>  Example: Examples of extcon-usb-gpio node in dra7-evm.dts as listed =
below:
>  	extcon_usb1 {
>  		compatible =3D "linux,extcon-usb-gpio";
> Index: extcon/drivers/extcon/extcon-usb-gpio.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- extcon.orig/drivers/extcon/extcon-usb-gpio.c
> +++ extcon/drivers/extcon/extcon-usb-gpio.c
> @@ -33,6 +33,7 @@ struct usb_extcon_info {
>  	struct device *dev;
>  	struct extcon_dev *edev;
> =20
> +	struct gpio_desc *enable_gpiod;
>  	struct gpio_desc *id_gpiod;
>  	int id_irq;
> =20
> @@ -99,6 +100,8 @@ static int usb_extcon_probe(struct platf
>  		return -ENOMEM;
> =20
>  	info->dev =3D dev;
> +	info->enable_gpiod =3D devm_gpiod_get_optional(&pdev->dev, "enable"=
,
> +						     GPIOD_OUT_HIGH);
>  	info->id_gpiod =3D devm_gpiod_get(&pdev->dev, "id", GPIOD_IN);
>  	if (IS_ERR(info->id_gpiod)) {
>  		dev_err(dev, "failed to get ID GPIO\n");
> @@ -155,6 +158,8 @@ static int usb_extcon_remove(struct plat
> =20
>  	cancel_delayed_work_sync(&info->wq_detcable);
> =20
> +	gpiod_set_value_cansleep(info->enable_gpiod, 0);
> +
>  	return 0;
>  }
> =20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>=20
>=20

