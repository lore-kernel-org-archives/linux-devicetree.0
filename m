From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: imx51-zii-scu3-esb: Fix RAVE SP watchdog
 compatible string
Date: Fri, 13 Jul 2018 14:50:54 -0300
Message-ID: <CAOMZO5ADn2FdZ+4uOV-K_vD+cLxd3a25Dbttbe7XLkB=u=6Dpg@mail.gmail.com>
References: <20180713173005.19552-1-andrew.smirnov@gmail.com> <20180713173005.19552-3-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180713173005.19552-3-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 13, 2018 at 2:30 PM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:
> It looks like I made a nasty typo in the original patch which resulted
> in missing watchdog device. Fix it.
>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: cphealy@gmail.com
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
