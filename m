From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 01/13] ARM: STi: DT: STiH416: Add pinctl setup for usb
 controllers.
Date: Mon, 10 Nov 2014 10:50:41 +0000
Message-ID: <20141110105041.GU21424@x1>
References: <1415361475-6218-1-git-send-email-peter.griffin@linaro.org>
 <1415361475-6218-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415361475-6218-2-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 07 Nov 2014, Peter Griffin wrote:

> This patch adds the required pin config for all usb controllers
> on the stih416.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih416-pinctrl.dtsi | 34 ++++++++++++++++++++++++=
++++++++++
>  1 file changed, 34 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/boot/dts/stih416-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih416-pinctrl.dtsi
> index c2025bc..9cccf2d 100644
> --- a/arch/arm/boot/dts/stih416-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih416-pinctrl.dtsi
> @@ -147,6 +147,15 @@
>  				};
>  			};
> =20
> +			usb {
> +				pinctrl_usb3: usb3 {
> +					st,pins {
> +						oc-detect =3D <&pio40 0 ALT1 IN>;
> +						pwr-enable =3D <&pio40 1 ALT1 OUT>;
> +					};
> +				};
> +			};
> +
>  			sbc_i2c1 {
>  				pinctrl_sbc_i2c1_default: sbc_i2c1-default {
>  					st,pins {
> @@ -318,6 +327,16 @@
>  				};
>  			};
> =20
> +			usb {
> +				pinctrl_usb0: usb0 {
> +					st,pins {
> +						oc-detect =3D <&pio9 4 ALT1 IN>;
> +						pwr-enable =3D <&pio9 5 ALT1 OUT>;
> +					};
> +				};
> +			};
> +
> +
>  			i2c1 {
>  				pinctrl_i2c1_default: i2c1-default {
>  					st,pins {
> @@ -506,6 +525,21 @@
>  					};
>  				};
>  			};
> +
> +			usb {
> +				pinctrl_usb1: usb1 {
> +					st,pins {
> +						oc-detect =3D <&pio18 0 ALT1 IN>;
> +						pwr-enable =3D <&pio18 1 ALT1 OUT>;
> +					};
> +				};
> +				pinctrl_usb2: usb2 {
> +					st,pins {
> +						oc-detect =3D <&pio18 2 ALT1 IN>;
> +						pwr-enable =3D <&pio18 3 ALT1 OUT>;
> +					};
> +				};
> +			};
>  		};
> =20
>  		pin-controller-fvdp-fe {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
