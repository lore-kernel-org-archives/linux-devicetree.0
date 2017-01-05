From: Minghuan Lian <Minghuan.Lian@nxp.com>
Subject: [PATCH v2,5/9] arm64: dts: ls1043a: share all MSIs
Date: Thu, 5 Jan 2017 16:10:33 +0800
Message-ID: <1483603837-4629-5-git-send-email-Minghuan.Lian@nxp.com>
References: <1483603837-4629-1-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1483603837-4629-1-git-send-email-Minghuan.Lian@nxp.com>
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
Cc: Rob Herring <robh@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Roy Zang <roy.zang@nxp.com>, Marc Zyngier <marc.zyngier@arm.com>, Stuart Yoder <stuart.yoder@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>, Minghuan Lian <Minghuan.Lian@nxp.com>, Scott Wood <scott.wood@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

In order to maximize the use of MSI, a PCIe controller will share
all MSI controllers. The patch changes "msi-parent" to refer to all
MSI controller dts nodes.

Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
---
v2-v1:
- None

 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 692fc35..3947220 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -625,7 +625,7 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x40 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x40 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi1>;
+			msi-parent = <&msi1>, <&msi2>, <&msi3>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic 0 110 0x4>,
@@ -650,7 +650,7 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x48 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x48 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi2>;
+			msi-parent = <&msi1>, <&msi2>, <&msi3>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic 0 120  0x4>,
@@ -675,7 +675,7 @@
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000 0x0 0x00000000 0x50 0x00010000 0x0 0x00010000   /* downstream I/O */
 				  0x82000000 0x0 0x40000000 0x50 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
-			msi-parent = <&msi3>;
+			msi-parent = <&msi1>, <&msi2>, <&msi3>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0000 0 0 1 &gic 0 154 0x4>,
-- 
1.9.1
