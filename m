From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH v7 0/2] Add Spreadtrum Sharkl64 Platform support
Date: Tue, 27 Jan 2015 16:12:45 +0800
Message-ID: <1422346367-10628-1-git-send-email-chunyan.zhang@spreadtrum.com>
References: <sc9836-dt-v7>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <sc9836-dt-v7>
Sender: linux-kernel-owner@vger.kernel.org
To: mark.rutland@arm.com, arnd@arndb.de, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: Joel.Schopp@amd.com, Thomas.Lendacky@amd.com, Suravee.Suthikulpanit@amd.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, geng.ren@spreadtrum.com, zhizhou.zhang@spreadtrum.com, zhang.lyra@gmail.com, wei.qiao@spreadtrum.com, orsonzhai@gmail.com
List-Id: devicetree@vger.kernel.org

This patch-set split the last version, and addressed the review comments from
last version on serial driver code.

Changes from v6:
	- Setted stdout-path with "serial1:115200n8"

Changes from v5:
	- Added maintenance interrupt for gic
	- Removed reg property from 'soc' and 'apb' nodes

Zhizhou Zhang (2):
  arm64: dts: Add support for Spreadtrum SC9836 SoC in dts and Makefile
  arm64: Add support for Spreadtrum's Sharkl64 Platform in Kconfig and
    defconfig

 arch/arm64/Kconfig                            |    5 ++
 arch/arm64/boot/dts/Makefile                  |    1 +
 arch/arm64/boot/dts/sprd/Makefile             |    5 ++
 arch/arm64/boot/dts/sprd/sc9836-openphone.dts |   49 ++++++++++++++++
 arch/arm64/boot/dts/sprd/sc9836.dtsi          |   74 +++++++++++++++++++++++++
 arch/arm64/boot/dts/sprd/sharkl64.dtsi        |   65 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                  |    1 +
 7 files changed, 200 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sprd/Makefile
 create mode 100644 arch/arm64/boot/dts/sprd/sc9836-openphone.dts
 create mode 100644 arch/arm64/boot/dts/sprd/sc9836.dtsi
 create mode 100644 arch/arm64/boot/dts/sprd/sharkl64.dtsi

-- 
1.7.9.5
