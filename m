From: Pankaj Bansal <pankaj.bansal@nxp.com>
Subject: [PATCH 2/3] dts: arm64: fsl: lsch2: fix the rgmii phy type
Date: Wed, 12 Dec 2018 07:09:56 +0000
Message-ID: <20181212123505.32415-3-pankaj.bansal@nxp.com>
References: <20181212123505.32415-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181212123505.32415-1-pankaj.bansal@nxp.com>
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
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pankaj Bansal <pankaj.bansal@nxp.com>
List-Id: devicetree@vger.kernel.org

refer fsl-ls1043a-rdb.dts. The phy connection type for RGMII phy in
Layerscape boards is "rgmii-txid" and not "rgmii".

Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 65ea27c8341a..540231b41997 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -143,13 +143,13 @@
 &fman0 {
 	ethernet@e4000 {
 		phy-handle = <&rgmii_phy1>;
-		phy-connection-type = "rgmii";
+		phy-connection-type = "rgmii-txid";
 		status = "okay";
 	};
 
 	ethernet@e6000 {
 		phy-handle = <&rgmii_phy2>;
-		phy-connection-type = "rgmii";
+		phy-connection-type = "rgmii-txid";
 		status = "okay";
 	};
 
-- 
2.17.1
