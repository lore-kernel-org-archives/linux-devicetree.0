From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6: RIoTboard Add chosen stdout-path property
Date: Mon, 18 Jun 2018 12:47:10 -0300
Message-ID: <CAOMZO5Bt+7FGT4Xk7HZdVjukNsG=eY5-P+9Qnig6h-cQSJvOvA@mail.gmail.com>
References: <20180618154257.16919-1-manu@freebsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618154257.16919-1-manu@freebsd.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Emmanuel Vadot <manu@freebsd.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2018 at 12:42 PM, Emmanuel Vadot <manu@freebsd.org> wrote:
> The RIoTboard debug uart is connected to serial1.
> Add a chosen property in the DTS so OS knows what serial port to use for
> the console.
>
> Signed-off-by: Emmanuel Vadot <manu@freebsd.org>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
