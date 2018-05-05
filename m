From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V6 7/7] ARM: dts: imx6sx-sabreauto: add egalax touch
 screen support
Date: Sat, 5 May 2018 12:17:39 -0300
Message-ID: <CAOMZO5A7bf1qcHrWjM1mr31Nkz+oDJ=fQo3rjksp1YY-HhPM9A@mail.gmail.com>
References: <1525508963-7986-1-git-send-email-Anson.Huang@nxp.com> <1525508963-7986-7-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525508963-7986-7-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Haibo Chen <haibo.chen@freescale.com>, Fugang Duan <fugang.duan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Robin Gong <yibin.gong@nxp.com>, NXP Linux Team <Linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 5, 2018 at 5:29 AM, Anson Huang <Anson.Huang@nxp.com> wrote:

>  &iomuxc {
> +       pinctrl_egalax_int: egalax-intgrp {
> +               fsl,pins = <
> +                       MX6SX_PAD_SD4_RESET_B__GPIO6_IO_22      0x80000000

Please avoid using 0x80000000 and use the real IOMUX value instead.
