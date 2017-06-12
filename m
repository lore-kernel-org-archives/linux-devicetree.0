From: Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH 01/11] ARM: dts: imx6qdl: add multiplexer controls
Date: Mon, 12 Jun 2017 11:23:54 -0700
Message-ID: <1497291844-14632-2-git-send-email-steve_longerbeam@mentor.com>
References: <1497291844-14632-1-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1497291844-14632-1-git-send-email-steve_longerbeam@mentor.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Philipp Zabel <p.zabel@pengutronix.de>

The IOMUXC General Purpose Register space contains various bitfields
that control video bus multiplexers. Describe them using a mmio-mux
node. The placement of the IPU CSI video mux controls differs between
i.MX6D/Q and i.MX6S/DL.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 arch/arm/boot/dts/imx6dl.dtsi  | 10 ++++++++++
 arch/arm/boot/dts/imx6q.dtsi   | 10 ++++++++++
 arch/arm/boot/dts/imx6qdl.dtsi |  7 ++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
index 7aa120f..10bc9d1 100644
--- a/arch/arm/boot/dts/imx6dl.dtsi
+++ b/arch/arm/boot/dts/imx6dl.dtsi
@@ -181,6 +181,16 @@
 		      "di0", "di1";
 };
 
+&mux {
+	mux-reg-masks = <0x34 0x00000007>, /* IPU_CSI0_MUX */
+			<0x34 0x00000038>, /* IPU_CSI1_MUX */
+			<0x0c 0x0000000c>, /* HDMI_MUX_CTL */
+			<0x0c 0x000000c0>, /* LVDS0_MUX_CTL */
+			<0x0c 0x00000300>, /* LVDS1_MUX_CTL */
+			<0x28 0x00000003>, /* DCIC1_MUX_CTL */
+			<0x28 0x0000000c>; /* DCIC2_MUX_CTL */
+};
+
 &vpu {
 	compatible = "fsl,imx6dl-vpu", "cnm,coda960";
 };
diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index e9a5d0b..a6962be 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -332,6 +332,16 @@
 	};
 };
 
+&mux {
+	mux-reg-masks = <0x04 0x00080000>, /* MIPI_IPU1_MUX */
+			<0x04 0x00100000>, /* MIPI_IPU2_MUX */
+			<0x0c 0x0000000c>, /* HDMI_MUX_CTL */
+			<0x0c 0x000000c0>, /* LVDS0_MUX_CTL */
+			<0x0c 0x00000300>, /* LVDS1_MUX_CTL */
+			<0x28 0x00000003>, /* DCIC1_MUX_CTL */
+			<0x28 0x0000000c>; /* DCIC2_MUX_CTL */
+};
+
 &vpu {
 	compatible = "fsl,imx6q-vpu", "cnm,coda960";
 };
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index e426faa..50534dd 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -808,8 +808,13 @@
 			};
 
 			gpr: iomuxc-gpr@020e0000 {
-				compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
+				compatible = "fsl,imx6q-iomuxc-gpr", "syscon", "simple-mfd";
 				reg = <0x020e0000 0x38>;
+
+				mux: mux-controller {
+					compatible = "mmio-mux";
+					#mux-control-cells = <1>;
+				};
 			};
 
 			iomuxc: iomuxc@020e0000 {
-- 
2.7.4
