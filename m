From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH v2 0/2] arm64: Add basic support for Marvell Berlin4CT SoC
Date: Wed, 22 Jul 2015 16:44:15 +0800
Message-ID: <1437554657-5367-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com, will.deacon@arm.com, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, mark.rutland@arm.com, sudeep.holla@arm.com, robh+dt@kernel.org, galak@codeaurora.org, pawel.moll@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

Marvell Berlin4CT is a SoC based on 64bit ARMv8 architecture. It contains
quad CA53 cores.

This SoC shares many HW IP with BG2Q and other berlin series. This patchset
was tested on Berlin4CT DMP board, and boot to shell ok.

Since v1:
 - remove "earlyprintk" bootargs which doesn't work on arm64
 - fix GICC_DIR size as pointed out by Mark
 - define memory start address instead of memory reservation as suggested by Mark
 - add interrupt-affinity to pmu node as pointed out by Sudeep

Jisheng Zhang (2):
  arm64: dts: Add dts files for Marvell Berlin4CT SoC
  arm64: Enable Marvell Berlin SoC family in Kconfig and defconfig

 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/marvell/Makefile          |   5 +
 arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts |  68 +++++++++++
 arch/arm64/boot/dts/marvell/berlin4ct.dtsi    | 164 ++++++++++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 6 files changed, 245 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/Makefile
 create mode 100644 arch/arm64/boot/dts/marvell/berlin4ct-dmp.dts
 create mode 100644 arch/arm64/boot/dts/marvell/berlin4ct.dtsi

-- 
2.1.4
