From: Faiz Abbas <faiz_abbas@ti.com>
Subject: [PATCH 0/2] Add DT Support for MMCSD in Am65x-evm
Date: Fri, 7 Dec 2018 14:12:31 +0530
Message-ID: <20181207084233.13700-1-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, nm@ti.com, t-kristo@ti.com, kishon@ti.com, ulf.hansson@linaro.org, adrian.hunter@intel.com, michal.simek@xilinx.com, faiz_abbas@ti.com
List-Id: devicetree@vger.kernel.org

The following patches add dt support for MMCSD on the AM65x-evm.

THe series depends on driver support[1] and pinmux support[2] posted
separately.

[1] https://patchwork.kernel.org/project/linux-mmc/list/?series=53185
[2] https://lore.kernel.org/patchwork/project/lkml/list/?series=372649

Faiz Abbas (2):
  arm64: dts: ti: k3-am654: Add Support for MMC/SD
  arm64: dts: ti: k3-am654-base-board: Add MMC\SD support

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 28 +++++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 46 +++++++++++++++++++
 2 files changed, 74 insertions(+)

-- 
2.19.2
