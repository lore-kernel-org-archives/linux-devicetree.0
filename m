From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: Re: [PATCH 1/4] mtd: lpc32xx_slc: Select AMBA_PL08X in Kconfig
Date: Wed, 27 Jun 2012 16:49:54 -0300
Message-ID: <CAAAP30HE++jF084LZbG+yMgddKtwqUAwVxuiXr4RPD0B4-H_8A@mail.gmail.com>
References: <1340812275-1197-1-git-send-email-stigge@antcom.de>
	<20120627191542.GC25319@n2100.arm.linux.org.uk>
	<CAAAP30Fdr2_tcgMYjCirVPCPTtrUgbeMb=7j=69wGtvJeiLsOA@mail.gmail.com>
	<20120627193039.GF25319@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120627193039.GF25319@n2100.arm.linux.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Roland Stigge <stigge@antcom.de>, dedekind1@gmail.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2012 at 4:30 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> Well, the DMA engine API gets stubbed out when no DMA engine is selected,
> so I'm not sure why spi-pl022 needs all those ifdefs (yes, you may wish
> to do that if you want to shrink your driver private struct size.)
>
> Provided the driver is capable of working without DMA engine, I don't see
> any reason what so ever to make that driver select or depend on DMA engine
> stuff.

Ok, so this one can be dropped.

It was proposed because of an build error in the past, but it's not
happening anymore.
