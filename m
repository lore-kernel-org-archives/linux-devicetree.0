From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: vf610-bk4: Fix qspi node description
Date: Wed, 31 Jul 2019 10:49:53 -0300
Message-ID: <CAOMZO5Bokk_j5h=34e4jrB1-+KPV0P4nURL13VD7kq2=GXfmhg@mail.gmail.com>
References: <20190730214833.30659-1-lukma@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730214833.30659-1-lukma@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Majewski <lukma@denx.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Stefan Agner <stefan@agner.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Lukasz,

On Tue, Jul 30, 2019 at 6:48 PM Lukasz Majewski <lukma@denx.de> wrote:
>
> Before this change the device tree description of qspi node for
> second memory on BK4 board was wrong (applicable to old, removed
> fsl-quadspi.c driver).
>
> As a result this memory was not recognized correctly when used
> with the new spi-fsl-qspi.c driver.
>
> From the dt-bindings:
>
> "Required SPI slave node properties:
>   - reg: There are two buses (A and B) with two chip selects each.
> This encodes to which bus and CS the flash is connected:
> <0>: Bus A, CS 0
> <1>: Bus A, CS 1
> <2>: Bus B, CS 0
> <3>: Bus B, CS 1"
>
> According to above with new driver the second SPI-NOR memory shall
> have reg=<2> as it is connected to Bus B, CS 0.
>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Suggested-by: Fabio Estevam <festevam@gmail.com>
> Fixes: a67d2c52a82f ("ARM: dts: Add support for Liebherr's BK4 device
> (vf610 based)")

Please fix the order of the tags.

- Fixes tag goes first (do not split it into two lines)
- Suggested-by
- Your Signed-off-by

With these changes you can add as the last tag:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
