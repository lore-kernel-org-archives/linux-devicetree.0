From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] devicetree: mfd: Add binding for the TI LM3533
Date: Fri, 30 Oct 2015 18:42:20 +0000
Message-ID: <20151030184220.GJ4058@x1>
References: <1445796586-28683-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1445963373-27790-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445963373-27790-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Johan Hovold <jhovold-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 27 Oct 2015, Bjorn Andersson wrote:

> Add the binding for the Texas Instruments LM3533 lighting power
> solution.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> ---
>=20
> Changes since v1:
> - Added unit to boost-freq and als-resistance (as the frequency now c=
omes with
>   a unit specifier I changed it to be expressed in kHz)
>=20
>  Documentation/devicetree/bindings/mfd/lm3533.txt | 183 +++++++++++++=
++++++++++
>  1 file changed, 183 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/lm3533.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/lm3533.txt b/Docum=
entation/devicetree/bindings/mfd/lm3533.txt
> new file mode 100644
> index 000000000000..399df39ec7e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/lm3533.txt
> @@ -0,0 +1,183 @@
> +Texas Instruments LM3533 binding
> +
> +This binding describes the Texas Instruments LM3533, a lighting powe=
r solution
> +for smartphone handsets. The common properties are described directl=
y in the
> +node, while each individual component are described in an optional s=
ubnode.
> +
> +- compatible:
> +	Usage: required
> +	Value type: <stringlist>
> +	Definition: must be:
> +		    "ti,lm3533"
> +
> +- reg:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: i2c address of the LM3533 chip
> +
> +- ti,hwen-gpios:
> +	Usage: required
> +	Value type: <prop-encoded-array>
> +	Definition: reference to gpio pin connected to the HWEN input; as
> +		    specified in "gpio/gpio.txt"

Why have you made this a vendor binding?

*-gpios is a generic property.

> +- ti,als-supply:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: reference to regulator powering the V_als input; as
> +		    specified in "regulator/regulator.txt"

Same goes for *-supply.

> +- ti,boost-freq-khz:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: switch-frequency of the boost converter, must be either=
:
> +		    500 or 1000

Quite a few vendors are using 'boost' now.

Perhaps we need to create a set of generic bindings.

Also, we usually measure DT bindings in HZ, not kHz.

> +- ti,boost-ovp:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: over voltage protection limit, must be one of: 16, 24, =
32
> +		    or 40

Is this in volts?  If so, it should be microvolts.

> +- #address-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 1
> +
> +- #size-cells:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: must be 0
> +
> +=3D ALS SUBNODE
> +The als subnode must be named "als", it carries the als related prop=
erties.

Perfect time to tell us what ALS is/means.

> +- ti,als-resistance-ohm:
> +	Usage: required (unless ti,pwm-mode is specified)
> +	Value type: <u32>
> +	Definition: specifies the resistor value (R_als), in Ohm. Valid val=
ues
> +		    ranges from 200kOhm to 1574Ohm.

Might be worth specifying the values which you are actually going to
use here i.e. "200kOhm" is not a valid u32.

> +- ti,pwm-mode:
> +	Usage: optional
> +	Value type: <empty>
> +	Definition: specifies, if present, that the als should operate in p=
wm

Suggest s/pwm/PWM/

> +		    mode - rather than analog mode
> +
> +=3D BACKLIGHT NODES
> +Backlight subnodes must be named "backlight", they carry the backlig=
ht related
> +properties.
> +
> +- reg:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: specifies which of the two backlights this node corresp=
onds
> +		    to
> +
> +- default-brightness:
> +	Usage: optional
> +	Value type: <32>
> +	Definition: specifies the default brightness for the backlight, in
> +		    units of brightness [0-255]
> +
> +- label:
> +	Usage: required
> +	Value type: <string>
> +	Definition: specifies a name of this backlight
> +
> +- led-max-microamp:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: specifies the max current for this backlight, in uA, as
> +		    described in "leds/common.txt"
> +
> +- ti,pwm-zones:
> +	Usage: optional
> +	Value type: <u32 list>
> +	Definition: lists the ALS zones to be PWM controlled for this backl=
ight,
> +		    the values in the list are in the range [0 - 4]
> +

It's usually a good idea to point to where all of the aforementioned
generic properties are documented.  I personally like the format
(See: ../<subsystem>/<binding>.txt)

> +=3D LED NODES
> +LED subnodes must be named "led", they carry the LED related propert=
ies.
> +
> +- reg:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: specifies which of the four LEDs this node corresponds =
to
> +
> +- linux,default-trigger:
> +	Usage: optional
> +	Value type: <string>
> +	Definition: specifies the default trigger for the LED, as described=
 in
> +		    "leds/common.txt"

No such file.  I think you mean "../leds/common/txt".

> +- label:
> +	Usage: required
> +	Value type: <string>
> +	Definition: specifies a name of this LED, as described in
> +		    "leds/common.txt"
> +
> +- led-max-microamp:
> +	Usage: required
> +	Value type: <u32>
> +	Definition: specifies the max current for this LED, in uA, as descr=
ibed
> +		    in "leds/common.txt"
> +
> +- ti,pwm-zones:
> +	Usage: optional
> +	Value type: <u32 list>
> +	Definition: lists the ALS zones to be PWM controlled for this LED, =
the
> +		    values in the list are in the range [0 - 4]
> +
> +=3D EXAMPLE
> +
> +i2c@12460000 {
> +	compatible =3D "qcom,i2c-qup-v1.1.1";
> +	...
> +
> +	lm3533@36 {
> +		compatible =3D "ti,lm3533";
> +		reg =3D <0x36>;
> +
> +		ti,hwen-gpios =3D <&pm8921_gpio 26 GPIO_ACTIVE_HIGH>;
> +		ti,als-supply =3D <&pm8921_l11>;
> +
> +		ti,boost-freq =3D <500000>;
> +		ti,boost-ovp =3D <24>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		als {
> +			ti,als-resistance =3D <200000>;
> +		};
> +
> +		backlight@0 {
> +			reg =3D <0>;
> +			label =3D "backlight";
> +
> +			led-max-microamp =3D <20200>;
> +		};
> +
> +		led@0 {
> +			reg =3D <0>;
> +			label =3D "red";
> +
> +			led-max-microamp =3D <5000>;
> +		};
> +
> +		led@1 {
> +			reg =3D <1>;
> +			label =3D "green";
> +
> +			led-max-microamp =3D <5000>;
> +		};
> +
> +		led@2 {
> +			reg =3D <2>;
> +			label =3D "blue";
> +
> +			led-max-microamp =3D <5000>;
> +		};
> +	};
> +

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
