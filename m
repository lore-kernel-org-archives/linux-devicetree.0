From: Changming Huang <jerry.huang@nxp.com>
Subject: [PATCH v3 2/3] USB3/DWC3: Add property "snps,
 incr-burst-type-adjustment" for INCR burst type
Date: Mon, 19 Dec 2016 17:25:53 +0800
Message-ID: <1482139554-13618-2-git-send-email-jerry.huang@nxp.com>
References: <1482139554-13618-1-git-send-email-jerry.huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1482139554-13618-1-git-send-email-jerry.huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: balbi@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, linux@armlinux.org.uk
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Changming Huang <jerry.huang@nxp.com>
List-Id: devicetree@vger.kernel.org

New property "snps,incr-burst-type-adjustment = <x>, <y>" for USB3.0 DWC3.
Field "x": 1/0 - undefined length INCR burst type enable or not;
Field "y": INCR4/INCR8/INCR16/INCR32/INCR64/INCR128/INCR256 burst type.

While enabling undefined length INCR burst type and INCR16 burst type,
get better write performance on NXP Layerscape platform:
around 3% improvement (from 364MB/s to 375MB/s).

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
Changes in v3:
  - add new property for INCR burst in usb node.

 Documentation/devicetree/bindings/usb/dwc3.txt |    5 +++++
 arch/arm/boot/dts/ls1021a.dtsi                 |    1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi |    3 +++
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi |    2 ++
 4 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index e3e6983..8c405a3 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -55,6 +55,10 @@ Optional properties:
 	fladj_30mhz_sdbnd signal is invalid or incorrect.
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
+ - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
+	register, undefined length INCR burst type enable and INCRx type.
+	First field is for undefined length INCR burst type enable or not.
+	Second field is for largest INCRx type enabled.
 
 This is usually a subnode to DWC3 glue to which it is connected.
 
@@ -63,4 +67,5 @@ dwc3@4a030000 {
 	reg = <0x4a030000 0xcfff>;
 	interrupts = <0 92 4>
 	usb-phy = <&usb2_phy>, <&usb3,phy>;
+	snps,incr-burst-type-adjustment = <0x1>, <16>;
 };
diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 368e219..2999edb 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -627,6 +627,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			snps,incr-burst-type-adjustment = <0x1>, <16>;
 		};
 
 		pcie@3400000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 97d331e..64828ce 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -482,6 +482,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			snps,incr-burst-type-adjustment = <0x1>, <16>;
 		};
 
 		usb1: usb3@3000000 {
@@ -491,6 +492,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			snps,incr-burst-type-adjustment = <0x1>, <16>;
 		};
 
 		usb2: usb3@3100000 {
@@ -500,6 +502,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			snps,incr-burst-type-adjustment = <0x1>, <16>;
 		};
 
 		sata: sata@3200000 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index d058e56..414af27 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -710,6 +710,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			snps,incr-burst-type-adjustment = <0x1>, <16>;
 		};
 
 		usb1: usb3@3110000 {
@@ -720,6 +721,7 @@
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
+			snps,incr-burst-type-adjustment = <0x1>, <16>;
 		};
 
 		ccn@4000000 {
-- 
1.7.9.5
