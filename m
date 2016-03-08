From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH 2/2] dts/ls2080a: Update DSPI compatible
Date: Tue, 8 Mar 2016 16:22:57 +0800
Message-ID: <1457425377-6383-2-git-send-email-yao.yuan@freescale.com>
References: <1457425377-6383-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1457425377-6383-1-git-send-email-yao.yuan@freescale.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Yuan Yao <yao.yuan@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Yuan Yao <yao.yuan@nxp.com>

The patch adds LS2085a to DSPI compatible.
The DSPI driver on LS2080A should use TCFQ mode.
It's different from on vf610.

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 9d746c6..122c517 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -318,7 +318,7 @@
 
 		dspi: dspi@2100000 {
 			status = "disabled";
-			compatible = "fsl,vf610-dspi";
+			compatible = "fsl,ls2080a-dspi", "fsl,ls2085a-dspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x0 0x2100000 0x0 0x10000>;
-- 
2.1.0.27.g96db324
