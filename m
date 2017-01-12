From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/3] ARM: dts: add ostm support for r7s72100
Date: Thu, 12 Jan 2017 14:01:05 -0500
Message-ID: <20170112190108.2856-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set enables the use of the newly created driver
renesas-ostm.c for the r7s72100 SoC.

This patch set depends on the acceptance of:
  [PATCH 1/2] dt-bindings: document renesas-ostm timer
  [PATCH 2/2] clocksource: Add renesas-ostm timer driver


Chris Brandt (3):
  ARM: dts: r7s72100: add ostm clock to device tree
  ARM: dts: r7s72100: add ostm to device tree
  ARM: dts: rskrza1: add ostm DT support

 arch/arm/boot/dts/r7s72100-rskrza1.dts     |  4 ++++
 arch/arm/boot/dts/r7s72100.dtsi            | 21 +++++++++++++++++++++
 include/dt-bindings/clock/r7s72100-clock.h |  4 ++++
 3 files changed, 29 insertions(+)

-- 
2.10.1
