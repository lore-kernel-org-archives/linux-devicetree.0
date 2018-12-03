From: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [PATCH v1 0/2] SPI-NOR add NPCM FIU controller driver
Date: Mon, 3 Dec 2018 10:22:40 +0100
Message-ID: <20181203102240.79a86a26@bbrezillon>
References: <20181203091456.454030-1-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203091456.454030-1-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com, venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au, linux-mtd@lists.infradead.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon,  3 Dec 2018 11:14:54 +0200
Tomer Maimon <tmaimon77@gmail.com> wrote:

> This patch set adds Flash Interface Unit(FIU) SPI-NOR
> support for the Nuvoton NPCM Baseboard Management 
> Controller (BMC).
>     
> The FIU supports single, dual or quad communication interface.
>     
> the FIU controller can operate in following modes:
> - User Mode Access(UMA): provides flash access by using an
>   indirect address/data mechanism.
> - direct rd/wr mode: maps the flash memory into the core
>   address space.
> - SPI-X mode: used for an expansion bus to an ASIC or CPLD.
> 
> The NPCM750/730/715/710 supports up to three FIU devices:
> - FIU0 supports two chip select.
> - FIU3 supports four chip select.
> - FIUX supports two chip select.
> 
> The NPCM FIU driver tested on NPCM750 evaluation board.
> 
> Tomer Maimon (2):
>   dt-binding: mtd: add NPCM FIU controller
>   mtd: spi-nor: add NPCM FIU controller driver
> 
>  Documentation/devicetree/bindings/mtd/npcm-fiu.txt |  64 ++
>  drivers/mtd/spi-nor/Kconfig                        |   8 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/npcm-fiu.c                     | 930 +++++++++++++++++++++

We are currently trying to move all SPI NOR controller drivers out of
drivers/mtd/spi-nor. Can you try to implement the spi-mem interface [1]
and place your driver in drivers/spi/. 

[1]https://elixir.bootlin.com/linux/v4.20-rc5/source/include/linux/spi/spi-mem.h#L185
