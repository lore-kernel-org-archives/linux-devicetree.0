From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/3] ARM: dts: IRQ_TYPE_NONE fixes for NSP and HR2
Date: Mon, 11 Jun 2018 15:47:11 -0700
Message-ID: <20180611224714.7007-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series fixes incorrect interrupt type specifiers for the
NSP and HR2 SoCs.

Florian Fainelli (3):
  ARM: dts: NSP: Fix i2c controller interrupt type
  ARM: dts: NSP: Fix PCIe controllers interrupt types
  ARM: dts: HR2: Fix interrupt types for i2c and PCIe

 arch/arm/boot/dts/bcm-hr2.dtsi | 24 ++++++++++++------------
 arch/arm/boot/dts/bcm-nsp.dtsi | 32 ++++++++++++++++----------------
 2 files changed, 28 insertions(+), 28 deletions(-)

-- 
2.14.1
