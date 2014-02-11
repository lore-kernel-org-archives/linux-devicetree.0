From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 45/47] adv7604: Add DT support
Date: Tue, 11 Feb 2014 13:30:54 +0100
Message-ID: <348032354.Y8BFzPbpC4@avalon>
References: <1391618558-5580-1-git-send-email-laurent.pinchart@ideasonboard.com> <52FA140F.9060200@cisco.com> <52FA15E4.50001@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <52FA15E4.50001@metafoo.de>
Sender: linux-media-owner@vger.kernel.org
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Hans Verkuil <hansverk@cisco.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lars,

On Tuesday 11 February 2014 13:21:56 Lars-Peter Clausen wrote:
> On 02/11/2014 01:14 PM, Hans Verkuil wrote:
> > On 02/11/14 13:08, Laurent Pinchart wrote:
> >> On Tuesday 11 February 2014 10:23:03 Hans Verkuil wrote:
> >>> On 02/05/14 17:42, Laurent Pinchart wrote:
> >>>> Parse the device tree node to populate platform data.
> >>>>=20
> >>>> Cc: devicetree@vger.kernel.org
> >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.c=
om>
> >>>> ---
> >>>>=20
> >>>>   .../devicetree/bindings/media/i2c/adv7604.txt      |  56 +++++=
+++++++
> >>>>   drivers/media/i2c/adv7604.c                        | 101 +++++=
+++++--
> >>>>   2 files changed, 143 insertions(+), 14 deletions(-)
> >>>>   create mode 100644
> >>>>   Documentation/devicetree/bindings/media/i2c/adv7604.txt
> >>>>=20
> >>>> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7604=
=2Etxt
> >>>> b/Documentation/devicetree/bindings/media/i2c/adv7604.txt new fi=
le mode
> >>>> 100644
> >>>> index 0000000..0845c50
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/media/i2c/adv7604.txt
> >>>> @@ -0,0 +1,56 @@
> >>>> +* Analog Devices ADV7604/11 video decoder with HDMI receiver
> >>>> +
> >>>> +The ADV7604 and ADV7611 are multiformat video decoders with an
> >>>> integrated
> >>>> HDMI +receiver. The ADV7604 has four multiplexed HDMI inputs and=
 one
