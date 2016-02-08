From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] mtd: denali: fix property name for Denali DT binding
Date: Mon, 8 Feb 2016 15:37:57 -0600
Message-ID: <20160208213757.GA3223@rob-hp-laptop>
References: <1454916702-20982-1-git-send-email-yamada.masahiro@socionext.com>
 <5298318.0qJ9fLYbSx@wuerfel>
 <CAK7LNAS2r=_RL6dmj1xhCzGtvMP=emC=_bW4Ot5SMe6ij-WpBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNAS2r=_RL6dmj1xhCzGtvMP=emC=_bW4Ot5SMe6ij-WpBQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org, Dinh Nguyen <dinguyen@altera.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 08, 2016 at 05:41:33PM +0900, Masahiro Yamada wrote:
> Hi Arnd,
> 
> 
> 2016-02-08 17:29 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> > On Monday 08 February 2016 16:31:42 Masahiro Yamada wrote:
> >> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> >> index b04d03a..785b825 100644
> >> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> >> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> >> @@ -5,7 +5,7 @@ Required properties:
> >>    - reg : should contain registers location and length for data and reg.
> >>    - reg-names: Should contain the reg names "nand_data" and "denali_reg"
> >>    - interrupts : The interrupt number.
> >> -  - dm-mask : DMA bit mask
> >> +  - dma-mask : DMA bit mask
> >>
> >>  The device tree may optionally contain sub-nodes describing partitions of the
> >>  address space. See partition.txt for more detail.
> >>
> >
> > It looks like this binding is wrong in multiple ways, and it doesn't seem to
> > be used in any .dts files. Is this actually being shipped anywhere or
> > could we try to fix the binding properly?
> >
> 
> Looks like it is locally used in Altera's Rocketboard tree now.
> 
> See this:
> 
> https://github.com/altera-opensource/linux-socfpga/blob/socfpga-4.3/arch/arm/boot/dts/socfpga.dtsi
> 
> 
> I hope Dinh can comment on the status.

>From the looks of it, this property should be dropped and the driver 
should be updated to not touch dev->dma_mask. The core sets it up 
correctly now.

Rob
