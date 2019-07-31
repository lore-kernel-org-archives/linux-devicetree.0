From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Subject: Re: [PATCH 13/22] ARM: dts: colibri-imx6: Add missing pinmuxing to
 Toradex eval board
Date: Wed, 31 Jul 2019 09:09:05 +0200
Message-ID: <ee2e4fec-21fe-709b-9c47-db7c24407c1c@ysoft.com>
References: <20190730144649.19022-1-dev@pschenker.ch>
 <20190730144649.19022-14-dev@pschenker.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730144649.19022-14-dev@pschenker.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <dev@pschenker.ch>, marcel.ziswiler@toradex.com, max.krummenacher@toradex.com, stefan@agner.ch, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 30. 07. 19 16:46, Philippe Schenker wrote:
> From: Philippe Schenker <philippe.schenker@toradex.com>
> 
> This patch adds some missing pinmuxing that is in the colibri
> standard to the dts.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> ---

"ARM: dts: imx6-colibri: " in the subject for consistency.

Same for the Apalis, please.

Michal

> 
>   arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
> index 63d4f9ca9ad8..13800e60246c 100644
> --- a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
> +++ b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
> @@ -204,6 +204,14 @@
>   };
>   
>   &iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <
> +		&pinctrl_weim_gpio_1 &pinctrl_weim_gpio_2
> +		&pinctrl_weim_gpio_3 &pinctrl_weim_gpio_4
> +		&pinctrl_weim_gpio_5 &pinctrl_weim_gpio_6
> +		&pinctrl_usbh_oc_1 &pinctrl_usbc_id_1
> +	>;
> +
>   	pinctrl_pcap_1: pcap-1 {
>   		fsl,pins = <
>   			MX6QDL_PAD_GPIO_9__GPIO1_IO09	0x1b0b0 /* SODIMM 28 */
> 
