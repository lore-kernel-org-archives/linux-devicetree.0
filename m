From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 0/6] AM654: Add PCIe and SERDES DT nodes
Date: Wed, 29 May 2019 14:48:06 +0530
Message-ID: <20190529091812.20764-1-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

Patch series adds PCIe and SERDES DT nodes to k3-am65.dtsi and keeps
them disabled in k3-am654-base-board.dts since there are no PCIe
slots in the base board.

PCIe slots are actually present in add on boards. Once overlay support
is merged, I'll add overlay DTS files to enable PCIe.

All the driver patches and binding documentation patches for PCIe and
SERDES are already merged.

Kishon Vijay Abraham I (6):
  arm64: dts: k3-am6: Add "socionext,synquacer-pre-its" property to
    gic_its
  arm64: dts: k3-am6: Add mux-controller DT node required for muxing
    SERDES
  arm64: dts: k3-am6: Add SERDES DT node
  arm64: dts: k3-am6: Add PCIe Root Complex DT node
  arm64: dts: k3-am6: Add PCIe Endpoint DT node
  arm64: dts: ti: am654-base-board: Disable SERDES and PCIe

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 128 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am65.dtsi           |   1 +
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |  24 ++++
 3 files changed, 153 insertions(+)

-- 
2.17.1
