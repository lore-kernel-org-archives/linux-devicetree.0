From: Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/5] mtd: atmel_nand: Add support for NAND Flash on SAMA5D2
Date: Wed, 13 Jan 2016 17:34:12 +0100
Message-ID: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Yang Wenyou <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Josh Wu <rainyfeeling-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Romain Izard <romain.izard.pro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The NAND Flash controller for SAMA5D2 has small differences that make it
impossible to use the existing driver for SAMA5D3. This patchset uses the
device tree's compatible string to get those differences, and the code is
slightly modified to handle them.

Applies on the Atmel Linux 4.1 branch for now, but only the dtsi file
differs from the mainline.

Compile tested for all SAMA5 chips for now, and tested on SAMA5D3xek as
there is no existing SAMA5D2 board with NAND Flash memory (yet).

RFC -> V1:
- Split the support of 32-bit ECC on SAMA5D2 in two commits
- Fix the missing ECC strength configuration code

Romain Izard (5):
  mtd: atmel_nand: Do not warn on bitflips
  mtd: atmel_nand: Support variable RB_EDGE interrupts
  mtd: atmel_nand: Support PMECC on SAMA5D2
  mtd: atmel_nand: Support 32-bit ECC strength
  ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes

 .../devicetree/bindings/mtd/atmel-nand.txt         | 12 ++-
 arch/arm/boot/dts/sama5d2.dtsi                     | 38 +++++++++
 drivers/mtd/nand/atmel_nand.c                      | 89 ++++++++++++++++++----
 drivers/mtd/nand/atmel_nand_ecc.h                  |  9 ++-
 drivers/mtd/nand/atmel_nand_nfc.h                  |  5 +-
 5 files changed, 131 insertions(+), 22 deletions(-)

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
