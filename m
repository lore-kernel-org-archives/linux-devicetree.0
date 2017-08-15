From: Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH 0/6] ARM: dts: cygnus dts updates
Date: Tue, 15 Aug 2017 10:25:57 -0700
Message-ID: <1502817964-8221-1-git-send-email-scott.branden@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>, Ray Jui <ray.jui@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Scott Branden <scott.branden@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patch series is a collection of patches for the Cygnus SoC dts files.

Jason Uy (1):
  ARM: dts: cygnus: Enable Performance Monitoring Unit

Jonathan Richardson (1):
  ARM: dts: cygnus: Add additional peripherals to dtsi

Raveendra Padasalagi (1):
  ARM: dts: cygnus: Add generic-ehci/ohci nodes

Ray Jui (1):
  ARM: dts: cygnus: Fix incorrect UART2 register base

Scott Branden (2):
  ARM: dts: cygnus: place v3d in proper address ordered location
  ARM: dts: cygnus: add serial0 alias for uart3 on bcm91130_entphn

 arch/arm/boot/dts/bcm-cygnus.dtsi      | 149 +++++++++++++++++++++++++++++----
 arch/arm/boot/dts/bcm911360_entphn.dts |   7 +-
 2 files changed, 140 insertions(+), 16 deletions(-)

-- 
2.5.0
