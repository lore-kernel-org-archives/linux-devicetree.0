From: Faiz Abbas <faiz_abbas@ti.com>
Subject: [PATCH v3 0/2] Support for eMMC in AM65x-evm
Date: Thu, 17 Jan 2019 15:14:22 +0530
Message-ID: <20190117094424.7683-1-faiz_abbas@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, nm@ti.com, t-kristo@ti.com, faiz_abbas@ti.com
List-Id: devicetree@vger.kernel.org

The following patches add eMMC support on TI's AM65x-evm.

v3:
 1. Fixed patch titles to only include eMMC
 2. Added dma-coherent to the sdhci0 node.

v2:
 1. The SD card node is under debug for some usecases.
    Only upstreaming eMMC support for now.
 2. Rebased to latest mainline.
 3. Removed status = "disabled" from dtsi patch
 4. Fixed node name to not include '_'s

Faiz Abbas (2):
  arm64: dts: ti: k3-am654: Add Support for eMMC host controller
  arm64: dts: ti: k3-am654-base-board: Add eMMC Support

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 14 +++++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 25 +++++++++++++++++++
 2 files changed, 39 insertions(+)

-- 
2.19.2
