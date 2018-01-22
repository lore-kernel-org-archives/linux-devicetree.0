From: <yinbo.zhu@nxp.com>
Subject: [PATCH v1] arm: dts: ls1021a: Add configure-gfladj property to USB3 node
Date: Mon, 22 Jan 2018 16:44:23 +0800
Message-ID: <20180122084423.10340-1-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: xiaobo.xie@nxp.com, jerry.huang@nxp.com, ran.wang_1@nxp.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "yinbo . zhu" <yinbo.zhu@nxp.com>
List-Id: devicetree@vger.kernel.org

From: yinbo.zhu <yinbo.zhu@nxp.com>

Add "configure-gfladj" boolean property to USB3 node. This property
is used to determine whether frame length adjustent is required
or not

Signed-off-by: Review Code-CDREVIEW <CDREVIEW@freescale.com>
Signed-off-by: Ramneek Mehresh <ramneek.mehresh@freescale.com>
Signed-off-by: Honghua Yin <Hong-Hua.Yin@freescale.com>
Signed-off-by: yinbo.zhu <yinbo.zhu@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index f81fad2..a5ccf7a 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -707,6 +707,7 @@
 			reg = <0x0 0x3100000 0x0 0x10000>;
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
+			configure-gfladj;
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
 		};
-- 
1.7.1
