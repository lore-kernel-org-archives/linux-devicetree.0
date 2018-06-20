From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3] ARM: dts: imx51-zii-rdu1: fix touchscreen pinctrl
Date: Wed, 20 Jun 2018 17:31:52 -0300
Message-ID: <CAOMZO5BTMRJmrjM7X3-7Qi1wuciOnLZhAUuWN27Dtoc0cZXVSA@mail.gmail.com>
References: <20180620194239.2730-1-nick@shmanahar.org> <20180620202045.27965-1-nick@shmanahar.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180620202045.27965-1-nick@shmanahar.org>
Sender: stable-owner@vger.kernel.org
To: Nick Dyer <nick@shmanahar.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, stable <stable@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 20, 2018 at 5:20 PM, Nick Dyer <nick@shmanahar.org> wrote:
> The pinctrl settings were incorrect for the touchscreen interrupt line, causing
> an interrupt storm. This change has been tested with both the atmel_mxt_ts and
> RMI4 drivers on the RDU1 units.
>
> The value 0x4 comes from the value of register IOMUXC_SW_PAD_CTL_PAD_CSI1_D8
> from the old vendor kernel.
>
> Signed-off-by: Nick Dyer <nick@shmanahar.org>
> Fixes: ceef0396f367 ("ARM: dts: imx: add ZII RDU1 board")
> Cc: <stable@vger.kernel.org> # 4.15+

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
