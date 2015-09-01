From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 2/6] ARM: DT: STi: STiH407: Add c8sectpfe LinuxDVB DT
 node.
Date: Tue, 1 Sep 2015 08:59:19 +0100
Message-ID: <20150901075919.GL4796@x1>
References: <1440784362-31217-1-git-send-email-peter.griffin@linaro.org>
 <1440784362-31217-3-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440784362-31217-3-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, mchehab@osg.samsung.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, valentinrothberg@gmail.com, hugues.fruchet@st.com
List-Id: devicetree@vger.kernel.org

On Fri, 28 Aug 2015, Peter Griffin wrote:

> This patch adds in the required DT node for the c8sectpfe
> Linux DVB demux driver which allows the tsin channels
> to be used on an upstream kernel.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stihxxx-b2120.dtsi | 35 ++++++++++++++++++++++++++=
+++++++++
>  1 file changed, 35 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts=
/stihxxx-b2120.dtsi
> index 62994ae..f9fca10 100644
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
> @@ -85,5 +88,37 @@
>  			status =3D "okay";
>  		};
> =20
> +		demux@08a20000 {
> +			compatible	=3D "st,stih407-c8sectpfe";
> +			status		=3D "okay";
> +			reg		=3D <0x08a20000 0x10000>,
> +					  <0x08a00000 0x4000>;
> +			reg-names	=3D "c8sectpfe", "c8sectpfe-ram";
> +			interrupts	=3D <GIC_SPI 34 IRQ_TYPE_NONE>,
> +					  <GIC_SPI 35 IRQ_TYPE_NONE>;
> +			interrupt-names	=3D "c8sectpfe-error-irq",
> +					  "c8sectpfe-idle-irq";
> +			pinctrl-0	=3D <&pinctrl_tsin0_serial>;
> +			pinctrl-1	=3D <&pinctrl_tsin0_parallel>;
> +			pinctrl-2	=3D <&pinctrl_tsin3_serial>;
> +			pinctrl-3	=3D <&pinctrl_tsin4_serial_alt3>;
> +			pinctrl-4	=3D <&pinctrl_tsin5_serial_alt1>;
> +			pinctrl-names	=3D "tsin0-serial",
> +					  "tsin0-parallel",
> +					  "tsin3-serial",
> +					  "tsin4-serial",
> +					  "tsin5-serial";
> +			clocks		=3D <&clk_s_c0_flexgen CLK_PROC_STFE>;
> +			clock-names	=3D "c8sectpfe";
> +
> +			/* tsin0 is TSA on NIMA */
> +			tsin0: port@0 {
> +				tsin-num	=3D <0>;
> +				serial-not-parallel;
> +				i2c-bus		=3D <&ssc2>;
> +				rst-gpio	=3D <&pio15 4 GPIO_ACTIVE_HIGH>;
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
