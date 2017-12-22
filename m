From: <yinbo.zhu@nxp.com>
Subject: [PATCH v5] arm64: dts: ls1088a: Add USB support
Date: Fri, 22 Dec 2017 16:38:07 +0800
Message-ID: <20171222083807.5660-1-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "Catalin Marinas )" <catalin.marinas@arm.com>, "Will Deacon )" <will.deacon@arm.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Harninder Rai <harninder.rai@nxp.com>, Zhang Ying-22455 <ying.zhang22455@nxp.com>, Yuantian Tang <andy.tang@nxp.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, Alison Wang <b18965@freescale.com>, xiaobo.xie@nxp.com, Ashish Kumar <ashish.kumar@nxp.com>, jerry.huang@nxp.com, Raghav Dogra <raghav.dogra@nxp.com>, Nipun Gupta <nipun.gupta@nxp.com>, Yangbo Lu <yangbo.lu@nxp.com>, Amrita Kumari <amrita.kumari@nxp.com>, "yinbo . zhu" <yinbo.zhu@nxp.com>, ran.wang_1@nxp.com, Bogdan Purcareata <bogdan.purcareata@nxp.com>, linux-arm-kernel@lists.infradead.org, Laurentiu Tudor <laurentiu.tudor@nxp.com>
List-Id: devicetree@vger.kernel.org

From: yinbo.zhu <yinbo.zhu@nxp.com>

Add USB support on ls1088ardb

Signed-off-by: yinbo zhu <yinbo.zhu@nxp.com>
Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
Change in v5:
                The usb node was sorted alphabetically in label name.
		Remove the point in "yinbo.zhu".	

 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts |    8 ++++++++
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi    |   20 ++++++++++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 0f6fcda..4f17601 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -125,3 +125,11 @@
 &sata {
 	status = "okay";
 };
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index bd80e9a..caf2bdd 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -394,6 +394,26 @@
 			status = "disabled";
 		};
 
+		usb0: usb3@3100000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0x3100000 0x0 0x10000>;
+			interrupts = <0 80 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "host";
+			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
+			status = "disabled";
+		};
+
+		usb1: usb3@3110000 {
+			compatible = "snps,dwc3";
+			reg = <0x0 0x3110000 0x0 0x10000>;
+			interrupts = <0 81 IRQ_TYPE_LEVEL_HIGH>;
+			dr_mode = "host";
+			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
+			status = "disabled";
+		};
+
 		sata: sata@3200000 {
 			compatible = "fsl,ls1088a-ahci";
 			reg = <0x0 0x3200000 0x0 0x10000>,
-- 
1.7.1
