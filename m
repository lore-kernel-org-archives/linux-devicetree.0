From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 07/11] ARM: DT: STiH407: Add systrace pin configuration
Date: Fri, 11 Sep 2015 19:00:48 +0100
Message-ID: <20150911180048.GK18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-8-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-8-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> This patch adds the pin config for systrace for
> STiH407 family silicon.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Besides the SoBs, which are a little confusing:

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index cde776b..798d901 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -658,6 +658,18 @@
>  					};
>  				};
>  			};
> +
> +			systrace {
> +				pinctrl_systrace_default: systrace-default {
> +					st,pins {
> +						trc_data0 =3D <&pio11 3 ALT5 OUT>;
> +						trc_data1 =3D <&pio11 4 ALT5 OUT>;
> +						trc_data2 =3D <&pio11 5 ALT5 OUT>;
> +						trc_data3 =3D <&pio11 6 ALT5 OUT>;
> +						trc_clk   =3D <&pio11 7 ALT5 OUT>;
> +					};
> +				};
> +			};
>  		};
> =20
>  		pin-controller-front1 {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
