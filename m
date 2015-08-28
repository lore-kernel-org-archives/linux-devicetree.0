From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/5] ARM: DT: STi: STiH407: Add c8sectpfe LinuxDVB DT
 node.
Date: Fri, 28 Aug 2015 08:01:00 +0100
Message-ID: <20150828070100.GF4796@x1>
References: <1440678575-21646-1-git-send-email-peter.griffin@linaro.org>
 <1440678575-21646-3-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440678575-21646-3-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, mchehab@osg.samsung.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 27 Aug 2015, Peter Griffin wrote:

> This patch adds in the required DT node for the c8sectpfe
> Linux DVB demux driver which allows the tsin channels
> to be used on an upstream kernel.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stihxxx-b2120.dtsi | 34 ++++++++++++++++++++++++++=
++++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts=
/stihxxx-b2120.dtsi
> index 62994ae..c014173 100644
> --- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
> +++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
> @@ -6,6 +6,9 @@
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>   */
> +
> +#include <dt-bindings/clock/stih407-clks.h>
> +#include <dt-bindings/media/c8sectpfe.h>
>  / {
>  	soc {
>  		sbc_serial0: serial@9530000 {
> @@ -85,5 +88,36 @@
>  			status =3D "okay";
>  		};
> =20
> +		demux@08a20000 {
> +			compatible	=3D "st,stih407-c8sectpfe";
> +			status		=3D "okay";
> +			reg		=3D <0x08a20000 0x10000>,
> +					  <0x08a00000 0x4000>;

These look like they're the wrong way round.

> +			reg-names	=3D "c8sectpfe", "c8sectpfe-ram";
> +			interrupts	=3D <GIC_SPI 34 IRQ_TYPE_NONE>,
> +					  <GIC_SPI 35 IRQ_TYPE_NONE>;
> +			interrupt-names	=3D "c8sectpfe-error-irq",
> +					  "c8sectpfe-idle-irq";
> +			pinctrl-names	=3D "tsin0-serial",
> +					  "tsin0-parallel",
> +					  "tsin3-serial",
> +					  "tsin4-serial",
> +					  "tsin5-serial";
> +			pinctrl-0	=3D <&pinctrl_tsin0_serial>;
> +			pinctrl-1	=3D <&pinctrl_tsin0_parallel>;
> +			pinctrl-2	=3D <&pinctrl_tsin3_serial>;
> +			pinctrl-3	=3D <&pinctrl_tsin4_serial_alt3>;
> +			pinctrl-4	=3D <&pinctrl_tsin5_serial_alt1>;
> +			clock-names	=3D "c8sectpfe";
> +			clocks		=3D <&clk_s_c0_flexgen CLK_PROC_STFE>;

Personal preferenc is that the *-names properties should come *after*
the ones they reference.

> +			/* tsin0 is TSA on NIMA */
> +			tsin0: port@0 {
> +				tsin-num	=3D <0>;
> +				serial-not-parallel;
> +				i2c-bus		=3D <&ssc2>;
> +				rst-gpio	=3D <&pio15 4 0>;

"reset-gpios"?

Use the GPIO DEFINES.

> +				dvb-card	=3D <STV0367_TDA18212_NIMA_1>;
> +			};
> +		};
>  	};
>  };

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
