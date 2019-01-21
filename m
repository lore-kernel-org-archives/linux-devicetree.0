From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: imx6: Add support for Phytec phyBOARD
 i.MX6UL Segin
Date: Mon, 21 Jan 2019 08:33:31 -0200
Message-ID: <CAOMZO5ADc2-U3AR0eepf619qD1i6-oGrn8p1yb0m3HfWtTPscQ@mail.gmail.com>
References: <20190121095705.27452-1-martyn.welch@collabora.com> <20190121095705.27452-2-martyn.welch@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190121095705.27452-2-martyn.welch@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, =?UTF-8?Q?Stefan_Riedm=C3=BCller?= <s.riedmueller@phytec.de>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Christian Hemp <c.hemp@phytec.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 7:57 AM Martyn Welch <martyn.welch@collabora.com> wrote:
>
> The Phytec phyBOARD Segin is i.MX6 based SBC, available with either an
> i.MX6UL or i.MX6ULL SOM and various add-on boards.
>
> The following adds support for the "Full Featured" version of the Segin,
> which is provided with the i.MX6UL SOM and the PEB-EVAL-01 evaluation
> module.
>
> Its hardware specifications are:
>
>  * 512MB DDR3 memory
>  * 512MB NAND flash
>  * Dual 10/100 Ethernet
>  * USB Host and USB OTG
>  * RS232
>  * MicroSD external storage
>  * Audio, RS232, I2C, SPI, CAN headers
>  * Further I/O options via A/V and Expansion headers
>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
