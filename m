From: Kuldeep Singh <kuldeep.singh@nxp.com>
Subject: [PATCH] arm64: dts: ls1046a: Fast read m25p60
Date: Thu, 16 May 2019 11:47:06 +0000
Message-ID: <20190516114807.30817-2-kuldeep.singh@nxp.com>
References: <20190516114807.30817-1-kuldeep.singh@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190516114807.30817-1-kuldeep.singh@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Kuldeep Singh <kuldeep.singh@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>, Ashish Kumar <ashish.kumar@nxp.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>
List-Id: devicetree@vger.kernel.org

QSPI support is added for kernel version greater than 5.0 and supports
quad mode defined by
TX-WIDTH = <4>, RX-WIDTH = <4>

RDB/QDS has two 64MB flash from SPANSION(s25fs512s)

Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 3 ++-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index eec62c63dafe..43a5ef6357d5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -166,9 +166,10 @@
 	status = "okay";
 
 	qflash0: flash@0 {
-		compatible = "spansion,m25p80";
+		compatible = "spansion,m25p80", "jedec,spi-nor";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		m25p,fast-read;
 		spi-max-frequency = <20000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 6a6514d0e5a9..85105a20fc04 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -102,9 +102,10 @@
 	status = "okay";
 
 	qflash0: flash@0 {
-		compatible = "spansion,m25p80";
+		compatible = "spansion,m25p80", "jedec,spi-nor";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		m25p,fast-read;
 		spi-max-frequency = <20000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
@@ -112,9 +113,10 @@
 	};
 
 	qflash1: flash@1 {
-		compatible = "spansion,m25p80";
+		compatible = "spansion,m25p80", "jedec,spi-nor";
 		#address-cells = <1>;
 		#size-cells = <1>;
+		m25p,fast-read;
 		spi-max-frequency = <20000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.17.1
