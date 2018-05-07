From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx51-zii-rdu1: fix touchscreen bindings
Date: Mon, 7 May 2018 11:02:20 -0300
Message-ID: <CAOMZO5A5gXho1_jhGGC6CF02C=JX5vniKB_vxsTcMXC4Ayh4oQ@mail.gmail.com>
References: <20180507135309.32580-1-nikita.yoush@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180507135309.32580-1-nikita.yoush@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lucas Stach <l.stach@pengutronix.de>, Marco Franchi <marcofrk@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Healy <Chris.Healy@zii.aero>
List-Id: devicetree@vger.kernel.org

Hi Nikita,

On Mon, May 7, 2018 at 10:53 AM, Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> This fixes errors in RDU1 device tree that cause touch screens not
> working.

Fixes: ceef0396f367 ("ARM: dts: imx: add ZII RDU1 board")
Cc: stable@vger.kernel.org #4.15+

> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
