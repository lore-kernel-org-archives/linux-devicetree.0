From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH v2 0/3] ARM: dts: bcm5301x: Add TWD, I2C, and syscon
Date: Wed, 11 May 2016 19:19:07 -0400
Message-ID: <1463008750-13902-1-git-send-email-jonmason@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Reviving, correcting, and resending this patch series from December
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/395155.html

In v2:
* Corrected TWD DT names, per Sergei Shtylyov
* Modified syscon size, per Arnd Bergmann (or atleast my rough
  understanding of what he was trying to say)

Jon Mason (3):
  ARM: dts: bcm5301x: Add TWD WD Support to DT
  ARM: dts: bcm5301x: Add I2C support to the DT
  arm: dts: bcm5301x: Add syscon based reboot in DT

 arch/arm/boot/dts/bcm5301x.dtsi | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

-- 
1.9.1
