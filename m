From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6ul: ccimx6ulsom: Add support for wireless
 SOM variant
Date: Fri, 19 Oct 2018 13:26:20 -0300
Message-ID: <CAOMZO5BwqT5Y5xECqnLx6K6Vv2gur4HV2g6zJDJyDot5FdX+KQ@mail.gmail.com>
References: <1539962141-32418-1-git-send-email-alex.gonzalez@digi.com> <1539962141-32418-2-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539962141-32418-2-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gonzalez, Alex" <alex.gonzalez@digi.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Alex,

On Fri, Oct 19, 2018 at 12:17 PM Alex Gonzalez <alex.gonzalez@digi.com> wrote:

> +/* USDHC1 (Wireless) */
> +&usdhc1 {
> +       pinctrl-names = "default", "sleep";
> +       pinctrl-0 = <&pinctrl_usdhc1 &pinctrl_wifibt_ctrl>;
> +       pinctrl-1 = <&pinctrl_usdhc1_sleep &pinctrl_wifibt_ctrl_sleep>;
> +       non-removable;
> +       no-1-8-v;
> +       bus-width = <4>;
> +       status = "okay";
> +};
> +
> +

Just a minor not: only one blank line is enough.

Reviewed-by: Fabio Estevam <festevam@gmail.com>
