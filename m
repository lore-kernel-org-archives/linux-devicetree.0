From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 0/2] Document GPIO regulator regulator-type property and use it
Date: Thu, 28 Nov 2013 16:44:51 +0100
Message-ID: <1385653493-9952-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

This patch set documents the required regulator-type property for the GPIO
regulator DT bindings and uses it in the Renesas Armadillo DT.

I've checked the DT files in mainline and all the GPIO regulator nodes but the
one in r8a7740-armadillo800eva-reference.dts specify the regulator-type
property.

Laurent Pinchart (2):
  regulator: gpio-regulator: Add required regulator-type property
  ARM: shmobile: armadillo: Set vccq_sdhi0 regulator type in DT

 Documentation/devicetree/bindings/regulator/gpio-regulator.txt | 2 ++
 arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts        | 2 ++
 2 files changed, 4 insertions(+)

-- 
Regards,

Laurent Pinchart

