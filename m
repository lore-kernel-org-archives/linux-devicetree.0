From: Faiz Abbas <faiz_abbas@ti.com>
Subject: [PATCH 0/2] Add Support for MMC/SD for J721e-base-board
Date: Thu, 19 Sep 2019 21:02:40 +0530
Message-ID: <20190919153242.29399-1-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, nm@ti.com, t-kristo@ti.com
List-Id: devicetree@vger.kernel.org

The following are dts patches to add MMC/SD Support on TI's J721e base
board.

Patches depend on Lokesh's gpio patches[1] and device exclusivity patches[2].

[1] https://patchwork.kernel.org/cover/11085643/
[2] https://patchwork.kernel.org/cover/11051559/

Faiz Abbas (2):
  arm64: dts: ti: j721e-main: Add SDHCI nodes
  arm64: dts: ti: j721e-common-proc-board: Add Support for eMMC and SD
    card

 .../dts/ti/k3-j721e-common-proc-board.dts     | 34 +++++++++++++
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi     | 50 +++++++++++++++++++
 2 files changed, 84 insertions(+)

-- 
2.19.2
