From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 0/3] mtd: nand: Rework/cleanup the Atmel NAND driver
Date: Wed, 29 Mar 2017 22:05:22 +0200
Message-ID: <20170329220522.5398179a@bbrezillon>
References: <1489651362-17077-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1489651362-17077-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, linux-kernel@vger.kernel.org, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Marek Vasut <marek.vasut@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 16 Mar 2017 09:02:39 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> This is a complete rewrite of the driver whose main purpose is to
> support the new DT representation where the NAND controller node is now
> really visible in the DT and appears under the EBI bus. With this new
> representation, we can add other devices under the EBI bus without
> risking pinmuxing conflicts (the NAND controller is under the EBI
> bus logic and as such, share some of its pins with other devices
> connected on this bus).
> 
> Even though the goal of this rework was not necessarily to add new
> features, the new driver has been designed with this in mind. With a
> clearer separation between the different blocks and different IP
> revisions, adding new functionalities should be easier (we already
> have plans to support SMC timing configuration so that we no longer
> have to rely on the configuration done by the bootloader/bootstrap).
> 
> Also note that we no longer have a custom ->cmdfunc() implementation,
> which means we can now benefit from new features added in the core
> implementation for free (support for new NAND operations for example).
> 
> The last thing that we gain with this rework is support for multi-chips
> and multi-dies chips, thanks to the clean NAND controller <-> NAND
> devices representation.
> 
> This new driver has been tested on several platforms (at91sam9261,
> at91sam9g45, at91sam9x5, sama5d3 and sama5d4) to make sure it did not
> introduce regressions, and it's worth mentioning that old bindings are
> still supported (which partly explain the positive diffstat).

Applied the whole series.

> 
> Regards,
> 
> Boris
> 
> Changes since v2:
> - add error messages when the NFC reports an error
> - drop AVR32 compat code
> - add acks
> - minor coding style fixes
> 
> Changes since v1:
> - change function/structure prefixes (asked by Nicolas)
> - drop applied patches
> - use new GPIO helpers
> - set ->chip_delay to 40 as done in the old driver (reported by Nicolas)
> - rework read_page to improve perfs
> - add a better commit message to patch 2
> 
> Boris Brezillon (3):
>   mtd: nand: Cleanup/rework the atmel_nand driver
>   mtd: nand: atmel: Document the new DT bindings
>   mtd: nand: Remove unused chip->write_page() hook
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  107 +-
>  MAINTAINERS                                        |    2 +-
>  drivers/mtd/nand/Kconfig                           |    6 +-
>  drivers/mtd/nand/Makefile                          |    2 +-
>  drivers/mtd/nand/atmel/Makefile                    |    4 +
>  drivers/mtd/nand/atmel/nand-controller.c           | 2198 +++++++++++++++++
>  drivers/mtd/nand/atmel/pmecc.c                     | 1020 ++++++++
>  drivers/mtd/nand/atmel/pmecc.h                     |   73 +
>  drivers/mtd/nand/atmel_nand.c                      | 2479 --------------------
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  163 --
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  103 -
>  drivers/mtd/nand/nand_base.c                       |   12 +-
>  include/linux/mtd/nand.h                           |    4 -
>  13 files changed, 3411 insertions(+), 2762 deletions(-)
>  create mode 100644 drivers/mtd/nand/atmel/Makefile
>  create mode 100644 drivers/mtd/nand/atmel/nand-controller.c
>  create mode 100644 drivers/mtd/nand/atmel/pmecc.c
>  create mode 100644 drivers/mtd/nand/atmel/pmecc.h
>  delete mode 100644 drivers/mtd/nand/atmel_nand.c
>  delete mode 100644 drivers/mtd/nand/atmel_nand_ecc.h
>  delete mode 100644 drivers/mtd/nand/atmel_nand_nfc.h
> 
