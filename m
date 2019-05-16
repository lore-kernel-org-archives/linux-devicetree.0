From: Kuldeep Singh <kuldeep.singh@nxp.com>
Subject: [PATCH] arm64: dts: ls208x: Remove non-compatible driver device from
 qspi node
Date: Thu, 16 May 2019 11:47:09 +0000
Message-ID: <20190516114807.30817-4-kuldeep.singh@nxp.com>
References: <20190516114807.30817-1-kuldeep.singh@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190516114807.30817-1-kuldeep.singh@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Kuldeep Singh <kuldeep.singh@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>, Ashish Kumar <ashish.kumar@nxp.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
List-Id: devicetree@vger.kernel.org

Since device properties are different, so remove fsl, ls1021a-qspi

Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
---
Dependency on https://patchwork.ozlabs.org/patch/1100471/
Dependency on https://patchwork.ozlabs.org/patch/1100472/

 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index d7e78dcd153d..8e5ba513b24f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -606,7 +606,7 @@
 
 		qspi: spi@20c0000 {
 			status = "disabled";
-			compatible = "fsl,ls2080a-qspi", "fsl,ls1021a-qspi";
+			compatible = "fsl,ls2080a-qspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x0 0x20c0000 0x0 0x10000>,
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
