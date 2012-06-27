From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: Re: [PATCH 1/4] mtd: lpc32xx_slc: Select AMBA_PL08X in Kconfig
Date: Wed, 27 Jun 2012 16:26:18 -0300
Message-ID: <CAAAP30Fdr2_tcgMYjCirVPCPTtrUgbeMb=7j=69wGtvJeiLsOA@mail.gmail.com>
References: <1340812275-1197-1-git-send-email-stigge@antcom.de>
	<20120627191542.GC25319@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120627191542.GC25319@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Roland Stigge <stigge@antcom.de>, dedekind1@gmail.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 27, 2012 at 4:15 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Wed, Jun 27, 2012 at 05:51:12PM +0200, Roland Stigge wrote:
>> From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
>>
>> Since this driver depends on the amba pl08x dma driver, select it in=
 Kconfig.
>>
>> Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
>> Signed-off-by: Roland Stigge <stigge@antcom.de>
>> ---
>> =A0drivers/mtd/nand/Kconfig | =A0 =A01 +
>> =A01 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index de69978..a9e8b73 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -417,6 +417,7 @@ config MTD_NAND_PXA3xx
>> =A0config MTD_NAND_SLC_LPC32XX
>> =A0 =A0 =A0 tristate "NXP LPC32xx SLC Controller"
>> =A0 =A0 =A0 depends on ARCH_LPC32XX
>> + =A0 =A0 select AMBA_PL08X
>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Enables support for NXP's LPC32XX SLC (i.e. for Sing=
le Level Cell
>> =A0 =A0 =A0 =A0 chips) NAND controller. This is the default for the =
PHYTEC 3250
>
> Surely not? =A0Drivers using DMA engine really should not depend on a=
ny
> particular DMA engine implementation.

Should the DMA code in this driver be ifdef'd like in spi-pl022.c?

Or just depend on DMA_ENGINE instead?
