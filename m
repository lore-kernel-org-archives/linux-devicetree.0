From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 0/2] AM654: Add McSPI DT entry
Date: Sun, 9 Dec 2018 15:52:20 +0530
Message-ID: <20181209102222.7624-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

Couple of patches to add support for McSPIs in AM654 SoC.

Vignesh R (2):
  arm64: dts: ti: k3-am654: Add McSPI DT nodes
  arm64: dts: ti: k3-am654: Enable main domain McSPI0

 arch/arm64/boot/dts/ti/k3-am65-main.dtsi      | 52 +++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi       | 30 +++++++++++
 .../arm64/boot/dts/ti/k3-am654-base-board.dts | 27 ++++++++++
 3 files changed, 109 insertions(+)

-- 
2.19.2
