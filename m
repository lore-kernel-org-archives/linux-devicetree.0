From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: imx8mq: add DCSS node
Date: Mon, 23 Sep 2019 13:12:42 -0300
Message-ID: <CAOMZO5AOVfBpz2Azh65iT_W3CBZUxf9KnqA=kdow7XWd4j--Qg@mail.gmail.com>
References: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com> <1569248002-2485-6-git-send-email-laurentiu.palcu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569248002-2485-6-git-send-email-laurentiu.palcu@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Lucas Stach <l.stach@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Laurentiu,

On Mon, Sep 23, 2019 at 11:14 AM Laurentiu Palcu
<laurentiu.palcu@nxp.com> wrote:

> +
> +                       dcss: dcss@0x32e00000 {

Node names should be generic, so:

dcss: display-controller@32e00000

> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               compatible = "nxp,imx8mq-dcss";
> +                               reg = <0x32e00000 0x2D000>, <0x32e2f000 0x1000>;

0x2d000 for consistency.

> +                               interrupts = <6>, <8>, <9>;

The interrupts are passed in the <GIC_SPI xxx IRQ_TYPE_LEVEL_HIGH> format.
