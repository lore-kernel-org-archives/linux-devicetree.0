From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH 2/6] ARM: dts: ls1021a: Add the status property disable PCIe
Date: Thu, 25 Oct 2018 19:08:57 +0800
Message-ID: <20181025110901.5680-2-xiaowei.bao@nxp.com>
References: <20181025110901.5680-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025110901.5680-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, kstewart@linuxfoundation.org, cyrille.pitchen@free-electrons.com, pombredanne@nexb.com, shawn.lin@rock-chips.com, niklas.cassel@axis.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the status property disable the PCIe, the property will be enable
by bootloader.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index bdd6e66..b769e0e 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -736,6 +736,7 @@
 					<0000 0 0 2 &gic GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
 					<0000 0 0 3 &gic GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
 					<0000 0 0 4 &gic GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		pcie@3500000 {
@@ -759,6 +760,7 @@
 					<0000 0 0 2 &gic GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
 					<0000 0 0 3 &gic GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
 					<0000 0 0 4 &gic GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		can0: can@2a70000 {
-- 
1.7.1
