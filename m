From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Subject: [PATCH 1/1] imx53.dtsi: Add IPU nodes for csi
Date: Thu,  4 Aug 2016 15:47:32 +0200
Message-ID: <1470318452-31391-1-git-send-email-fabien.lahoudere@collabora.co.uk>
References: <CAOMZO5BoRsrHv-+5c9bAXO2NCya8sPqmmpy9DOfav6NvQ+VMLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAOMZO5BoRsrHv-+5c9bAXO2NCya8sPqmmpy9DOfav6NvQ+VMLQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

We have the following messages that tell csi devices are not used:
imx-ipuv3 18000000.ipu: no port@0 node in /soc/ipu@18000000, not using CSI0
imx-ipuv3 18000000.ipu: no port@1 node in /soc/ipu@18000000, not using CSI1

So we add them in the common device tree to make CSI ports available on
imx53 boards.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 arch/arm/boot/dts/imx53.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index c1bc97c..0777b41 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -136,6 +136,14 @@
 			clock-names = "bus", "di0", "di1";
 			resets = <&src 2>;
 
+			ipu_csi0: port@0 {
+				reg = <0>;
+			};
+
+			ipu_csi1: port@1 {
+				reg = <1>;
+			};
+
 			ipu_di0: port@2 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.7.4
