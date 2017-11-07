From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/2] ARM: dts: NSP fixes
Date: Tue,  7 Nov 2017 14:28:10 -0800
Message-ID: <20171107222812.17267-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bcm-kernel-feedback-list@broadcom.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jon.mason@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series contains a couple of fixes:

- disables AHCI on NSP HR boards since that results in a hard hang
- fixes PPI interrupts specifiers

Florian Fainelli (2):
  ARM: dts: NSP: Disable AHCI controller for HR NSP boards
  ARM: dts: NSP: Fix PPI interrupt types

 arch/arm/boot/dts/bcm-nsp.dtsi    | 4 ++--
 arch/arm/boot/dts/bcm958623hr.dts | 4 ----
 arch/arm/boot/dts/bcm958625hr.dts | 4 ----
 3 files changed, 2 insertions(+), 10 deletions(-)

-- 
2.9.3
