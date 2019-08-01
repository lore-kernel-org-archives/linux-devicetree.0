From: Avi Fishman <avifishman70@gmail.com>
Subject: [PATCH v1 0/2] add NPCM7xx EMC 10/100 Ethernet driver
Date: Thu,  1 Aug 2019 10:26:09 +0300
Message-ID: <20190801072611.27935-1-avifishman70@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: venture@google.com, yuenn@google.com, benjaminfair@google.com, davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de
List-Id: devicetree@vger.kernel.org

EMC Ethernet Media Access Controller supports 10/100 Mbps and RMII.
This driver has been working on Nuvoton BMC NPCM7xx.

Avi Fishman (2):
  dt-binding: net: document NPCM7xx EMC 10/100 DT bindings
  net: npcm: add NPCM7xx EMC 10/100 Ethernet driver

 .../bindings/net/nuvoton,npcm7xx-emc.txt      |   38 +
 drivers/net/ethernet/nuvoton/Kconfig          |   21 +-
 drivers/net/ethernet/nuvoton/Makefile         |    2 +
 drivers/net/ethernet/nuvoton/npcm7xx_emc.c    | 2073 +++++++++++++++++
 4 files changed, 2131 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
 create mode 100644 drivers/net/ethernet/nuvoton/npcm7xx_emc.c

-- 
2.18.0
