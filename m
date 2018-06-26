From: Nishanth Menon <nm@ti.com>
Subject: [PATCH V2 0/5] arm64: Initial support Texas Instrument's AM654
 Platform
Date: Tue, 26 Jun 2018 11:26:10 -0500
Message-ID: <20180626162615.19194-1-nm@ti.com>
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
To: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Tony Lindgren <tony@atomide.com>, Sudeep Holla <sudeep.holla@arm.com>, Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Tero Kristo <t-kristo@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

This is an minor update from V1 posted earlier:
	https://marc.info/?l=linux-kernel&m=152943745424138&w=2

The following series enables support for newest addition in TI's SoC
portfolio - AM654 SoC.

The series is based off v4.18-rc1, also available here:
https://github.com/nmenon/linux-2.6-playground/tree/upstream/v4.18-rc1/k3-1-am6-base

Key changes since RFC are indicated in respective patches:
* Pickedup Tony's Reviewed by
* Modified cbass nodes to indicate interconnect (patch #3 in the series)

Consolidated all patches (including all series) are available here:
https://github.com/nmenon/linux-2.6-playground/commits/upstream/v4.18-rc1/k3-am6-integ

Full Boot log (integrated of all series) is available here:
   https://pastebin.ubuntu.com/p/bBFmnzYtCd/

NOTE: The uart series is seperated out and we get operational console only
after that series is merged.

The AM654 SoC is a lead device of the K3 Multicore SoC architecture
platform, targeted for broad market and industrial control with aim to
meet the complex processing needs of modern embedded products.

The Linux development follows closely the 66AK2G SoC model in aarch64.

See AM65x Technical Reference Manual (SPRUID7, April 2018)
for further details: http://www.ti.com/lit/pdf/spruid7


Nishanth Menon (5):
  dt-bindings: arm: ti: Add bindings for AM654 SoC
  arm64: Add support for TI's K3 Multicore SoC architecture
  arm64: dts: ti: Add Support for AM654 SoC
  soc: ti: Add Support for AM654 SoC config option
  arm64: dts: ti: Add support for AM654 EVM base board

 Documentation/devicetree/bindings/arm/ti/k3.txt |  23 +++++
 MAINTAINERS                                     |   9 ++
 arch/arm64/Kconfig.platforms                    |   7 ++
 arch/arm64/boot/dts/Makefile                    |   1 +
 arch/arm64/boot/dts/ti/Makefile                 |   9 ++
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi        |  31 +++++++
 arch/arm64/boot/dts/ti/k3-am65.dtsi             |  87 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am654-base-board.dts  |  36 ++++++++
 arch/arm64/boot/dts/ti/k3-am654.dtsi            | 115 ++++++++++++++++++++++++
 drivers/soc/ti/Kconfig                          |  14 +++
 10 files changed, 332 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/ti/k3.txt
 create mode 100644 arch/arm64/boot/dts/ti/Makefile
 create mode 100644 arch/arm64/boot/dts/ti/k3-am65-main.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am65.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am654-base-board.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am654.dtsi

-- 
2.15.1
