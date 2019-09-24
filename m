From: Yinbo Zhu <yinbo.zhu@nxp.com>
Subject: [PATCH v2] usb: dwc3: enable otg mode for dwc3 usb ip on layerscape
Date: Tue, 24 Sep 2019 11:29:03 +0800
Message-ID: <20190924032903.32775-1-yinbo.zhu@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: yinbo.zhu@nxp.com, xiaobo.xie@nxp.com, jiafei.pan@nxp.com, Ran Wang <ran.wang_1@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

layerscape otg function should be supported HNP SRP and ADP protocol
accroing to rm doc, but dwc3 code not realize it and use id pin to
detect who is host or device(0 is host 1 is device) this patch is to
enable OTG mode on ls1028ardb ls1088ardb and ls1046ardb in dts

Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts | 4 ++++
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts | 4 ++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts | 1 +
 3 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
index 9fb9113..076cac6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
@@ -171,3 +171,7 @@
 &sata {
 	status = "okay";
 };
+
+&usb1 {
+	dr_mode = "otg";
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 6a6514d..0c742be 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -122,6 +122,10 @@
 	};
 };
 
+&usb1 {
+	dr_mode = "otg";
+};
+
 #include "fsl-ls1046-post.dtsi"
 
 &fman0 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 8e925df..90b1989 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -95,5 +95,6 @@
 };
 
 &usb1 {
+	dr_mode = "otg";
 	status = "okay";
 };
-- 
2.9.5
