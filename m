From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH v2 0/2] Amazon's Annapurna Labs Memory Controller EDAC
Date: Sun, 15 Sep 2019 09:43:53 +0300
Message-ID: <1568529835-15319-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, talel@amazon.com, davem@davemloft.net, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, amirkl@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

This series introduces support for Amazon's Annapurna Labs Memory
Controller EDAC driver.

Changes since v1:
=================
- updated dt binding node name and added Rob Reviewed-By
- removed auto selecting of this driver


Talel Shenhar (2):
  dt-bindings: edac: al-mc-edac: Amazon's Annapurna Labs Memory
    Controller EDAC
  EDAC: al-mc-edac: Introduce Amazon's Annapurna Labs Memory Controller
    EDAC

 .../devicetree/bindings/edac/amazon,al-mc-edac.txt |  24 ++
 MAINTAINERS                                        |   7 +
 drivers/edac/Kconfig                               |   7 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/al_mc_edac.c                          | 382 +++++++++++++++++++++
 5 files changed, 421 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-mc-edac.txt
 create mode 100644 drivers/edac/al_mc_edac.c

-- 
2.7.4
