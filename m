From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 0/7] ARM: Add ASPEED AST2600 support
Date: Wed, 21 Aug 2019 15:25:23 +0930
Message-ID: <20190821055530.8720-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

This adds the architecture, device tree and configuration required to
support a new ASPEED BMC chip.

I'd appreciate a review from those on cc before I break the patches into
their respective trees and send them as part of my ASPEED pull request
for 5.4. Thanks!


Joel Stanley (7):
  dt-bindings: arm: cpus: Add ASPEED SMP
  ARM: aspeed: Select timer in each SoC
  ARM: aspeed: Add ASPEED AST2600 architecture
  ARM: aspeed: Enable SMP boot
  ARM: dts: aspeed: Add AST2600 and EVB
  ARM: configs: multi_v7: Add ASPEED G6
  ARM: configs: aspeed_g5: Enable AST2600

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 arch/arm/Makefile                             |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts      |  44 +++
 arch/arm/boot/dts/aspeed-g6.dtsi              | 266 ++++++++++++++++++
 arch/arm/configs/aspeed_g5_defconfig          |  17 +-
 arch/arm/configs/multi_v7_defconfig           |  19 ++
 arch/arm/mach-aspeed/Kconfig                  |  17 +-
 arch/arm/mach-aspeed/Makefile                 |   5 +
 arch/arm/mach-aspeed/platsmp.c                |  61 ++++
 10 files changed, 427 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-ast2600-evb.dts
 create mode 100644 arch/arm/boot/dts/aspeed-g6.dtsi
 create mode 100644 arch/arm/mach-aspeed/Makefile
 create mode 100644 arch/arm/mach-aspeed/platsmp.c

-- 
2.23.0.rc1
