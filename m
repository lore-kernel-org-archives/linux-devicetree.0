From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: i.MX6: Add BTicino i.MX6DL Mamoj initial support
Date: Thu, 15 Mar 2018 14:58:41 -0300
Message-ID: <CAOMZO5CNDN9RbuBiELKdY9xjUFksMAg16enwtpd+bBtOZbdZrg@mail.gmail.com>
References: <20180315170710.9551-1-jagan@amarulasolutions.com> <20180315170710.9551-2-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315170710.9551-2-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio maggi <fabio.mauri@bticino.it>, lamiaposta71@gmail.com, Andrea CORTESE <andrea.cortese@bticino.it>, "davide . bonfanti" <davide.bonfanti@bticino.it>, Shyam Saini <shyam.saini@amarulasolutions.com>, Michael Trimarchi <michael@amarulasolutions.com>, Simone CIANNI <simone.cianni@bticino.it>, Raffaele RECALCATI <raffaele.recalcati@bticino.it>
List-Id: devicetree@vger.kernel.org

Hi Jagan,

On Thu, Mar 15, 2018 at 2:07 PM, Jagan Teki <jagan@amarulasolutions.com> wrote:

> +&iomuxc {
> +       pinctrl_enet: enetgrp {
> +               fsl,pins = <
> +                       MX6QDL_PAD_ENET_MDIO__ENET_MDIO         0x1b0b0
> +                       MX6QDL_PAD_ENET_MDC__ENET_MDC           0x1b0b0
> +                       MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK    0x1b0b1
> +                       MX6QDL_PAD_ENET_TXD0__ENET_TX_DATA0     0x1b0b0
> +                       MX6QDL_PAD_ENET_TXD1__ENET_TX_DATA1     0x1b0b0
> +                       MX6QDL_PAD_KEY_ROW2__ENET_TX_DATA2      0x1b0b0
> +                       MX6QDL_PAD_KEY_ROW0__ENET_TX_DATA3      0x1b0b0
> +                       MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN       0x1b0b0
> +                       MX6QDL_PAD_GPIO_19__ENET_TX_ER          0x1b0b0
> +                       MX6QDL_PAD_GPIO_18__ENET_RX_CLK         0x1b0b1
> +                       MX6QDL_PAD_ENET_RXD0__ENET_RX_DATA0     0x1b0b0
> +                       MX6QDL_PAD_ENET_RXD1__ENET_RX_DATA1     0x1b0b0
> +                       MX6QDL_PAD_KEY_COL2__ENET_RX_DATA2      0x1b0b0
> +                       MX6QDL_PAD_KEY_COL0__ENET_RX_DATA3      0x1b0b0
> +                       MX6QDL_PAD_ENET_CRS_DV__ENET_RX_EN      0x1b0b0
> +                       MX6QDL_PAD_ENET_RX_ER__ENET_RX_ER       0x1b0b0
> +                       MX6QDL_PAD_KEY_COL3__ENET_CRS           0x1b0b0
> +                       MX6QDL_PAD_KEY_ROW1__ENET_COL           0x1b0b0
> +                       /* KSZ8041 PHY Reset */
> +                       MX6QDL_PAD_KEY_COL1__GPIO4_IO08         0x1b0b0

You use a GPIO for the Ethernet PHY reset, but you missed to pass
'phy-reset-gpios' in the fec node.
