From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/2] soc: bcm: brcmstb: Updates to support newer controllers
Date: Fri, 11 May 2018 15:02:40 -0700
Message-ID: <20180511220242.837-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>, Justin Chen <justinpopo6@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series adds support for newer reveisions of the memory controller
which is necessary to make sure we do use the right programming sequence to
enter S2 and S3 suspend/resume modes.

Doug Berger (1):
  soc: bcm: brcmstb: pm: Add support for newer rev B3.0 controllers

Florian Fainelli (1):
  soc: bcm: brcmstb: Add missing DDR MEMC compatible strings

 .../devicetree/bindings/arm/bcm/brcm,brcmstb.txt         |  4 ++++
 drivers/soc/bcm/brcmstb/pm/pm-arm.c                      | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

-- 
2.14.1
