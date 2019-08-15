From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [PATCH v4 08/21] ARM: dts: imx7-colibri: Add touch controllers
Date: Thu, 15 Aug 2019 10:59:01 +0000
Message-ID: <CAGgjyvEGqZ5qKeN9rOUQDWbb7X=LbeTAU4s01t18+B396Df_Lg@mail.gmail.com>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-9-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190812142105.1995-9-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <5EF4315B158F6A4D97BD31DA60DC4498@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?utf-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Max Krummenacher <max.krummenacher@toradex.com>, Shawn Guo <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 5:23 PM Philippe Schenker
<philippe.schenker@toradex.com> wrote:
>
> Add touch controller that is connected over an I2C bus.
>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

>
> ---
>
> Changes in v4:
> - Add Marcel Ziswiler's Ack
>
> Changes in v3:
> - Fix commit message
>
> Changes in v2:
> - Deleted touchrevolution downstream stuff
> - Use generic node name
> - Better comment
>
>  arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
> index d4dbc4fc1adf..576dec9ff81c 100644
> --- a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
> @@ -145,6 +145,21 @@
>  &i2c4 {
>         status = "okay";
>
> +       /*
> +        * Touchscreen is using SODIMM 28/30, also used for PWM<B>, PWM<C>,
> +        * aka pwm2, pwm3. so if you enable touchscreen, disable the pwms
> +        */
> +       touchscreen@4a {
> +               compatible = "atmel,maxtouch";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_gpiotouch>;
> +               reg = <0x4a>;
> +               interrupt-parent = <&gpio1>;
> +               interrupts = <9 IRQ_TYPE_EDGE_FALLING>;         /* SODIMM 28 */
> +               reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;     /* SODIMM 30 */
> +               status = "disabled";
> +       };
> +
>         /* M41T0M6 real time clock on carrier board */
>         rtc: m41t0m6@68 {
>                 compatible = "st,m41t0";
> @@ -200,3 +215,12 @@
>         vmmc-supply = <&reg_3v3>;
>         status = "okay";
>  };
> +
> +&iomuxc {
> +       pinctrl_gpiotouch: touchgpios {
> +               fsl,pins = <
> +                       MX7D_PAD_GPIO1_IO09__GPIO1_IO9          0x74
> +                       MX7D_PAD_GPIO1_IO10__GPIO1_IO10         0x14
> +               >;
> +       };
> +};
> --
> 2.22.0
>


-- 
Best regards
Oleksandr Suvorov

Toradex AG
Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
4800 (main line)
