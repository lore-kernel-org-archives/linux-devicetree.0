From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 03/11] ARM: DT: STiH407: Add SPI 3 wire and 4 wire
 pinctrl configs
Date: Fri, 11 Sep 2015 19:02:21 +0100
Message-ID: <20150911180221.GO18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-4-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-4-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org, Christophe Kerello <christophe.kerello@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> This patch adds the spi pinctrl configurations for all SPI
> controllers, and also the alternate muxings which
> can be used depending on board design.
>=20
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 239 +++++++++++++++++++++++=
+++++++++-
>  1 file changed, 235 insertions(+), 4 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index ce219a1..bb3b0c7 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -262,6 +262,57 @@
>  					};
>  				};
>  			};
> +
> +			spi10 {
> +				pinctrl_spi10_default: spi10-4w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio4 6 ALT1 OUT>;
> +						mrst =3D <&pio4 7 ALT1 IN>;
> +						scl =3D <&pio4 5 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi10_3w_alt1_0: spi10-3w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio4 6 ALT1 BIDIR_PU>;
> +						scl =3D <&pio4 5 ALT1 OUT>;
> +					};
> +				};
> +			};
> +
> +			spi11 {
> +				pinctrl_spi11_default: spi11-4w-alt2-0 {
> +					st,pins {
> +						mtsr =3D <&pio3 1 ALT2 OUT>;
> +						mrst =3D <&pio3 0 ALT2 IN>;
> +						scl =3D <&pio3 2 ALT2 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi11_3w_alt2_0: spi11-3w-alt2-0 {
> +					st,pins {
> +						mtsr =3D <&pio3 1 ALT2 BIDIR_PU>;
> +						scl =3D <&pio3 2 ALT2 OUT>;
> +					};
> +				};
> +			};
> +
> +			spi12 {
> +				pinctrl_spi12_default: spi12-4w-alt2-0 {
> +					st,pins {
> +						mtsr =3D <&pio3 6 ALT2 OUT>;
> +						mrst =3D <&pio3 4 ALT2 IN>;
> +						scl =3D <&pio3 7 ALT2 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi12_3w_alt2_0: spi12-3w-alt2-0 {
> +					st,pins {
> +						mtsr =3D <&pio3 6 ALT2 BIDIR_PU>;
> +						scl =3D <&pio3 7 ALT2 OUT>;
> +					};
> +				};
> +			};
>  		};
> =20
>  		pin-controller-front0 {
> @@ -451,11 +502,159 @@
>  			};
> =20
>  			spi0 {
> -				pinctrl_spi0_default: spi0-default {
> +				pinctrl_spi0_default: spi0-4w-alt2-0 {
> +					st,pins {
> +						mtsr =3D <&pio10 6 ALT2 OUT>;
> +						mrst =3D <&pio10 7 ALT2 IN>;
> +						scl =3D <&pio10 5 ALT2 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi0_3w_alt2_0: spi0-3w-alt2-0 {
>  					st,pins {
> -						mtsr =3D <&pio12 6 ALT2 BIDIR>;
> -						mrst =3D <&pio12 7 ALT2 BIDIR>;
> -						scl =3D <&pio12 5 ALT2 BIDIR>;
> +						mtsr =3D <&pio10 6 ALT2 BIDIR_PU>;
> +						scl =3D <&pio10 5 ALT2 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi0_4w_alt1_0: spi0-4w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio19 7 ALT1 OUT>;
> +						mrst =3D <&pio19 5 ALT1 IN>;
> +						scl =3D <&pio19 6 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi0_3w_alt1_0: spi0-3w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio19 7 ALT1 BIDIR_PU>;
> +						scl =3D <&pio19 6 ALT1 OUT>;
> +					};
> +				};
> +			};
> +
> +			spi1 {
> +				pinctrl_spi1_default: spi1-4w-alt2-0 {
> +					st,pins {
> +						mtsr =3D <&pio11 1 ALT2 OUT>;
> +						mrst =3D <&pio11 2 ALT2 IN>;
> +						scl =3D <&pio11 0 ALT2 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi1_3w_alt2_0: spi1-3w-alt2-0 {
> +					st,pins {
> +						mtsr =3D <&pio11 1 ALT2 BIDIR_PU>;
> +						scl =3D <&pio11 0 ALT2 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi1_4w_alt1_0: spi1-4w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio14 3 ALT1 OUT>;
> +						mrst =3D <&pio14 4 ALT1 IN>;
> +						scl =3D <&pio14 2 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi1_3w_alt1_0: spi1-3w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio14 3 ALT1 BIDIR_PU>;
> +						scl =3D <&pio14 2 ALT1 OUT>;
> +					};
> +				};
> +			};
> +
> +			spi2 {
> +				pinctrl_spi2_default: spi2-4w-alt2-0 {
> +					st,pins {
> +						mtsr =3D <&pio12 6 ALT2 OUT>;
> +						mrst =3D <&pio12 7 ALT2 IN>;
> +						scl =3D <&pio12 5 ALT2 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi2_3w_alt2_0: spi2-3w-alt2-0 {
> +					st,pins {
> +						mtsr =3D <&pio12 6 ALT2 BIDIR_PU>;
> +						scl =3D <&pio12 5 ALT2 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi2_4w_alt1_0: spi2-4w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio14 6 ALT1 OUT>;
> +						mrst =3D <&pio14 7 ALT1 IN>;
> +						scl =3D <&pio14 5 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi2_3w_alt1_0: spi2-3w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio14 6 ALT1 BIDIR_PU>;
> +						scl =3D <&pio14 5 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi2_4w_alt2_1: spi2-4w-alt2-1 {
> +					st,pins {
> +						mtsr =3D <&pio15 6 ALT2 OUT>;
> +						mrst =3D <&pio15 7 ALT2 IN>;
> +						scl =3D <&pio15 5 ALT2 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi2_3w_alt2_1: spi2-3w-alt2-1 {
> +					st,pins {
> +						mtsr =3D <&pio15 6 ALT2 BIDIR_PU>;
> +						scl =3D <&pio15 5 ALT2 OUT>;
> +					};
> +				};
> +			};
> +
> +			spi3 {
> +				pinctrl_spi3_default: spi3-4w-alt3-0 {
> +					st,pins {
> +						mtsr =3D <&pio13 6 ALT3 OUT>;
> +						mrst =3D <&pio13 7 ALT3 IN>;
> +						scl =3D <&pio13 5 ALT3 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi3_3w_alt3_0: spi3-3w-alt3-0 {
> +					st,pins {
> +						mtsr =3D <&pio13 6 ALT3 BIDIR_PU>;
> +						scl =3D <&pio13 5 ALT3 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi3_4w_alt1_0: spi3-4w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio17 7 ALT1 OUT>;
> +						mrst =3D <&pio17 5 ALT1 IN>;
> +						scl =3D <&pio17 6 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi3_3w_alt1_0: spi3-3w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio17 7 ALT1 BIDIR_PU>;
> +						scl =3D <&pio17 6 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi3_4w_alt1_1: spi3-4w-alt1-1 {
> +					st,pins {
> +						mtsr =3D <&pio18 6 ALT1 OUT>;
> +						mrst =3D <&pio18 7 ALT1 IN>;
> +						scl =3D <&pio18 5 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi3_3w_alt1_1: spi3-3w-alt1-1 {
> +					st,pins {
> +						mtsr =3D <&pio18 6 ALT1 BIDIR_PU>;
> +						scl =3D <&pio18 5 ALT1 OUT>;
>  					};
>  				};
>  			};
> @@ -578,6 +777,38 @@
>  					};
>  				};
>  			};
> +
> +			spi4 {
> +				pinctrl_spi4_default: spi4-4w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio30 1 ALT1 OUT>;
> +						mrst =3D <&pio30 2 ALT1 IN>;
> +						scl =3D <&pio30 0 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi4_3w_alt1_0: spi4-3w-alt1-0 {
> +					st,pins {
> +						mtsr =3D <&pio30 1 ALT1 BIDIR_PU>;
> +						scl =3D <&pio30 0 ALT1 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi4_4w_alt3_0: spi4-4w-alt3-0 {
> +					st,pins {
> +						mtsr =3D <&pio34 1 ALT3 OUT>;
> +						mrst =3D <&pio34 2 ALT3 IN>;
> +						scl =3D <&pio34 0 ALT3 OUT>;
> +					};
> +				};
> +
> +				pinctrl_spi4_3w_alt3_0: spi4-3w-alt3-0 {
> +					st,pins {
> +						mtsr =3D <&pio34 1 ALT3 BIDIR_PU>;
> +						scl =3D <&pio34 0 ALT3 OUT>;
> +					};
> +				};
> +			};
>  		};
> =20
>  		pin-controller-flash {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
