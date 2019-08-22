From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 00/20] Initial support for Marvell MMP3 SoC
Date: Thu, 22 Aug 2019 11:26:23 +0200
Message-ID: <20190822092643.593488-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,=20

this is a second spin of a patch set that adds support for the Marvell
MMP3 processor. MMP3 is used in OLPC XO-4 laptops, Panasonic Toughpad
FZ-A1 tablet and Dell Wyse 3020 Tx0D thin clients.=20

Compared to v1, there's a handful of fixes in response to reviews. Patch
02/20 is new. Details in individual patches.
=20
Apart from the adjustments in mach-mmp/, the patch makes necessary=20
changes to the irqchip driver and adds an USB2 PHY driver. The latter=20
has a dependency on the mach-mmp/ changes, so it can't be submitted=20
separately.
=20
The patch set has been tested to work on Wyse Tx0D and not ruin MMP2=20
support on XO-1.75.=20

Thanks
Lubo
