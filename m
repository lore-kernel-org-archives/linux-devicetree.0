From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/4] mtd: lpc32xx_slc: Select AMBA_PL08X in Kconfig
Date: Wed, 27 Jun 2012 20:30:39 +0100
Message-ID: <20120627193039.GF25319@n2100.arm.linux.org.uk>
References: <1340812275-1197-1-git-send-email-stigge@antcom.de> <20120627191542.GC25319@n2100.arm.linux.org.uk> <CAAAP30Fdr2_tcgMYjCirVPCPTtrUgbeMb=7j=69wGtvJeiLsOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAAP30Fdr2_tcgMYjCirVPCPTtrUgbeMb=7j=69wGtvJeiLsOA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Cc: Roland Stigge <stigge@antcom.de>, dedekind1@gmail.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2012 at 04:26:18PM -0300, Alexandre Pereira da Silva wr=
ote:
> On Wed, Jun 27, 2012 at 4:15 PM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Wed, Jun 27, 2012 at 05:51:12PM +0200, Roland Stigge wrote:
> >> From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> >>
> >> Since this driver depends on the amba pl08x dma driver, select it =
in Kconfig.
> >>
> >> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
> >> Signed-off-by: Roland Stigge <stigge@antcom.de>
> >> ---
> >> =A0drivers/mtd/nand/Kconfig | =A0 =A01 +
> >> =A01 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> >> index de69978..a9e8b73 100644
> >> --- a/drivers/mtd/nand/Kconfig
> >> +++ b/drivers/mtd/nand/Kconfig
> >> @@ -417,6 +417,7 @@ config MTD_NAND_PXA3xx
> >> =A0config MTD_NAND_SLC_LPC32XX
> >> =A0 =A0 =A0 tristate "NXP LPC32xx SLC Controller"
> >> =A0 =A0 =A0 depends on ARCH_LPC32XX
> >> + =A0 =A0 select AMBA_PL08X
> >> =A0 =A0 =A0 help
> >> =A0 =A0 =A0 =A0 Enables support for NXP's LPC32XX SLC (i.e. for Si=
ngle Level Cell
> >> =A0 =A0 =A0 =A0 chips) NAND controller. This is the default for th=
e PHYTEC 3250
> >
> > Surely not? =A0Drivers using DMA engine really should not depend on=
 any
> > particular DMA engine implementation.
>=20
> Should the DMA code in this driver be ifdef'd like in spi-pl022.c?
>=20
> Or just depend on DMA_ENGINE instead?

Well, the DMA engine API gets stubbed out when no DMA engine is selecte=
d,
so I'm not sure why spi-pl022 needs all those ifdefs (yes, you may wish
to do that if you want to shrink your driver private struct size.)

Provided the driver is capable of working without DMA engine, I don't s=
ee
any reason what so ever to make that driver select or depend on DMA eng=
ine
stuff.
