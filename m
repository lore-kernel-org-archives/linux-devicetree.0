From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [PATCH v4 15/21] ARM: dts: imx6ull-colibri: reduce v_batt current
 in power off
Date: Thu, 15 Aug 2019 07:48:54 +0000
Message-ID: <CAGgjyvHSdFCZOsc+QRFwDRn2w1+oxwXgoAM3fF-Wcqgt6spKFA@mail.gmail.com>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-16-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190812142105.1995-16-philippe.schenker@toradex.com>
Content-Language: en-US
Content-ID: <8CB5BD0E77A5184FB595F02EBA907202@eurprd05.prod.outlook.com>
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
> Reduce the current drawn from VCC_BATT when the main power on the 3V3
> pins to the module are switched off.
>
> This switches off SoC internal pull resistors which are provided on the
> module for TAMPER7 and TAMPER9 SoC pin and switches on a pull down
> instead of a pullup for the USBC_DET module pin (TAMPER2).
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

>
> ---
>
> Changes in v4:
> - Add Marcel Ziswiler's Ack
>
> Changes in v3: None
> Changes in v2: None
>
>  arch/arm/boot/dts/imx6ull-colibri.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/imx6ull-colibri.dtsi b/arch/arm/boot/dts/imx6ull-colibri.dtsi
> index 1019ce69a242..1f112ec55e5c 100644
> --- a/arch/arm/boot/dts/imx6ull-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx6ull-colibri.dtsi
> @@ -533,19 +533,19 @@
>
>         pinctrl_snvs_ad7879_int: snvs-ad7879-int-grp { /* TOUCH Interrupt */
>                 fsl,pins = <
> -                       MX6ULL_PAD_SNVS_TAMPER7__GPIO5_IO07     0x1b0b0
> +                       MX6ULL_PAD_SNVS_TAMPER7__GPIO5_IO07     0x100b0
>                 >;
>         };
>
>         pinctrl_snvs_reg_sd: snvs-reg-sd-grp {
>                 fsl,pins = <
> -                       MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09     0x4001b8b0
> +                       MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09     0x400100b0
>                 >;
>         };
>
>         pinctrl_snvs_usbc_det: snvs-usbc-det-grp {
>                 fsl,pins = <
> -                       MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02     0x1b0b0
> +                       MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02     0x130b0
>                 >;
>         };
>
> --
> 2.22.0
>


--
Best regards
Oleksandr Suvorov

Toradex AG
Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
4800 (main line)
