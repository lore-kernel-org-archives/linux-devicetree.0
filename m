From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [PATCH v4 19/21] ARM: dts: imx6ull-colibri: Add touchscreen used
 with Eval Board
Date: Thu, 15 Aug 2019 10:55:37 +0000
Message-ID: <CAGgjyvGggWwOy91gdhqrZ6TRaeQCox8_bCfMK7GCrPywUzqRJQ@mail.gmail.com>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-20-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190812142105.1995-20-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <1D4979EA38C811428CB1F5D084206C5C@eurprd05.prod.outlook.com>
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
> This adds the common touchscreen that is used with Toradex's
> Eval Boards.
>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

>
> ---
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Removed f0710a, that is downstream only
> - Changed to generic node name
> - Better comment
>
>  .../arm/boot/dts/imx6ull-colibri-eval-v3.dtsi | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
> index a78849fd2afa..458a4084e53c 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri-eval-v3.dtsi
> @@ -100,6 +100,21 @@
>  &i2c1 {
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
> +               interrupt-parent = <&gpio4>;
> +               interrupts = <16 IRQ_TYPE_EDGE_FALLING>;        /* SODIMM 28 */
> +               reset-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;      /* SODIMM 30 */
> +               status = "disabled";
> +       };
> +
>         /* M41T0M6 real time clock on carrier board */
>         m41t0m6: rtc@68 {
>                 compatible = "st,m41t0";
> @@ -176,3 +191,12 @@
>         sd-uhs-sdr104;
>         status = "okay";
>  };
> +
> +&iomuxc {
> +       pinctrl_gpiotouch: touchgpios {
> +               fsl,pins = <
> +                       MX6UL_PAD_NAND_DQS__GPIO4_IO16          0x74
> +                       MX6UL_PAD_ENET1_TX_EN__GPIO2_IO05       0x14
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
