From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 05/11] ARM: DT: STiH407: Add SPI FSM (NOR Flash)
 Controller pin config
Date: Fri, 11 Sep 2015 19:01:19 +0100
Message-ID: <20150911180119.GM18779@x1>
References: <1441991194-11948-1-git-send-email-peter.griffin@linaro.org>
 <1441991194-11948-6-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1441991194-11948-6-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, devicetree@vger.kernel.org, Christophe Kerello <christophe.kerello@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 11 Sep 2015, Peter Griffin wrote:

> This patch adds the pin configuration for the NOR flash controller.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  arch/arm/boot/dts/stih407-pinctrl.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/arch/arm/boot/dts/stih407-pinctrl.dtsi b/arch/arm/boot/d=
ts/stih407-pinctrl.dtsi
> index 6c81f35..d0f5fdd 100644
> --- a/arch/arm/boot/dts/stih407-pinctrl.dtsi
> +++ b/arch/arm/boot/dts/stih407-pinctrl.dtsi
> @@ -872,6 +872,19 @@
>  					};
>  				};
>  			};
> +
> +			fsm {
> +				pinctrl_fsm: fsm {
> +					st,pins {
> +						spi-fsm-clk =3D <&pio40 1 ALT1 OUT>;
> +						spi-fsm-cs =3D <&pio40 0 ALT1 OUT>;
> +						spi-fsm-mosi =3D <&pio40 2 ALT1 OUT>;
> +						spi-fsm-miso =3D <&pio40 3 ALT1 IN>;
> +						spi-fsm-hol =3D <&pio40 5 ALT1 OUT>;
> +						spi-fsm-wp =3D <&pio40 4 ALT1 OUT>;
> +					};
> +				};
> +			};
>  		};
>  	};
>  };

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
