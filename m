From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 0/9] mtd: rawnand: denali: exec_op(), controller/chip
 separation, and cleanups
Date: Thu, 18 Apr 2019 18:12:50 +0200
Message-ID: <20190418181250.14d7da9c@xps13>
References: <1554177789-15414-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554177789-15414-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Masahiro,

Masahiro Yamada <yamada.masahiro@socionext.com> wrote on Tue,  2 Apr
2019 13:03:00 +0900:

> I took time for the Denali driver to catch up with the latest framework.
> 
>  - switch over to exec_op() and remove legacy hooks
> 
>  - separate controller/chips
> 
>  - various cleanups
> 
> Major changes in v5:
> 
>   - Passing both nand_chip and denali is redundant.
>     Pass only nand_chip to local helpers.
> 
> Major changes in v4:
>   - Add denali_exec_out() and denali_exec_in()
>     in order to make denali_exec_instr() readable
> 
>   - Make .read_page_raw() and .write_page_raw() even simpler
>     by giving up the performance
> 
> Major changes in v3:
>   - Drop "mtd: rawnand: denali: use more precise timeout for NAND_OP_WAITRDT_INSTR"
>     entirely according to the review comments in v2
> 
>   - Add comments to helpers in 2/9
> 
> 
> 
> Masahiro Yamada (9):
>   mtd: rawnand: denali: use more nand_chip pointers for internal
>     functions
>   mtd: rawnand: denali: refactor raw page accessors
>   mtd: rawnand: denali: remove unneeded casts in denali_{read,write}_pio
>   mtd: rawnand: denali: switch over to ->exec_op() from legacy hooks
>   mtd: rawnand: denali: use bool type instead of int where appropriate
>   mtd: rawnand: denali_pci: rename goto labels
>   mtd: rawnand: denali: decouple controller and NAND chips
>   mtd: rawnand: denali: remove DENALI_NR_BANKS macro
>   mtd: rawnand: denali: clean up coding style
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |   40 +-
>  drivers/mtd/nand/raw/denali.c                      | 1146 ++++++++++----------
>  drivers/mtd/nand/raw/denali.h                      |  117 +-
>  drivers/mtd/nand/raw/denali_dt.c                   |   98 +-
>  drivers/mtd/nand/raw/denali_pci.c                  |   38 +-
>  5 files changed, 823 insertions(+), 616 deletions(-)
> 


Applied to 
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git 
branch nand/next.

Thanks,
Miquèl



Thanks,
Miquèl
