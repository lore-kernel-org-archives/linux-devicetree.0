From: Scott Wood <scottwood@freescale.com>
Subject: [PATCH] arm64: dts: fsl-ls2085a: Add serial aliases
Date: Mon, 14 Sep 2015 19:48:27 -0500
Message-ID: <20150915004827.GA19862@home.buserror.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These will allow U-Boot to set linux,stdout-path in /chosen based on
the active console device, which will allow devicetree-based earlycon.

Signed-off-by: Scott Wood <scottwood@freescale.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
index e281ceb..eae454e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
@@ -55,6 +55,11 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		serial0 = &serial0;
+		serial1 = &serial1;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
-- 
2.1.4
