From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH 0/5] arm64: Juno DT updates and new DT for Juno R1
Date: Wed, 13 May 2015 18:11:27 +0100
Message-ID: <1431537092-19597-1-git-send-email-Liviu.Dudau@arm.com>
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
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, devicetree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This series restructures the Juno DT files and introduces the DT
for the new Juno R1. The board is an update of the Juno R0 with
support for PCIe, but the current series only brings the board to
parity with Juno R0. The series that enable the PCIe Generic Host
Bridge to be used on Juno R1 will be posted separately.

Liviu Dudau (5):
  arm64: Juno: Fix the GIC node address label and the frequency of FAXI clock.
  arm64: Juno: Split juno.dts into juno-base.dtsi and juno.dts.
  arm64: Juno: Add memory mapped timer node
  arm64: Juno: Add GICv2m support in device tree.
  arm64: Add DT support for Juno r1 board.

 arch/arm64/boot/dts/arm/Makefile         |   2 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi   | 147 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/arm/juno-clocks.dtsi |   4 +-
 arch/arm64/boot/dts/arm/juno-r1.dts      | 123 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/arm/juno.dts         | 122 +------------------------
 5 files changed, 274 insertions(+), 124 deletions(-)
 create mode 100644 arch/arm64/boot/dts/arm/juno-base.dtsi
 create mode 100644 arch/arm64/boot/dts/arm/juno-r1.dts

-- 
2.3.6
