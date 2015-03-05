From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Subject: [PATCH 0/2] memory: jz4780: Add external memory controller driver
Date: Thu, 5 Mar 2015 17:01:53 +0000
Message-ID: <1425574915-50308-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Greg,

I don't see any maintainer for drivers/memory. 

And as you are the committer for most of the drivers in there.

Two patches based on 4.0-rc2 that add an external memory controller
driver for the Ingenic JZ4780 SoC.

Core jz4780 support is still in-flight.

Tested on the MIPS Creator CI20

Feedback welcome

Thanks
ZubairLK

Alex Smith (2):
  dt-bindings: memory-controllers: Add binding for jz4780-nemc
  memory: jz4780-nemc: driver for the NEMC on JZ4780 SoCs

 .../memory-controllers/ingenic,jz4780-nemc.txt     |  75 ++++
 drivers/memory/Kconfig                             |   9 +
 drivers/memory/Makefile                            |   1 +
 drivers/memory/jz4780-nemc.c                       | 405 +++++++++++++++++++++
 include/linux/jz4780-nemc.h                        |  43 +++
 5 files changed, 533 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ingenic,jz4780-nemc.txt
 create mode 100644 drivers/memory/jz4780-nemc.c
 create mode 100644 include/linux/jz4780-nemc.h

-- 
1.9.1
