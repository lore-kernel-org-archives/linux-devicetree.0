From: Minghuan Lian <Minghuan.Lian@nxp.com>
Subject: [PATCH 3/9] arm64: dts: ls1043a: fix typo of MSI compatible string
Date: Tue, 27 Dec 2016 17:12:59 +0800
Message-ID: <1482829985-24421-3-git-send-email-Minghuan.Lian@nxp.com>
References: <1482829985-24421-1-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1482829985-24421-1-git-send-email-Minghuan.Lian@nxp.com>
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

"1" should be replaced by "l". This is a typo.
The patch is to fix it.

Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index ec13a6e..692fc35 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -589,21 +589,21 @@
 		};
 
 		msi1: msi-controller1@1571000 {
-			compatible = "fsl,1s1043a-msi";
+			compatible = "fsl,ls1043a-msi";
 			reg = <0x0 0x1571000 0x0 0x8>;
 			msi-controller;
 			interrupts = <0 116 0x4>;
 		};
 
 		msi2: msi-controller2@1572000 {
-			compatible = "fsl,1s1043a-msi";
+			compatible = "fsl,ls1043a-msi";
 			reg = <0x0 0x1572000 0x0 0x8>;
 			msi-controller;
 			interrupts = <0 126 0x4>;
 		};
 
 		msi3: msi-controller3@1573000 {
-			compatible = "fsl,1s1043a-msi";
+			compatible = "fsl,ls1043a-msi";
 			reg = <0x0 0x1573000 0x0 0x8>;
 			msi-controller;
 			interrupts = <0 160 0x4>;
-- 
1.9.1
