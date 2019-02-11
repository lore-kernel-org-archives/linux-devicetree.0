From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add DMA properties for ECSPI
Date: Mon, 11 Feb 2019 09:23:06 +0800
Message-ID: <20190211012305.GA21496@dragon>
References: <20190107132226.16216-1-stefan@agner.ch>
 <20190107132226.16216-2-stefan@agner.ch>
 <1549573243.3075.72.camel@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549573243.3075.72.camel@impinj.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: "stefan@agner.ch" <stefan@agner.ch>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 07, 2019 at 09:00:44PM +0000, Trent Piepho wrote:
> On Mon, 2019-01-07 at 14:22 +0100, Stefan Agner wrote:
> > Allow to use DMA for SPI by adding the appropriate DMA properites
> > to the ecspi nodes.
> > 
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> > ---
> >  arch/arm/boot/dts/imx7s.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> > index a052198f6e96..b9330176c3af 100644
> > --- a/arch/arm/boot/dts/imx7s.dtsi
> > +++ b/arch/arm/boot/dts/imx7s.dtsi
> > @@ -653,6 +653,8 @@
> >  				clocks = <&clks IMX7D_ECSPI4_ROOT_CLK>,
> >  					<&clks IMX7D_ECSPI4_ROOT_CLK>;
> >  				clock-names = "ipg", "per";
> > +				dmas = <&sdma 6 7 1>, <&sdma 7 7 2>;
> > +				dma-names = "rx", "tx";
> >  				status = "disabled";
> >  			};
> 
> After updating my kernel to linux-next on my IMX7d based device, I
> found that an FPGA, which is programmed via the ECSPI interface, was no
> longer accepting its image.
> 
> I tracked the problem to this change.  If I turn off DMA, it works.
> 
> There's an interesting thing that happens when DMA is used.  The SPI
> clock changes.  Instead of cycling continuously for the entire
> transfer, it instead clocks out 8 bits, then pauses for 4 bit times,
> then the next byte, etc.  So it's a net of about 50% slower.  The pause
> between bytes scales with spi frequency to always be about 4 bits.
> 
> Here's a trace with DMA: https://imagebin.ca/v/4WEkEnvsVSkq
> 
> Here's what it looks like without DMA:
> https://imagebin.ca/v/4WEkVfEqpQ12
> 
> It seems like there are other problems with DMA too.  Here's an error
> I'll random get every so often.
> 
> [  142.082325] spi_master spi1: I/O Error in DMA RX
> [  142.085678] spidev spi1.0: SPI transfer failed: -110
> [  142.089389] spi_master spi1: failed to transfer one message from queue
> 
> Not sure if the timeout is overly aggressive or if there is some other failure.
> 
> Then sometimes there errors are worse:
> 
> Internal error: Oops - undefined instruction: 0 [#1] PREEMPT SMP ARM
> Modules linked in:
> CPU: 0 PID: 1006 Comm: fpga-loader Not tainted 5.0.0-rc4-next-20190201 #1
> Hardware name: Freescale i.MX7 Dual (Device Tree)
> PC is at sg_last+0x4c/0x68
> LR is at   (null)
> pc : [<80494800>]    lr : [<00000000>]    psr: 60010013
> sp : bf0add5c  ip : bea94598  fp : bf371218
> r10: bf0949f0  r9 : 00000000  r8 : bf094800
> r7 : bdc39300  r6 : bf371000  r5 : bdc39300  r4 : bf094b68
> r3 : 00000000  r2 : 00000001  r1 : 00000001  r0 : bea94580
> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
> Control: 30c5387d  Table: bea94000  DAC: fffffffd
> Process fpga-loader (pid: 1006, stack limit = 0x61bc8b73)
> Stack: (0xbf0add5c to 0xbf0ae000)
> dd40:                                                                8056cdb0
> dd60: 8056c9ac 00001000 00000000 bdc39300 bf094800 bf094b68 bf371000 00000000
> dd80: bf0949f0 8056bc00 bf094800 bdc39300 bf0adeac bf094800 bf094ad0 80569edc
> ...
> dfc0: 00217301 00150000 00001000 00000036 00df2010 00000003 00001000 00df1008
> dfe0: 00022f70 7e9ebb14 000113b8 76f2a7f8 20010030 00000003 00000000 00000000
> [<80494800>] (sg_last) from [<8056cdb0>] (spi_imx_transfer+0xd8/0x448)
> [<8056cdb0>] (spi_imx_transfer) from [<8056bc00>] (spi_bitbang_transfer_one+0x50/0xa0)
> [<8056bc00>] (spi_bitbang_transfer_one) from [<80569edc>] (spi_transfer_one_message+0x18c/0x3e0)
> [<80569edc>] (spi_transfer_one_message) from [<8056a498>] (__spi_pump_messages+0x368/0x518)
> [<8056a498>] (__spi_pump_messages) from [<8056a7ec>] (__spi_sync+0x198/0x1a0)
> [<8056a7ec>] (__spi_sync) from [<8056a818>] (spi_sync+0x24/0x3c)
> [<8056a818>] (spi_sync) from [<8056ae14>] (spidev_sync+0x38/0x4c)
> [<8056ae14>] (spidev_sync) from [<8056b6f4>] (spidev_ioctl+0x660/0x704)
> [<8056b6f4>] (spidev_ioctl) from [<80335f9c>] (do_vfs_ioctl+0xac/0x79c)
> [<80335f9c>] (do_vfs_ioctl) from [<803366c0>] (ksys_ioctl+0x34/0x58)
> [<803366c0>] (ksys_ioctl) from [<80201120>] (ret_fast_syscall+0x0/0x4c)
> Exception stack(0xbf0adfa8 to 0xbf0adff0)
> dfa0:                   00217301 00150000 00000003 40206b00 7e9ebb80 03938700
> dfc0: 00217301 00150000 00001000 00000036 00df2010 00000003 00001000 00df1008
> dfe0: 00022f70 7e9ebb14 000113b8 76f2a7f8
> Code: e1510002 1afffff3 e3530000 149df004 (e7f001f2)
> ---[ end trace 1588229fc7541669 ]---
> 
> I think DMA on imx not be ready for prime time yet.

I dropped both patches from my tree.

Shawn
