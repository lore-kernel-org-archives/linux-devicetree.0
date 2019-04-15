From: Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] misc: Add NPCM LPC BPC driver support
Date: Mon, 15 Apr 2019 15:12:33 +0300
Message-ID: <20190415121235.255028-1-tmaimon77@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, arnd@arnd.de, robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com, venture@google.com, brendanhiggins@google.com, avifishman70@gmail.com, joel@jms.id.au
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch set adds BIOS Post code (BPC) support for the
Nuvoton NPCM Baseboard Management Controller (BMC).

Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two
configurable I/O addresses written by the host on the
Low Pin Count (LPC) bus, the capture data stored in 128-word FIFO.

NPCM BPC can support capture double words.

I have created common lpc-snoop documentation for both 
Nuvoton and Aspeed drivers as Andrew suggested.
Andrew Jeffery: https://patchwork.kernel.org/patch/10506269/ 

I prefer to add the lpc-dnoop documentation to misc folder instead 
of creating new /devicetree/binding folder that named BMC
as been done in the last lpc-snoop patchset because I am not sure
is something that should be done for only 
one module for now. 
https://patchwork.kernel.org/patch/10506269/

The NPCM7xx BPC driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: misc: Add common LPC snoop documentation
  misc: npcm: add NPCM LPC BPC driver

 .../devicetree/bindings/misc/lpc-snoop.txt         |  27 ++
 drivers/misc/Kconfig                               |   8 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/npcm-lpc-bpc-snoop.c                  | 393 +++++++++++++++++++++
 4 files changed, 429 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/lpc-snoop.txt
 create mode 100644 drivers/misc/npcm-lpc-bpc-snoop.c

-- 
2.14.1
