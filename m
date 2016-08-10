From: Karl Beldan <kbeldan@baylibre.com>
Subject: [PATCH v2 0/4] Add DT support for NAND to LCDK
Date: Wed, 10 Aug 2016 11:00:28 +0000
Message-ID: <20160810110032.29295-1-kbeldan@baylibre.com>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Karl Beldan <karl.beldan+oss@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Karl Beldan <kbeldan@baylibre.com>, Santosh Shilimkar <ssantosh@kernel.org>
List-Id: devicetree@vger.kernel.org

Changes from v1:
 - s/cs2/cs3
 - kept "ti,.." only nand properties (the adjustments made by
   nand_davinci_probe are broken)
 - replaced v1_1/4:
     "memory: ti-aemif: Get a named clock rather than an unnamed one"
   with v2_1/4:
     "davinci: da8xx-dt: Add ti-aemif lookup for clock matching"
 - Make the same improvements for the EVM (and retire nand_cs3)

Karl Beldan (4):
  ARM: davinci: da8xx-dt: Add ti-aemif lookup for clock matching
  ARM: davinci_all_defconfig: Enable AEMIF as a module
  ARM: dts: da850,da850-evm: Add an aemif node and use it for the NAND
  ARM: dts: da850-lcdk: Add NAND to DT

 arch/arm/boot/dts/da850-evm.dts        |  49 +++++++++++++--
 arch/arm/boot/dts/da850-lcdk.dts       | 107 +++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/da850.dtsi           |  19 +++---
 arch/arm/configs/davinci_all_defconfig |   2 +
 arch/arm/mach-davinci/da850.c          |   1 +
 arch/arm/mach-davinci/da8xx-dt.c       |   1 +
 6 files changed, 163 insertions(+), 16 deletions(-)

-- 
2.9.2
