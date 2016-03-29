From: Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/2] mtd: spi-nor: add an alternative method to support memory > 16MiB
Date: Tue, 29 Mar 2016 14:24:11 +0200
Message-ID: <cover.1459251929.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch was tested on a sama5d2 xplained board + Macronix mx25l25673g.

It provides us with an alternative method to support SPI NOR memory above
16MiB (128Mib). Indeed the previous method (still default) makes the
memory enter it's 4byte-address method. However this mode has some
annoying side effects for early bootloarders: it changes the internal
state of the memory hence when using regular (Fast) Read op codes
(0x03, 0x0b, 0x6b, ...) the memory now expects 4byte addresses whereas
some bootloaders still use these op codes with 3byte addresses.

The new method translates the 3byte address op codes into their 4byte
address version:
0x03 -> 0x13  Read
0x0b -> 0x0c  Fast Read
0x6b -> 0x6c  Fast Read 1-1-4
0x02 -> 0x12  Page Program
0xd8 -> 0xdc  Sector Erase
...

The internal state of the SPI NOR memory is left unchanged.

However the 4byte address op codes are not supported by all memories.
For instance Macronix mx25l25635e and mx25l25673g share the very same
JEDEC ID (C22019) with no additional ext_id bytes to differentiate them.
The 35e doesn't support the 4byte address op codes whereas the 73g does.
So there is no mean for the software to discover at runtime whether the
hardware supports these op codes. Hence this patch checks a new DT
property, "m25p,4byte-opcoes", to select the proper method to deal with
a >16MiB SPI NOR memory.


Best regards,

Cyrille


ChangeLog:

v3 -> v4:
- rename "m25p,4byte-opcodes" DT property into "spi-nor-4byte-opcodes".
- replace "can not" by "cannot" in DT binding documentation.

v2 -> v3:
- fix errors reported by kbuild test robot: replace SPINOR_OP_READ4.* op
  codes by SPINOR_OP_READ.*_4B in st_spi_fsm.c
- rename QUAD_PP into PP_1_1_4 and QUAD_PP_MX into PP_1_4_4

v1 -> v2:
- remove the Kconfig option and use the new "m25p,4byte-opcodes" DT
  property instead.


Cyrille Pitchen (2):
  mtd: spi-nor: add an alternative method to support memory >16MiB
  doc: dt: mtd: add a DT property to enable the use of 4byte-address op
    codes

 .../devicetree/bindings/mtd/jedec,spi-nor.txt      |  11 +++
 drivers/mtd/devices/serial_flash_cmds.h            |   7 --
 drivers/mtd/devices/st_spi_fsm.c                   |  28 +++---
 drivers/mtd/spi-nor/spi-nor.c                      | 100 ++++++++++++++++-----
 include/linux/mtd/spi-nor.h                        |  21 +++--
 5 files changed, 119 insertions(+), 48 deletions(-)

-- 
1.8.2.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
