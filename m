From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [PATCH 4/4][v4][RESEND] ARM64: dts: Add NOR connection type with IFC
Date: Thu, 22 Feb 2018 15:45:09 +0530
Message-ID: <20180222101511.29631-5-prabhakar.kushwaha@nxp.com>
References: <20180222101511.29631-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180222101511.29631-1-prabhakar.kushwaha@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org
Cc: boris.brezillon@free-electrons.com, leoyang.li@nxp.com, oss@buserror.net, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Connection between IFC and NOR flash is of big-endian type.

So add big-endian property in flash node to reflect the same.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
Changes for v2: None
Changes for v3: None
Changes for v4: Updated device tree as per new binding

Resending as all patches of patchset never reaches to patchwork.

 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
index 6341281485cf..80aed686933f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts
@@ -89,6 +89,7 @@
 		reg = <0x0 0x0 0x8000000>;
 		bank-width = <2>;
 		device-width = <1>;
+		big-endian;
 	};
 
 	nand@1,0 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
index 3dc0c8e9663d..600ab2fb6f5a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts
@@ -104,6 +104,7 @@
 			reg = <0x0 0x0 0x8000000>;
 			bank-width = <2>;
 			device-width = <1>;
+			big-endian;
 		};
 
 		nand@1,0 {
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 434383bade0e..153bba913e9a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -180,6 +180,7 @@
 		reg = <0x0 0x0 0x8000000>;
 		bank-width = <2>;
 		device-width = <1>;
+		big-endian;
 	};
 
 	nand@1,0 {
-- 
2.14.1
