From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [PATCH v4 17/21] ARM: dts: imx6ull: improve can templates
Date: Thu, 15 Aug 2019 07:42:37 +0000
Message-ID: <CAGgjyvHi=DhUFE_6e_iPn91RNqJgDbGAEvZodji6OME9x5crrw@mail.gmail.com>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-18-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190812142105.1995-18-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <E4FA979EF7ED3C41B14CE8144F7E4A6C@eurprd05.prod.outlook.com>
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

On Mon, Aug 12, 2019 at 5:24 PM Philippe Schenker
<philippe.schenker@toradex.com> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> Add the pinmuxing and a inactive node for flexcan1 on SODIMM 55/63
> and move the inactive flexcan nodes to imx6ull-colibri-eval-v3.dtsi
> where they belong.
>
> Note that this commit does not enable flexcan functionality, but rather
> eases the effort needed to do so.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

>
> ---
>
> Changes in v4:
> - Move can nodes to module deviceteree include imx6ull-colibri.dtsi
>
> Changes in v3: None
> Changes in v2: None
>
>  .../arm/boot/dts/imx6ull-colibri-nonwifi.dtsi |  2 +-
>  arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi   |  2 +-
>  arch/arm/boot/dts/imx6ull-colibri.dtsi        | 28 +++++++++++++++++--
>  3 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-nonwifi.dtsi b/arch/arm/boot/dts/imx6ull-colibri-nonwifi.dtsi
> index fb213bec4654..95a11b8bcbdb 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri-nonwifi.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri-nonwifi.dtsi
> @@ -15,7 +15,7 @@
>  &iomuxc {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_gpio1 &pinctrl_gpio2 &pinctrl_gpio3
> -               &pinctrl_gpio4 &pinctrl_gpio5 &pinctrl_gpio6>;
> +               &pinctrl_gpio4 &pinctrl_gpio5 &pinctrl_gpio6 &pinctrl_gpio7>;
>  };
>
>  &iomuxc_snvs {
> diff --git a/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi b/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
> index 038d8c90f6df..a0545431b3dc 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
> @@ -26,7 +26,7 @@
>  &iomuxc {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_gpio1 &pinctrl_gpio2 &pinctrl_gpio3
> -               &pinctrl_gpio4 &pinctrl_gpio5>;
> +               &pinctrl_gpio4 &pinctrl_gpio5 &pinctrl_gpio7>;
>
>  };
>
> diff --git a/arch/arm/boot/dts/imx6ull-colibri.dtsi b/arch/arm/boot/dts/imx6ull-colibri.dtsi
> index e3220298dd6f..6d850d997e1e 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri.dtsi
> @@ -54,6 +54,18 @@
>         vref-supply = <&reg_module_3v3_avdd>;
>  };
>
> +&can1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_flexcan1>;
> +       status = "disabled";
> +};
> +
> +&can2 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_flexcan2>;
> +       status = "disabled";
> +};
> +
>  /* Colibri SPI */
>  &ecspi1 {
>         cs-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
> @@ -256,6 +268,13 @@
>                 >;
>         };
>
> +       pinctrl_flexcan1: flexcan1-grp {
> +               fsl,pins = <
> +                       MX6UL_PAD_ENET1_RX_DATA0__FLEXCAN1_TX   0x1b020
> +                       MX6UL_PAD_ENET1_RX_DATA1__FLEXCAN1_RX   0x1b020
> +               >;
> +       };
> +
>         pinctrl_flexcan2: flexcan2-grp {
>                 fsl,pins = <
>                         MX6UL_PAD_ENET1_TX_DATA0__FLEXCAN2_RX   0x1b020
> @@ -271,8 +290,6 @@
>
>         pinctrl_gpio1: gpio1-grp {
>                 fsl,pins = <
> -                       MX6UL_PAD_ENET1_RX_DATA0__GPIO2_IO00    0x74 /* SODIMM 55 */
> -                       MX6UL_PAD_ENET1_RX_DATA1__GPIO2_IO01    0x74 /* SODIMM 63 */
>                         MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25     0X14 /* SODIMM 77 */
>                         MX6UL_PAD_JTAG_TCK__GPIO1_IO14          0x14 /* SODIMM 99 */
>                         MX6UL_PAD_NAND_CE1_B__GPIO4_IO14        0x14 /* SODIMM 133 */
> @@ -325,6 +342,13 @@
>                 >;
>         };
>
> +       pinctrl_gpio7: gpio7-grp { /* CAN1 */
> +               fsl,pins = <
> +                       MX6UL_PAD_ENET1_RX_DATA0__GPIO2_IO00    0x74 /* SODIMM 55 */
> +                       MX6UL_PAD_ENET1_RX_DATA1__GPIO2_IO01    0x74 /* SODIMM 63 */
> +               >;
> +       };
> +
>         pinctrl_gpmi_nand: gpmi-nand-grp {
>                 fsl,pins = <
>                         MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00   0x100a9
> --
> 2.22.0
>


-- 
Best regards
Oleksandr Suvorov

Toradex AG
Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
4800 (main line)
