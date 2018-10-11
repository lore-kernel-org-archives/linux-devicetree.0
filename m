From: Peng Ma <peng.ma@nxp.com>
Subject: [PATCH 4/7] arm: dts: ls1021a: add qdma device tree nodes
Date: Thu, 11 Oct 2018 17:46:52 +0800
Message-ID: <20181011094655.45707-4-peng.ma@nxp.com>
References: <20181011094655.45707-1-peng.ma@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011094655.45707-1-peng.ma@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, leoyang.li@nxp.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, dan.j.williams@intel.com, zw@zh-kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Peng Ma <peng.ma@nxp.com>
List-Id: devicetree@vger.kernel.org

add the qDMA device tree nodes for LS1021A devices.

Signed-off-by: Peng Ma <peng.ma@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index f184905..abc50da 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -806,5 +806,21 @@
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x10010000 0x10000>;
 		};
+
+		qdma: qdma@8390000 {
+			compatible = "fsl,ls1021a-qdma";
+			reg = <0x0 0x8398000 0x0 0x1000>, /* Controller regs */
+			      <0x0 0x8399000 0x0 0x1000>, /* Status regs */
+			      <0x0 0x839a000 0x0 0x2000>; /* Block regs */
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "qdma-error", "qdma-queue";
+			channels = <8>;
+			queues = <2>;
+			status-sizes = <64>;
+			queue-sizes = <64 64>;
+			big-endian;
+		};
+
 	};
 };
-- 
1.7.1
