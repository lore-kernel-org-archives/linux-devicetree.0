From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v2 2/5] irqchip: Add Renesas RZ/A1 Interrupt Controller
 driver
Date: Tue, 30 Apr 2019 13:49:24 +0000
Message-ID: <TY1PR01MB1562FF2E949141B569DA32F88A3A0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190430121254.3737-1-geert+renesas@glider.be>
 <20190430121254.3737-3-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430121254.3737-3-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 30, 2019, Geert Uytterhoeven wrote:
> Add a driver for the Renesas RZ/A1 Interrupt Controller.
>=20
> This supports using up to 8 external interrupts on RZ/A1, with
> configurable sense select.
>=20
> NMI edge select is not yet supported.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Use u16 for register values,
>   - Use relaxed I/O accessors,
>   - Use "rza1-irqc" as irq_chip class name,
>   - Replace gic_spi_base in OF match data by renesas,gic-spi-base in DT.
> ---
>  drivers/irqchip/Kconfig            |   4 +
>  drivers/irqchip/Makefile           |   1 +
>  drivers/irqchip/irq-renesas-rza1.c | 235 +++++++++++++++++++++++++++++
>  3 files changed, 240 insertions(+)
>  create mode 100644 drivers/irqchip/irq-renesas-rza1.c

Tested on RZ/A1H RSK and RZ/A2M EVB (push buttons and LCD
touchscreen controller).

Thanks!

Tested-by: Chris Brandt <chris.brandt@renesas.com>
