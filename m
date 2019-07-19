From: Wen He <wen.he_1@nxp.com>
Subject: [v2 4/4] arm64: ls1028aqds: Add support DP nodes for LS1028AQDS
Date: Fri, 19 Jul 2019 18:09:42 +0800
Message-ID: <20190719100942.12016-4-wen.he_1@nxp.com>
References: <20190719100942.12016-1-wen.he_1@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190719100942.12016-1-wen.he_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, robh+dt@kernel.org
Cc: leoyang.li@nxp.com, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch add HDP PHY Controller related nodes on the LS1028AQDS.

Signed-off-by: Alison Wang <alison.wang@nxp.com>
Signed-off-by: Wen He <wen.he_1@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
index de6ef39f3118..a9af6e8a6517 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
@@ -173,3 +173,15 @@
 &sata {
 	status = "okay";
 };
+
+&hdptx0 {
+	fsl,no_edid;
+	resolution = "3840x2160@60",
+		   "1920x1080@60",
+		   "1280x720@60",
+		   "720x480@60";
+	lane_mapping = <0x4e>;
+	edp_link_rate = <0x6>;
+	edp_num_lanes = <0x4>;
+	status = "okay";
+};
-- 
2.17.1
