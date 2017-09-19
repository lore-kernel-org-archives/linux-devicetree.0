From: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>
Subject: [PATCH 2/5] arm64: dts: ls1012a: Add MSI controller DT node
Date: Tue, 19 Sep 2017 17:26:55 +0800
Message-ID: <20170919092658.22482-3-Zhiqiang.Hou@nxp.com>
References: <20170919092658.22482-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170919092658.22482-1-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, bhelgaas@google.com, shawnguo@kernel.org, Mingkai.Hu@nxp.com, Minghuan.Lian@nxp.com, roy.zang@nxp.com
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Add MSI controller node for ls1012a platform.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index df83915d6ea6..a7698ac7264b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -471,5 +471,12 @@
 			dr_mode = "host";
 			phy_type = "ulpi";
 		};
+
+		msi: msi-controller1@1572000 {
+			compatible = "fsl,ls1012a-msi";
+			reg = <0x0 0x1572000 0x0 0x8>;
+			msi-controller;
+			interrupts = <0 126 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
-- 
2.14.1
