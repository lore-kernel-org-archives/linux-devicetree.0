From: Yuantian Tang <andy.tang@nxp.com>
Subject: [PATCH v2] arm64: dts: ls1028a: fix a compatible issue
Date: Thu, 10 Oct 2019 16:33:34 +0800
Message-ID: <20191010083334.7037-1-andy.tang@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Yuantian Tang <andy.tang@nxp.com>, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The I2C multiplexer used on ls1028aqds is PCA9547, not PCA9847.
If the wrong compatible was used, this chip will not be able to
be probed correctly and hence fail to work.

Signed-off-by: Yuantian Tang <andy.tang@nxp.com>
---
v2:
	- refine the description
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
index 5e14e5a19744..f5da9e8b0d9d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
@@ -107,7 +107,7 @@
 	status = "okay";
 
 	i2c-mux@77 {
-		compatible = "nxp,pca9847";
+		compatible = "nxp,pca9547";
 		reg = <0x77>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.17.1
