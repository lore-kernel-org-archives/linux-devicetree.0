From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/5] mtd: atmel_nand: Add support for NAND Flash on SAMA5D2
Date: Wed, 10 Feb 2016 10:56:22 +0100
Message-ID: <1455098187-9442-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The NAND Flash controller for SAMA5D2 has small differences that make it
impossible to use the existing driver for SAMA5D3. This patchset uses the
device tree's compatible string to get those differences, and the code is
slightly modified to handle them.

Based on linux-mtd-next, commit ed4eeba7338bb123090f1c8b208f64d8184a896d

See revision 2 to apply on the Atmel Linux 4.1 branch.

Compile tested for sama5_defconfig, and tested on SAMA5D3xek as there is no
existing SAMA5D2 board with NAND Flash memory (yet).

V4:
- Collect Tested-by and Reviewed-By tags

V3:
- Rebase on linux-mtd-next
- Skip patches already in the tree

V2:
- Rebase on v4.4
- Use of_device_get_match_data
- Split message cleanup
- Reword a small part of the atmel_nand device tree binding
- Use 'caps' for all private data structures

V1:
- Split the support of 32-bit ECC on SAMA5D2 in two commits
- Fix the missing ECC strength configuration code

RFC:
- First version

Romain Izard (5):
  mtd: atmel_nand: Support variable RB_EDGE interrupts
  dt-bindings: atmel_nand: Reword the documentation
  mtd: atmel_nand: Support PMECC on SAMA5D2
  mtd: atmel_nand: Support 32-bit ECC strength
  ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes

 .../devicetree/bindings/mtd/atmel-nand.txt         | 31 +++++----
 arch/arm/boot/dts/sama5d2.dtsi                     | 38 +++++++++++
 drivers/mtd/nand/atmel_nand.c                      | 77 ++++++++++++++++++----
 drivers/mtd/nand/atmel_nand_ecc.h                  |  9 ++-
 drivers/mtd/nand/atmel_nand_nfc.h                  |  3 +-
 5 files changed, 131 insertions(+), 27 deletions(-)

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
