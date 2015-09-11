From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 04/11] ARM: DT: STiH407: Add serial3 pinctrl configuration
Date: Fri, 11 Sep 2015 19:01:51 +0100
Message-ID: <20150911180151.GN18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-5-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-5-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org, Erwan Le Ray <erwan.leray@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> Add missing serial 3 pinctrl config. This can be used
> on b2206 HVK, where it defaults to PIO31[3] & PIO31[4],
> alternate 1.
>=20
> Signed-off-by: Erwan Le Ray <erwan.leray@st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Acked-by: Carmelo Amoroso <carmelo.amoroso@st.com>
> Acked-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Eek!

=46or the patch: Acked-by: Lee Jones <lee.jones@linaro.org>

> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index bb3b0c7..6c81f35 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -809,6 +809,15 @@
>  					};
>  				};
>  			};
> +
> +			serial3 {
> +				pinctrl_serial3: serial3-0 {
> +					st,pins {
> +						tx =3D <&pio31 3 ALT1 OUT>;
> +						rx =3D <&pio31 4 ALT1 IN>;
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
