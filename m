From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 09/11] ARM: DT: STiH407: Add pinconfig for IRB UHF and
 IRB TX
Date: Fri, 11 Sep 2015 18:57:42 +0100
Message-ID: <20150911175742.GI18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-10-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-10-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org, M'boumba Cedric Madianga <cedric.madianga@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> This patch adds the pinconfig for IRB TX and IRB UHF.
>=20
> Signed-off-by: M'boumba Cedric Madianga <cedric.madianga@st.com>
> Acked-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

I'd take out the Ack here.

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index 3cd7e2a..473f2ea 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -121,6 +121,24 @@
>  						ir =3D <&pio4 0 ALT2 IN>;
>  					};
>  				};
> +
> +				pinctrl_uhf: uhf0 {
> +					st,pins {
> +						ir =3D <&pio4 1 ALT2 IN>;
> +					};
> +				};
> +
> +				pinctrl_tx: tx0 {
> +					st,pins {
> +						tx =3D <&pio4 2 ALT2 OUT>;
> +					};
> +				};
> +
> +				pinctrl_tx_od: tx_od0 {
> +					st,pins {
> +						tx_od =3D <&pio4 3 ALT2 OUT>;
> +					};
> +				};
>  			};
> =20
>  			/* SBC_ASC0 - UART10 */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
