From: Dongsheng Wang <dongsheng.wang@freescale.com>
Subject: [RESEND 1/2] ARM: dts: ls1021a: Add DCU dts node
Date: Tue, 1 Dec 2015 16:02:56 +0800
Message-ID: <1448956977-8930-1-git-send-email-dongsheng.wang@freescale.com>
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
To: shawnguo@kernel.org
Cc: Jianwei Wang <jianwei.wang.chn@gmail.com>, devicetree@vger.kernel.org, Xiubo Li <lixiubo@cmss.chinamobile.com>, Alison Wang <alison.wang@freescale.com>, Yi Meng <b56799@freescale.com>, Wang Dongsheng <dongsheng.wang@freescale.com>, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jianwei Wang <jianwei.wang.chn@gmail.com>

Add DCU node, DCU is a display controller of Freescale
named 2D-ACE.

Signed-off-by: Alison Wang <alison.wang@freescale.com>
Signed-off-by: Xiubo Li <lixiubo@cmss.chinamobile.com>
Signed-off-by: Jianwei Wang <jianwei.wang.chn@gmail.com>
Signed-off-by: Yi Meng <b56799@freescale.com>
Signed-off-by: Wang Dongsheng <dongsheng.wang@freescale.com>

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 9430a99..f01c98b 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -428,6 +428,16 @@
 				 <&platform_clk 1>;
 		};
 
+		dcu: dcu@2ce0000 {
+			compatible = "fsl,ls1021a-dcu";
+			reg = <0x0 0x2ce0000 0x0 0x10000>;
+			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&platform_clk 0>;
+			clock-names = "dcu";
+			big-endian;
+			status = "disabled";
+		};
+
 		mdio0: mdio@2d24000 {
 			compatible = "gianfar";
 			device_type = "mdio";
-- 
2.1.0.27.g96db324
