From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH v2 0/3] ARM: dts: NSP: dma-coherent and USB3 changes
Date: Mon, 31 Jul 2017 17:54:20 -0400
Message-ID: <1501538063-32662-1-git-send-email-jon.mason@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jon Mason <jon.mason@broadcom.com>
List-Id: devicetree@vger.kernel.org

Changes in v2:
* Removed pl330 and srab dma-coherent entries due to concerns that they
  were invalid

Add dma-coherent to the relevant DT entries, and add USB3 support

Jon Mason (3):
  ARM: dts: NSP: Add dma-coherent to relevant DT entries
  ARM: dts: NSP: Rearrage USB entries
  ARM: dts: NSP: Add USB3 and USB3 PHY to NSP

 arch/arm/boot/dts/bcm-nsp.dtsi     | 59 +++++++++++++++++++++++++++++---------
 arch/arm/boot/dts/bcm958522er.dts  |  8 ++++++
 arch/arm/boot/dts/bcm958525er.dts  |  8 ++++++
 arch/arm/boot/dts/bcm958525xmc.dts |  8 ++++++
 arch/arm/boot/dts/bcm958622hr.dts  |  8 ++++++
 arch/arm/boot/dts/bcm958623hr.dts  |  8 ++++++
 arch/arm/boot/dts/bcm958625hr.dts  |  8 ++++++
 arch/arm/boot/dts/bcm958625k.dts   |  8 ++++++
 8 files changed, 101 insertions(+), 14 deletions(-)

-- 
2.7.4
