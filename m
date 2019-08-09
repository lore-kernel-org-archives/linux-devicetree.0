From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 00/19] Initial support for Marvell MMP3 SoC
Date: Fri,  9 Aug 2019 11:31:39 +0200
Message-ID: <20190809093158.7969-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

this patch set adds support for the Marvell MMP3 processor. MMP3 is used
in OLPC XO-4 laptops, Panasonic Toughpad FZ-A1 tablet and Dell Wyse 3020
Tx0D thin clients.

Apart from the adjustments in mach-mmp/, the patch makes necessary
changes to the irqchip driver and adds an USB2 PHY driver. The latter
has a dependency on the mach-mmp/ changes, so it can't be submitted
separately.

The patch set has been tested to work on Wyse Tx0D and not ruin MMP2
support on XO-1.75.

Lubo
