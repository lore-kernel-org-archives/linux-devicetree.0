From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/5] [media] c8sectpfe: Update binding to reset-gpios
Date: Fri, 28 Aug 2015 07:57:40 +0100
Message-ID: <20150828065740.GD4796@x1>
References: <1440678575-21646-1-git-send-email-peter.griffin@linaro.org>
 <1440678575-21646-5-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440678575-21646-5-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, mchehab@osg.samsung.com, devicetree@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 27 Aug 2015, Peter Griffin wrote:

> gpio.txt documents that GPIO properties should be named
> "[<name>-]gpios", with <name> being the purpose of this
> GPIO for the device.
>=20
> This change has been done as one atomic commit.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt | 6 ++=
+---
>  arch/arm/boot/dts/stihxxx-b2120.dtsi                          | 4 ++=
--
>  drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c         | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/Documentation/devicetree/bindings/media/stih407-c8sectpf=
e.txt b/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
> index d4def76..e70d840 100644
> --- a/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
> +++ b/Documentation/devicetree/bindings/media/stih407-c8sectpfe.txt
> @@ -35,7 +35,7 @@ Required properties (tsin (child) node):
> =20
>  - tsin-num	: tsin id of the InputBlock (must be between 0 to 6)
>  - i2c-bus	: phandle to the I2C bus DT node which the demodulators & =
tuners on this tsin channel are connected.
> -- rst-gpio	: reset gpio for this tsin channel.
> +- reset-gpios	: reset gpio for this tsin channel.
> =20
>  Optional properties (tsin (child) node):
> =20
> @@ -75,7 +75,7 @@ Example:
>  			tsin-num		=3D <0>;
>  			serial-not-parallel;
>  			i2c-bus			=3D <&ssc2>;
> -			rst-gpio		=3D <&pio15 4 0>;
> +			reset-gpios		=3D <&pio15 4 GPIO_ACTIVE_HIGH>;
>  			dvb-card		=3D <STV0367_TDA18212_NIMA_1>;
>  		};
> =20
> @@ -83,7 +83,7 @@ Example:
>  			tsin-num		=3D <3>;
>  			serial-not-parallel;
>  			i2c-bus			=3D <&ssc3>;
> -			rst-gpio		=3D <&pio15 7 0>;
> +			reset-gpios		=3D <&pio15 7 GPIO_ACTIVE_HIGH>;
>  			dvb-card		=3D <STV0367_TDA18212_NIMB_1>;
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts=
/stihxxx-b2120.dtsi
> index c014173..f932bfd 100644
> --- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
> +++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
> @@ -6,8 +6,8 @@
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>   */
> -
>  #include <dt-bindings/clock/stih407-clks.h>
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/media/c8sectpfe.h>
>  / {
>  	soc {
> @@ -115,7 +115,7 @@
>  				tsin-num	=3D <0>;
>  				serial-not-parallel;
>  				i2c-bus		=3D <&ssc2>;
> -				rst-gpio	=3D <&pio15 4 0>;
> +				reset-gpios	=3D <&pio15 4 GPIO_ACTIVE_HIGH>;
>  				dvb-card	=3D <STV0367_TDA18212_NIMA_1>;
>  			};
>  		};
> diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/=
drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> index 3a91093..c691e13 100644
> --- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> +++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
> @@ -822,7 +822,7 @@ static int c8sectpfe_probe(struct platform_device=
 *pdev)
>  		}
>  		of_node_put(i2c_bus);
> =20
> -		tsin->rst_gpio =3D of_get_named_gpio(child, "rst-gpio", 0);
> +		tsin->rst_gpio =3D of_get_named_gpio(child, "reset-gpios", 0);
> =20
>  		ret =3D gpio_is_valid(tsin->rst_gpio);
>  		if (!ret) {

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
