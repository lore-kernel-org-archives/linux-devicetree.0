From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH_V3 0/2] mtd: nand: jz4780: Add nand and bch driver
Date: Tue, 31 Mar 2015 10:20:30 -0700
Message-ID: <20150331172030.GE19571@brian-ubuntu>
References: <1427821181-40843-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427821181-40843-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: dwmw2@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 31, 2015 at 05:59:39PM +0100, Zubair Lutfullah Kakakhel wrote:
> Hi,

Hi!

Nit: can you drop the underscore in your 'PATCH_Vx' subjects? It'd make
my filtering a bit easier. I usually expect 'PATCH v3'. Thanks!

> Two patches based on 4.0-rc6 that add NAND and BCH controller
> drivers for the Ingenic JZ4780 SoC.
> 
> Hope these can make it in time for 4.1.
> 
> Tested on the MIPS Creator CI20.
> 
> Core JZ4780 support is still in-flight.

Sorry, I can't even compile test your patches, since I don't have the
dependencies. So I can't accept your patches yet, and they most likely
won't make it to 4.1. Or if you can point me to the right place, perhaps
we can work something out between the tree(s) that will contain the
dependencies.

Note that I'm not worried about the missing MACH_JZ4780 sybmol and your
core platform support, as much as the missing JZ4780_NEMC support.

> Review and feedback welcome.
> 
> V2 - > V3
> Rebase to 4.0-rc6
> Binding changes and fixes based on feedback by Brian Norris (Thank-you)

I had a few questions on the driver that you didn't answer, I believe.
It looks like maybe you silently answered them in this v3 code?

> V1 - > V2
> Fixed module license macros
> Rebase to 4.0-rc3
> 
> Thanks,
> ZubairLK
> 
> Alex Smith (2):
>   dt-bindings: binding for jz4780-{nand,bch}
>   mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs
> 
>  .../bindings/mtd/ingenic,jz4780-nand.txt           |  57 ++++
>  drivers/mtd/nand/Kconfig                           |   7 +
>  drivers/mtd/nand/Makefile                          |   1 +
>  drivers/mtd/nand/jz4780_bch.c                      | 353 +++++++++++++++++++
>  drivers/mtd/nand/jz4780_bch.h                      |  42 +++
>  drivers/mtd/nand/jz4780_nand.c                     | 376 +++++++++++++++++++++
>  6 files changed, 836 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
>  create mode 100644 drivers/mtd/nand/jz4780_bch.c
>  create mode 100644 drivers/mtd/nand/jz4780_bch.h
>  create mode 100644 drivers/mtd/nand/jz4780_nand.c
> 

Brian
