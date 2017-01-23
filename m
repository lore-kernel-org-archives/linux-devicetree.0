From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v2 0/2] ARM: DTS: Fix broken GICv2 register maps
Date: Mon, 23 Jan 2017 15:56:12 +0000
Message-ID: <1485186974-13678-1-git-send-email-marc.zyngier@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Russell King <linux@armlinux.org.uk>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gma>
List-Id: devicetree@vger.kernel.org

For a GICv2 (which happens to be virtualization capable), the
architecture mandates the following regions:

	     GICD: 4kB
	     GICC: 8kB
	     GICH: 8kB
	     GICV: 8kB

Unfortunately, I made a mistake in one of the examples contained in
the DT binding document, and everyone duplicated that same mistake all
over the map.

This small series fixes the DT binding, and hopefully updates all the
offending DTs to be compliant with the architecture. Unless someone
suddenly wakes up and spots something wrong, I'll send a pull-request
to the arm-soc team by the end of tomorrow.

* From v1:
  - Added a few GIC-400 compatibility strings where reported by people
    having TRMs at hand
  - Fixed the commit messages
  - Added Acks and RBs

Marc Zyngier (2):
  dt-bindings: arm,gic: Fix binding example for a virt-capable GIC
  ARM: DTS: Fix register map for virt-capable GIC

 Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt | 4 ++--
 arch/arm/boot/dts/alpine.dtsi                                      | 2 +-
 arch/arm/boot/dts/axm55xx.dtsi                                     | 2 +-
 arch/arm/boot/dts/dra7.dtsi                                        | 2 +-
 arch/arm/boot/dts/ecx-2000.dts                                     | 2 +-
 arch/arm/boot/dts/exynos3250.dtsi                                  | 2 +-
 arch/arm/boot/dts/exynos5.dtsi                                     | 4 ++--
 arch/arm/boot/dts/exynos5260.dtsi                                  | 2 +-
 arch/arm/boot/dts/exynos5440.dtsi                                  | 2 +-
 arch/arm/boot/dts/imx6ul.dtsi                                      | 4 ++--
 arch/arm/boot/dts/keystone-k2g.dtsi                                | 4 ++--
 arch/arm/boot/dts/keystone.dtsi                                    | 4 ++--
 arch/arm/boot/dts/ls1021a.dtsi                                     | 4 ++--
 arch/arm/boot/dts/mt2701.dtsi                                      | 2 +-
 arch/arm/boot/dts/mt6580.dtsi                                      | 2 +-
 arch/arm/boot/dts/mt6589.dtsi                                      | 2 +-
 arch/arm/boot/dts/mt7623.dtsi                                      | 2 +-
 arch/arm/boot/dts/mt8127.dtsi                                      | 2 +-
 arch/arm/boot/dts/mt8135.dtsi                                      | 2 +-
 arch/arm/boot/dts/omap5.dtsi                                       | 2 +-
 arch/arm/boot/dts/r8a73a4.dtsi                                     | 2 +-
 arch/arm/boot/dts/r8a7743.dtsi                                     | 2 +-
 arch/arm/boot/dts/r8a7745.dtsi                                     | 2 +-
 arch/arm/boot/dts/r8a7790.dtsi                                     | 2 +-
 arch/arm/boot/dts/r8a7791.dtsi                                     | 2 +-
 arch/arm/boot/dts/r8a7792.dtsi                                     | 2 +-
 arch/arm/boot/dts/r8a7793.dtsi                                     | 2 +-
 arch/arm/boot/dts/r8a7794.dtsi                                     | 2 +-
 arch/arm/boot/dts/rk1108.dtsi                                      | 2 +-
 arch/arm/boot/dts/rk3036.dtsi                                      | 2 +-
 arch/arm/boot/dts/rk322x.dtsi                                      | 2 +-
 arch/arm/boot/dts/rk3288.dtsi                                      | 2 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                                   | 2 +-
 arch/arm/boot/dts/sun7i-a20.dtsi                                   | 4 ++--
 arch/arm/boot/dts/sun8i-a23-a33.dtsi                               | 2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                                  | 2 +-
 arch/arm/boot/dts/sun8i-h3.dtsi                                    | 2 +-
 arch/arm/boot/dts/sun9i-a80.dtsi                                   | 2 +-
 38 files changed, 45 insertions(+), 45 deletions(-)

-- 
2.1.4
