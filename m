From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 4/6] ARM: DT: STi: STiH407: Add dwc3 usb3 DT node.
Date: Wed, 25 Feb 2015 15:12:29 +0000
Message-ID: <20150225151229.GE5132@x1>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
 <1424871377-1795-5-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424871377-1795-5-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, kishon@ti.com, balbi@ti.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 25 Feb 2015, Peter Griffin wrote:

> Now that both usb2 and usb3 phy drivers, and also the ST dwc3 glue co=
de
> are all present upstream, we can add the dwc3 DT node and have a work=
ing
> usb3 controller on stih407-b2120 and stih410-b2020.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 26 +++++++++++++++++++++++++=
+
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dt=
s/stih407-family.dtsi
> index 186412d..18ff5a5 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -7,6 +7,7 @@
>   * publishhed by the Free Software Foundation.
>   */
>  #include "stih407-pinctrl.dtsi"
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/reset-controller/stih407-resets.h>
>  / {
>  	#address-cells =3D <1>;
> @@ -336,5 +337,30 @@
>  				resets =3D <&softreset STIH407_MIPHY2_SOFTRESET>;
>  			};
>  		};
> +
> +		st_dwc3: dwc3@8f94000 {
> +			compatible	=3D "st,stih407-dwc3";
> +			reg		=3D <0x08f94000 0x1000>, <0x110 0x4>;
> +			reg-names	=3D "reg-glue", "syscfg-reg";
> +			st,syscfg	=3D <&syscfg_core>;
> +			resets		=3D <&powerdown STIH407_USB3_POWERDOWN>,
> +					  <&softreset STIH407_MIPHY2_SOFTRESET>;
> +			reset-names	=3D "powerdown",
> +					  "softreset";

Nit: What's the purpose of having these on separate lines?

Apart from that, it looks good:

Acked-by: Lee Jones <lee.jones@linaro.org>

> +			#address-cells	=3D <1>;
> +			#size-cells	=3D <1>;
> +			pinctrl-names	=3D "default";
> +			pinctrl-0	=3D <&pinctrl_usb3>;
> +			ranges;
> +
> +			dwc3: dwc3@9900000 {
> +				compatible	=3D "snps,dwc3";
> +				reg		=3D <0x09900000 0x100000>;
> +				interrupts	=3D <GIC_SPI 155 IRQ_TYPE_NONE>;
> +				dr_mode		=3D "host";
> +				phy-names	=3D "usb2-phy", "usb3-phy";
> +				phys		=3D <&usb2_picophy0>, <&phy_port2 PHY_TYPE_USB3>;
> +			};
> +		};
>  	};
>  };

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
