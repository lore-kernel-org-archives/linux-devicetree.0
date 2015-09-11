From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 10/11] ARM: DT: STiH407: Add RMII pinctrl support
Date: Fri, 11 Sep 2015 18:57:00 +0100
Message-ID: <20150911175700.GH18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-11-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-11-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> This patch adds the RMII pinctrl support for the Synopsys
> MAC on STiH407 SoCs.
>=20
> Signed-off-by: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 27 ++++++++++++++++++++++++=
+++
>  1 file changed, 27 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index 473f2ea..e80cac5 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -256,6 +256,33 @@
>  						phyclk =3D <&pio2 3 ALT1 OUT NICLK 0 CLK_A>;
>  					};
>  				};
> +
> +				pinctrl_rmii1: rmii1-0 {
> +					st,pins {
> +						txd0 =3D <&pio0 0 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
> +						txd1 =3D <&pio0 1 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
> +						txen =3D <&pio0 5 ALT1 OUT SE_NICLK_IO 0 CLK_A>;
> +						mdio =3D <&pio1 0 ALT1 OUT BYPASS 0>;
> +						mdc =3D <&pio1 1 ALT1 OUT NICLK 0 CLK_A>;
> +						mdint =3D <&pio1 3 ALT1 IN BYPASS 0>;
> +						rxd0 =3D <&pio1 4 ALT1 IN SE_NICLK_IO 0 CLK_B>;
> +						rxd1 =3D <&pio1 5 ALT1 IN SE_NICLK_IO 0 CLK_B>;
> +						rxdv =3D <&pio2 0 ALT1 IN SE_NICLK_IO 0 CLK_B>;
> +						rx_er =3D <&pio2 1 ALT1 IN SE_NICLK_IO 0 CLK_A>;
> +					};
> +				};
> +
> +				pinctrl_rmii1_phyclk: rmii1_phyclk {
> +					st,pins {
> +						phyclk =3D <&pio2 3 ALT1 OUT NICLK 0 CLK_A>;
> +					};
> +				};
> +
> +				pinctrl_rmii1_phyclk_ext: rmii1_phyclk_ext {
> +					st,pins {
> +						phyclk =3D <&pio2 3 ALT2 IN NICLK 0 CLK_A>;
> +					};
> +				};
>  			};
> =20
>  			pwm1 {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
