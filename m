From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/5] ARM: dts: imx6q-b850v3: Remove #address/#size-cells from
 stdp2690
Date: Mon, 23 Apr 2018 16:50:31 -0300
Message-ID: <1524513033-21136-3-git-send-email-festevam@gmail.com>
References: <1524513033-21136-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1524513033-21136-1-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@nxp.com>

Remove unnecessary #address-cells/#size-cells to fix the following
DTC warnings:

arch/arm/boot/dts/imx6q-b850v3.dtb: Warning (avoid_unnecessary_addr_size): /soc/aips-bus@2100000/i2c@21a4000/mux@70/i2c@1/stdp2690@72: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
arch/arm/boot/dts/imx6q-b850v3.dtb: Warning (avoid_unnecessary_addr_size): /soc/aips-bus@2100000/i2c@21a4000/mux@70/i2c@1/stdp4028@73: unnecessary #address-cells/#size-cells without "ranges" or child
"reg" property

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 arch/arm/boot/dts/imx6q-b850v3.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-b850v3.dts b/arch/arm/boot/dts/imx6q-b850v3.dts
index 35edbdc..044a5be 100644
--- a/arch/arm/boot/dts/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/imx6q-b850v3.dts
@@ -156,8 +156,6 @@
 
 	stdp2690@72 {
 		compatible = "megachips,stdp2690-ge-b850v3-fw";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		reg = <0x72>;
 
 		ports {
@@ -184,8 +182,6 @@
 
 	stdp4028@73 {
 		compatible = "megachips,stdp4028-ge-b850v3-fw";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		reg = <0x73>;
 		interrupt-parent = <&gpio2>;
 		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4
