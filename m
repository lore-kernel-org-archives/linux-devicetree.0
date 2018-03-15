From: Harald Geyer <harald@ccbib.org>
Subject: [PATCHv2 0/5] arm64: allwinner: Add support for TERES-I laptop
Date: Thu, 15 Mar 2018 16:25:05 +0000
Message-ID: <20180315162510.11669-1-harald@ccbib.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, info@olimex.com, Harald Geyer <harald@ccbib.org>
List-Id: devicetree@vger.kernel.org

This series adds support for the TERES I open hardware laptop produced
by olimex. With these patches and a bootloader capable of setting up
simple framebuffer the laptop is quite useable.

Patches 1-4 add some pin descriptions and devices in the A64 dtsi, which
are useful to have on the teres.
Patch 5 finally adds the board dts itself.

Changes to the previous version are listed along the individual patches.

best regards,
Harald


Harald Geyer (5):
  arm64: dts: allwinner: a64: Add i2c0 pins
  arm64: dts: allwinner: a64: Add watchdog
  arm64: dts: allwinner: a64: add simplefb for A64 SoC
  arm64: dts: allwinner: a64: Add pwm device
  arm64: allwinner: a64: Add support for TERES-I laptop

 .../devicetree/bindings/pwm/pwm-sun4i.txt          |   1 +
 .../devicetree/bindings/watchdog/sunxi-wdt.txt     |   6 +-
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      | 279 +++++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  46 ++++
 5 files changed, 331 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts

-- 
2.11.0
