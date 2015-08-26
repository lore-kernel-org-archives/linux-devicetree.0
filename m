From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: DT: STi: STiH407: Add c8sectpfe LinuxDVB DT
 node.
Date: Wed, 26 Aug 2015 08:30:41 +0100
Message-ID: <20150826073041.GT19409@x1>
References: <1440519730-486-1-git-send-email-peter.griffin@linaro.org>
 <1440519730-486-3-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440519730-486-3-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 25 Aug 2015, Peter Griffin wrote:

> This patch adds in the required DT node for the c8sectpfe
> Linux DVB demux driver which allows the tsin channels
> to be used on an upstream kernel.
>=20
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/boot/dts/stihxxx-b2120.dtsi | 38 ++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts=
/stihxxx-b2120.dtsi
> index 62994ae..1bc018e 100644
> --- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
> +++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
> @@ -6,6 +6,10 @@
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>   */
> +
> +#include <dt-bindings/clock/stih407-clks.h>
> +#include <dt-bindings/media/c8sectpfe.h>
> +

Looks like some of the STi files are a little wavering on convention,
but I suggest the extra '\n's are superfluous.

>  / {
>  	soc {
>  		sbc_serial0: serial@9530000 {
> @@ -85,5 +89,39 @@
>  			status =3D "okay";
>  		};
> =20
> +		c8sectpfe@08a20000 {

This should be a device type, not a model number.

demodulator@abcdabcd {

> +			compatible =3D "st,stih407-c8sectpfe";

To the uninitiated c8sectpfe is pretty indecipherable.

How about *-c8sectpfe-demod?

> +			status =3D "okay";
> +			reg =3D <0x08a20000 0x10000>, <0x08a00000 0x4000>;
> +			reg-names =3D "c8sectpfe", "c8sectpfe-ram";
> +
> +			interrupts =3D <0 34 0>, <0 35 0>;

Please use the predetermined DEFINES for the flags cell.

> +			interrupt-names =3D "c8sectpfe-error-irq",
> +					  "c8sectpfe-idle-irq";
> +
> +			pinctrl-names	=3D "tsin0-serial", "tsin0-parallel",
> +					  "tsin3-serial", "tsin4-serial",
> +					  "tsin5-serial";

I would put *-names *under* the properties they pertain to and in the
same format i.e. one per line in this case, for easy eye-match.

> +			pinctrl-0	=3D <&pinctrl_tsin0_serial>;
> +			pinctrl-1	=3D <&pinctrl_tsin0_parallel>;
> +			pinctrl-2	=3D <&pinctrl_tsin3_serial>;
> +			pinctrl-3	=3D <&pinctrl_tsin4_serial_alt3>;
> +			pinctrl-4	=3D <&pinctrl_tsin5_serial_alt1>;
> +
> +			clocks =3D <&clk_s_c0_flexgen CLK_PROC_STFE>;
> +			clock-names =3D "c8sectpfe";
> +
> +			/* tsin0 is TSA on NIMA */
> +			tsin0: port@0 {
> +

Why the '\n'?

> +				tsin-num =3D <0>;
> +				serial-not-parallel;
> +				i2c-bus =3D <&ssc2>;

If you are adding this property, I would get Wolfram or one of the DT
guys to Ack it.

> +				rst-gpio =3D <&pio15 4 0>;

Why not use the whole name "reset"?

"-gpio" should be "-gpios".

So, in full: "reset-gpios"?

=46lags: GPIO_ACTIVE_HIGH ?

> +				dvb-card =3D <STV0367_TDA18212_NIMA_1>;
> +			};
> +		};
>  	};
>  };

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
