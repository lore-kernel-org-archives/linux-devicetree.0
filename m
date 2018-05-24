From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v3 0/3] Renesas R9A06G032 SMP enabler
Date: Thu, 24 May 2018 11:30:26 +0100
Message-ID: <1527157834-7747-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Carlo Caione <carlo@endlessm.com>, Stefan Wahren <stefan.wahren@i2se.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rajendra Nayak <rnayak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Juri Lelli <juri.lelli@arm.com>, Frank Rowand <frank.rowand@sony.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

*WARNING -- this requires the base R9A06G032 support patches 
already posted

This patch series is for enabling the second CA7 of the R9A06G032.
It's based on a spin_table method, and it reuses the same binding
property as that driver.

v3:
  + Removed mentions of rz/?n1d?
  + Rebased on base patch v7 
v2:
  + Added suggestions from Florian Fainelli
  + Use __pa_symbol()
  + Simplified logic in prepare_cpu()
  + Reordered the patches
  + Rebased on RZN1 Base patch v5

Michel Pollet (3):
  dt-bindings: cpu: Add Renesas R9A06G032 SMP enable method.
  arm: shmobile: Add the R9A06G032 SMP enabler driver
  ARM: dts: Renesas R9A06G032 SMP enable method

 Documentation/devicetree/bindings/arm/cpus.txt |  1 +
 arch/arm/boot/dts/r9a06g032.dtsi               |  2 +
 arch/arm/mach-shmobile/Makefile                |  1 +
 arch/arm/mach-shmobile/smp-r9a06g032.c         | 85 ++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 arch/arm/mach-shmobile/smp-r9a06g032.c

-- 
2.7.4
