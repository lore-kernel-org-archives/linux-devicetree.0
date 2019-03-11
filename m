From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH 2/3] arm64: dts: fsl: Build the Librem5 devkit devicetree
Date: Mon, 11 Mar 2019 16:46:54 -0700
Message-ID: <20190311234655.30357-3-angus@akkea.ca>
References: <20190311234655.30357-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311234655.30357-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, Lucas Stach <l.stach@pengutronix.de>, abel.vesa@nxp.com, daniel.baluta@nxp.com, agx@sigxcpu.org, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "Angus Ainslie (Purism)" <angus@akkea.ca>
List-Id: devicetree@vger.kernel.org

Compile the Librem5 devkit device tree

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 arch/arm64/boot/dts/freescale/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 13604e558dc1..95526ee3c27a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -22,3 +22,4 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-lx2160a-rdb.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mq-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mq-librem5-devkit.dtb
-- 
2.17.1
