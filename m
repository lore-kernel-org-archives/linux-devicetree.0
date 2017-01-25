From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PULL] ARM: DTS: Fix broken GICv2 register maps
Date: Wed, 25 Jan 2017 11:02:40 +0000
Message-ID: <1485342160-23286-1-git-send-email-marc.zyngier@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Russell King <linux@armlinux.org.uk>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias
List-Id: devicetree@vger.kernel.org

ARM-soc folks,

Please find below the pull request for a DT fix affecting a large
number of 32bit platforms, which has been acked by a number of
platform maintainers.

The following changes since commit 49def1853334396f948dcb4cedb9347abb318df5:

  Linux 4.10-rc4 (2017-01-15 16:21:59 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/gic-v2-dt

for you to fetch changes up to ed2799b62a323ea041e0475ac8bff8e023e224f1:

  ARM: DTS: Fix register map for virt-capable GIC (2017-01-23 15:44:58 +0000)

----------------------------------------------------------------
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
