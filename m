From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 0/3] ARM: dts: add ostm support for r7s72100
Date: Fri, 20 Jan 2017 16:20:52 -0500
Message-ID: <20170120212055.4157-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set enables the use of the newly created driver
renesas-ostm.c for the r7s72100 SoC.

v2:
* The biggest change was now the channels are independent of each
  other and have separate nodes in the DT. The first probed will
  be set up as a clock source, and any additional channels probed
  will become a clock event.


Chris Brandt (3):
  ARM: dts: r7s72100: add ostm clock to device tree
  ARM: dts: r7s72100: add ostm to device tree
  ARM: dts: rskrza1: add ostm DT support

 arch/arm/boot/dts/r7s72100-rskrza1.dts     |  8 ++++++++
 arch/arm/boot/dts/r7s72100.dtsi            | 25 +++++++++++++++++++++++++
 include/dt-bindings/clock/r7s72100-clock.h |  4 ++++
 3 files changed, 37 insertions(+)

-- 
2.10.1
