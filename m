From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC PATCH 0/2] ARM: DT cpu bindings updates
Date: Mon, 15 Apr 2013 17:13:20 +0100
Message-ID: <1366042402-8987-1-git-send-email-lorenzo.pieralisi@arm.com>
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
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Tony Lindgren <tony@atomide.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linus Walleij <linus.walleij@linaro.org>, Sekhar Nori <nsekhar@ti.com>, Grant Likely <grant.likely@secretlab.ca>, Viresh Kumar <viresh.kumar@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Mark Rutland <mark.rutland@arm.com>, Lennert Buytenhek <kernel@wantstofly.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, David Brown <davidb@codeaurora.org>, Dinh Nguyen <dinguyen@altera.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <rob.herring@calxeda.com>, Simon Horman <horms@verge.net.au>, Bar
List-Id: devicetree@vger.kernel.org

The introduction of DT cpus/cpu bindings for ARM requires well established
rules to enforce the reg property definition for 32-bit and 64-bit ARM
processors, inclusive of legacy and current uniprocessor/SMP systems.

ARM 64 bit architecture also requires dtb compiled for 64-bit configurations
to be reused for kernels running in 32 bit mode, so the cpus/cpu bindings
specification must be made compliant to cope with this configuration.

Patch #1 of this series is a fix and is included to have a clean patch
series and should get reviewed and merged separately.

Patch #2, along with some kernel fixes related to DT parsing function,
updates the cpu node bindings to cope with legacy, current and upcoming
ARM systems.

In-kernel device tree source files are updated to comply with the latest
specification, so thorough testing is required in order to validate all
changes on all affected ARM systems, in particular systems with exotic
MPIDR configurations that are likely to break with the changes provided.

Code relying on the reg property size to be 4-bytes will break when
dtb compiled for 64-bit kernels are used to boot a 32-bit system so
kernel code relying on that (bogus) assumption must be updated properly.

Lorenzo Pieralisi (2):
  ARM: DT: kernel: move temporary cpu map stack array to static data
  ARM: DT: kernel: DT cpu node bindings update

 Documentation/devicetree/bindings/arm/cpus.txt | 335 +++++++++++++++++++++----
 arch/arm/boot/dts/exynos5440.dtsi              |   7 +
 arch/arm/boot/dts/omap3.dtsi                   |   4 +
 arch/arm/boot/dts/omap4.dtsi                   |   5 +
 arch/arm/boot/dts/omap5.dtsi                   |   5 +
 arch/arm/boot/dts/r8a7740.dtsi                 |   3 +
 arch/arm/boot/dts/sh7372.dtsi                  |   4 +
 arch/arm/boot/dts/sunxi.dtsi                   |   4 +
 arch/arm/kernel/devtree.c                      |  85 ++++---
 9 files changed, 379 insertions(+), 73 deletions(-)

-- 
1.7.12
