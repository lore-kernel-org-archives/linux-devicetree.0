From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 11/11] ARM: STi: STiH407: Add spi default pinctrl groups.
Date: Fri, 11 Sep 2015 18:56:35 +0100
Message-ID: <20150911175635.GG18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-12-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-12-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> Now we have default pinconfig groups for each SPI
> controller ensure it is used by the SPI controller
> node.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>
=20
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dt=
s/stih407-family.dtsi
> index 838b812..94a2fec 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -381,6 +381,8 @@
>  			interrupts =3D <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clk_s_c0_flexgen CLK_EXT2F_A9>;
>  			clock-names =3D "ssc";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_spi1_default>;
> =20
>  			status =3D "disabled";
>  		};
> @@ -391,6 +393,8 @@
>  			interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clk_s_c0_flexgen CLK_EXT2F_A9>;
>  			clock-names =3D "ssc";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_spi2_default>;
> =20
>  			status =3D "disabled";
>  		};
> @@ -401,6 +405,8 @@
>  			interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clk_s_c0_flexgen CLK_EXT2F_A9>;
>  			clock-names =3D "ssc";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_spi3_default>;
> =20
>  			status =3D "disabled";
>  		};
> @@ -411,6 +417,8 @@
>  			interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clk_s_c0_flexgen CLK_EXT2F_A9>;
>  			clock-names =3D "ssc";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_spi4_default>;
> =20
>  			status =3D "disabled";
>  		};
> @@ -422,6 +430,8 @@
>  			interrupts =3D <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clk_sysin>;
>  			clock-names =3D "ssc";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_spi10_default>;
> =20
>  			status =3D "disabled";
>  		};
> @@ -432,6 +442,8 @@
>  			interrupts =3D <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clk_sysin>;
>  			clock-names =3D "ssc";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_spi11_default>;
> =20
>  			status =3D "disabled";
>  		};
> @@ -442,6 +454,8 @@
>  			interrupts =3D <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&clk_sysin>;
>  			clock-names =3D "ssc";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinctrl_spi12_default>;
> =20
>  			status =3D "disabled";
>  		};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
