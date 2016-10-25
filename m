From: Minghuan Lian <Minghuan.Lian@nxp.com>
Subject: [PATCH 5/6] arm64: dts: ls1043a: update gic dts node
Date: Tue, 25 Oct 2016 20:35:44 +0800
Message-ID: <1477398945-22774-5-git-send-email-Minghuan.Lian@nxp.com>
References: <1477398945-22774-1-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1477398945-22774-1-git-send-email-Minghuan.Lian@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Marc Zyngier <marc.zyngier@arm.com>, Stuart Yoder <stuart.yoder@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Gong Qianyu <Qianyu.Gong@nxp.com>, Scott Wood <scott.wood@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Gong Qianyu <Qianyu.Gong@nxp.com>

In order to support kvm, rev1.1 LS1043a GIC register has been
changed to align as 64K. The patch updates GIC node according to
the rev1.1 hardware.

Signed-off-by: Gong Qianyu <Qianyu.Gong@nxp.com>
Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 5295bb9..da1809d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -144,10 +144,10 @@
 		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
 		interrupt-controller;
-		reg = <0x0 0x1401000 0 0x1000>, /* GICD */
-		      <0x0 0x1402000 0 0x2000>, /* GICC */
-		      <0x0 0x1404000 0 0x2000>, /* GICH */
-		      <0x0 0x1406000 0 0x2000>; /* GICV */
+		reg = <0x0 0x1410000 0 0x10000>, /* GICD */
+		      <0x0 0x1420000 0 0x20000>, /* GICC */
+		      <0x0 0x1440000 0 0x20000>, /* GICH */
+		      <0x0 0x1460000 0 0x20000>; /* GICV */
 		interrupts = <1 9 0xf08>;
 	};
 
-- 
1.9.1
