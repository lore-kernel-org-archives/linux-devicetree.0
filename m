From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6sll-evk: enable usdhc3 slot
Date: Wed, 27 Jun 2018 11:31:22 -0300
Message-ID: <CAOMZO5DoRUSOfV_oh242w6s_1Zs8yAy9Kf4D+WdYym5c+6nucg@mail.gmail.com>
References: <1530088605-9264-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530088605-9264-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Wed, Jun 27, 2018 at 5:36 AM, Anson Huang <Anson.Huang@nxp.com> wrote:

> +&usdhc3 {
> +       pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +       pinctrl-0 = <&pinctrl_usdhc3>;
> +       pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +       pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +       cd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
> +       keep-power-in-suspend;
> +       enable-sdio-wakeup;
> +       vmmc-supply = <&reg_sd3_vmmc>;
> +       status = "okay";
> +};
> +
>  &usbotg1 {

Please keep the nodes sorted in alphabetical order.
