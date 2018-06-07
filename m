From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx6qdl-sabreauto: Add sensors
Date: Thu, 7 Jun 2018 14:07:50 -0300
Message-ID: <CAOMZO5Czf1bO7vJZ1UG46DyVhzApqS82GFw+NFm_HN5tjD=xoQ@mail.gmail.com>
References: <b31ca3ff50566c193003614d0bbf5e0a0e95901c.1528390418.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b31ca3ff50566c193003614d0bbf5e0a0e95901c.1528390418.git.leonard.crestez@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Fugang Duan <fugang.duan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Leonard,

On Thu, Jun 7, 2018 at 2:00 PM, Leonard Crestez <leonard.crestez@nxp.com> wrote:

> +
> +                       isl29023@44 {

According to Devicetree Specification v0.2 document:

"The name of a node should be somewhat generic, reflecting the function
of the device and not its precise programming model."

So you could write:

light-sensor@44


> +                               compatible = "isil,isl29023";
> +                               reg = <0x44>;
> +                               interrupt-parent = <&gpio5>;
> +                               interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
> +                       };
> +
> +                       mag3110@0e {

No leading zero in unit address, please.

Building with W=1 will give you warnings about it.

magnetometer@e

> +                               compatible = "fsl,mag3110";
> +                               reg = <0x0e>;
> +                               interrupt-parent = <&gpio2>;
> +                               interrupts = <29 IRQ_TYPE_EDGE_RISING>;
> +                       };
> +
> +                       mma8451@1c {

accelerometer@1c