> >>>> analog input, +and the ADV7611 has one HDMI input and no analog =
input.
> >>>> +
> >>>> +Required Properties:
> >>>> +
> >>>> +  - compatible: Must contain one of the following
> >>>> +    - "adi,adv7604" for the ADV7604
> >>>> +    - "adi,adv7611" for the ADV7611
> >>>> +
> >>>> +  - reg: I2C slave address
> >>>> +
> >>>> +  - hpd-gpios: References to the GPIOs that control the HDMI ho=
t-plug
> >>>> +    detection pins, one per HDMI input. The active flag indicat=
es the
> >>>> GPIO
> >>>> +    level that enables hot-plug detection.
> >>>> +
> >>>> +Optional Properties:
> >>>> +
> >>>> +  - reset-gpios: Reference to the GPIO connected to the device'=
s reset
> >>>> pin. +
> >>>> +  - adi,default-input: Index of the input to be configured as d=
efault.
> >>>> Valid +    values are 0..5 for the ADV7604 and 0 for the ADV7611=
=2E
> >>>> +
> >>>> +  - adi,disable-power-down: Boolean property. When set forces t=
he
> >>>> device
> >>>> to +    ignore the power-down pin. The property is valid for the
> >>>> ADV7604
> >>>> only as +    the ADV7611 has no power-down pin.
> >>>> +
> >>>> +  - adi,disable-cable-reset: Boolean property. When set disable=
s the
> >>>> HDMI
> >>>> +    receiver automatic reset when the HDMI cable is unplugged.
> >>>> +
> >>>> +Example:
> >>>> +
> >>>> +	hdmi_receiver@4c {
> >>>> +		compatible =3D "adi,adv7611";
> >>>> +		reg =3D <0x4c>;
> >>>> +
> >>>> +		reset-gpios =3D <&ioexp 0 GPIO_ACTIVE_LOW>;
> >>>> +		hpd-gpios =3D <&ioexp 2 GPIO_ACTIVE_HIGH>;
> >>>> +
> >>>> +		adi,default-input =3D <0>;
> >>>> +
> >>>> +		#address-cells =3D <1>;
> >>>> +		#size-cells =3D <0>;
> >>>> +
> >>>> +		port@0 {
> >>>> +			reg =3D <0>;
> >>>> +		};
> >>>> +		port@1 {
> >>>> +			reg =3D <1>;
> >>>> +			hdmi_in: endpoint {
> >>>> +				remote-endpoint =3D <&ccdc_in>;
> >>>> +			};
> >>>> +		};
> >>>> +	};
> >>>> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv=
7604.c
> >>>> index e586c1c..cd8a2dc 100644
> >>>> --- a/drivers/media/i2c/adv7604.c
> >>>> +++ b/drivers/media/i2c/adv7604.c
> >>>> @@ -32,6 +32,7 @@
> >>>>=20
> >>>>   #include <linux/i2c.h>
> >>>>   #include <linux/kernel.h>
> >>>>   #include <linux/module.h>
> >>>>=20
> >>>> +#include <linux/of_gpio.h>
> >>>>=20
> >>>>   #include <linux/slab.h>
> >>>>   #include <linux/v4l2-dv-timings.h>
> >>>>   #include <linux/videodev2.h>
> >>>>=20
> >>>> @@ -2641,13 +2642,83 @@ static const struct adv7604_chip_info
> >>>> adv7604_chip_info[] =3D {>
> >>>>=20
> >>>>   	},
> >>>>  =20
> >>>>   };
> >>>>=20
> >>>> +static struct i2c_device_id adv7604_i2c_id[] =3D {
> >>>> +	{ "adv7604", (kernel_ulong_t)&adv7604_chip_info[ADV7604] },
> >>>> +	{ "adv7611", (kernel_ulong_t)&adv7604_chip_info[ADV7611] },
> >>>> +	{ }
> >>>> +};
> >>>> +MODULE_DEVICE_TABLE(i2c, adv7604_i2c_id);
> >>>> +
> >>>> +static struct of_device_id adv7604_of_id[] =3D {
> >>>> +	{ .compatible =3D "adi,adv7604", .data =3D &adv7604_chip_info[=
ADV7604] },
> >>>> +	{ .compatible =3D "adi,adv7611", .data =3D &adv7604_chip_info[=
ADV7611] },
> >>>> +	{ }
> >>>> +};
> >>>> +MODULE_DEVICE_TABLE(of, adv7604_of_id);
> >>>> +
> >>>> +static int adv7604_parse_dt(struct adv7604_state *state)
> >>>=20
> >>> Put this under #ifdef CONFIG_OF.
> >>=20
> >> #ifdef CONFIG_OF has been discouraged. I'll add an IS_ENABLED(CONF=
IG_OF)
> >> to condition the call of adv7604_parse_dt() and let the compiler o=
ptimize
> >> the function out, but I've been recommended to fix compilation err=
ors
> >> instead of using conditional compilation.
> >>=20
> >>> It fails to compile if CONFIG_OF is not set (as it is in my case =
since
> >>> this driver is used with a PCIe card).
> >>=20
> >> What's the compilation failure ?
> >=20
> > drivers/media/i2c/adv7604.c: In function =E2=80=98adv7604_parse_dt=E2=
=80=99:
> > drivers/media/i2c/adv7604.c:2671:48: warning: dereferencing =E2=80=98=
void *=E2=80=99
> > pointer [enabled by default]>=20
> >    state->info =3D of_match_node(adv7604_of_id, np)->data;
> >=20
> > drivers/media/i2c/adv7604.c:2671:48: error: request for member =E2=80=
=98data=E2=80=99 in
> > something not a structure or union make[3]: ***
> > [drivers/media/i2c/adv7604.o] Error 1
>=20
> That looks like a bug in the stubbed out version of of_match_node(). =
It
> should be a inline function with a return type, rather than a macro.

Indeed, I'll cook a patch up.

--=20
Regards,

Laurent Pinchart
