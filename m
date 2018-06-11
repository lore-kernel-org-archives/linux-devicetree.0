From: avifishman70@gmail.com
Subject: [PATCH v5 0/3] USB host: Add USB ehci support for nuvoton npcm7xx
Date: Mon, 11 Jun 2018 22:58:34 +0300
Message-ID: <20180611195837.251551-1-avifishman70@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, venture@google.com, yuenn@google.com, brendanhiggins@google.com, mathias.nyman@linux.intel.com, bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, chunfeng.yun@mediatek.com, tony@atomide.com, baolu.lu@linux.intel.com, elder@linaro.org, digetx@gmail.com, kstewart@linuxfoundation.org, hdegoede@redhat.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Avi Fishman <avifishman70@gmail.com>

Changes since version 4:
- dt-bindings reviewed by Rob Herring

Changes since version 3:
- Follow Rob Herring comments to change dt-bindings commit subject

Changes since version 2:
- Follow Sergei Shtylyov comments to rename the node name in in device tree 
  documentation

Changes since version 1:
- Follow Rob Herring comments in device tree documentation
- minor log error fix in ehci-npcm7xx.c
   
This patch adds support for ehci controller for the Nuvoton npcm7xx platform.
Most of the code was taken from ehci-spear.c + specific initialization code

Avi Fishman (3):
  USB host: Add USB ehci support for nuvoton npcm7xx platform
  dt-bindings: usb: new ehci-npcm7xx dt
  MAINTAINERS: add subfolders for nuvoton *npcm*

 .../devicetree/bindings/usb/npcm7xx-usb.txt        |  17 ++
 MAINTAINERS                                        |   3 +
 drivers/usb/host/Kconfig                           |   8 +
 drivers/usb/host/Makefile                          |   1 +
 drivers/usb/host/ehci-npcm7xx.c                    | 212 +++++++++++++++++++++
 5 files changed, 241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/npcm7xx-usb.txt
 create mode 100644 drivers/usb/host/ehci-npcm7xx.c

-- 
2.14.1
