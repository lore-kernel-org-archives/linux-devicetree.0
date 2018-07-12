From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx51-zii-scu3-esb: Add switch IRQ line
 pinumx config
Date: Thu, 12 Jul 2018 10:37:47 -0300
Message-ID: <CAOMZO5DfHqKjF6xykJtoC-aA-ATWM6mCZR0VzPVpSDOt-Fs6bQ@mail.gmail.com>
References: <20180712023337.30112-1-andrew.smirnov@gmail.com> <20180712023337.30112-2-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712023337.30112-2-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Andrey,

On Wed, Jul 11, 2018 at 11:33 PM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:

> +       pinctrl_switch: switchgrp {
> +               fsl,pins = <
> +                       MX51_PAD_AUD3_BB_CK__GPIO4_20           0xc5

The i.MX51 Reference Manual states that 0xa5 is the default reset
value for the register IOMUXC_SW_PAD_CTL_PAD_AUD3_BB_CK.

By reading your commit log I had the impression you wanted to provide
the default value explicitly.

Please clarify.
