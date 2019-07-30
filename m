From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 12/22] ARM: dts: imx6: Add touchscreens used on Toradex
 eval boards
Date: Tue, 30 Jul 2019 17:46:28 -0300
Message-ID: <CAOMZO5DRi6yawn3RF-Mouiejz0nc7htdsCjOBC_EXZZKUZ3nvA@mail.gmail.com>
References: <20190730144649.19022-1-dev@pschenker.ch> <20190730144649.19022-13-dev@pschenker.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730144649.19022-13-dev@pschenker.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <dev@pschenker.ch>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, Stefan Agner <stefan@agner.ch>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Philippe Schenker <philippe.schenker@toradex.com>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 30, 2019 at 11:57 AM Philippe Schenker <dev@pschenker.ch> wrote:

> +       /* Atmel maxtouch controller */
> +       atmel_mxt_ts: atmel_mxt_ts@4a {

Generic node names, please:

touchscreen@4a

> +               compatible = "atmel,maxtouch";
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&pinctrl_pcap_1>;
> +               reg = <0x4a>;
> +               interrupt-parent = <&gpio1>;
> +               interrupts = <9 IRQ_TYPE_EDGE_FALLING>; /* SODIMM 28 */
> +               reset-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>; /* SODIMM 30 */
> +               status = "disabled";
> +       };
> +
> +       /*
> +        * the PCAPs use SODIMM 28/30, also used for PWM<B>, PWM<C>, aka pwm1,
> +        * pwm4. So if you enable one of the PCAP controllers disable the pwms.
> +        */
> +       pcap: pcap@10 {

touchscreen@10

> +               /* TouchRevolution Fusion 7 and 10 multi-touch controller */
> +               compatible = "touchrevolution,fusion-f0710a";

I do not find this binding documented.
