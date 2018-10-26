From: Ding Tao <miyatsu@qq.com>
Subject: [PATCH 1/2] arm64: dts: marvell: armada37xx: Add emmc/sdio pinctrl
 definition
Date: Fri, 26 Oct 2018 11:50:27 +0000
Message-ID: <20181026115028.193203-1-miyatsu@qq.com>
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
To: jason@lakedaemon.net
Cc: mark.rutland@arm.com, andrew@lunn.ch, devicetree@vger.kernel.org, gregory.clement@bootlin.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, miyatsu@qq.com, linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

Add emmc/sdio pinctrl definition for marvell armada37xx SoCs.

Signed-off-by: Ding Tao <miyatsu@qq.com>
---
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index d9531e242eb4..eeec04a1add6 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -221,6 +221,11 @@
 					groups = "uart2";
 					function = "uart";
 				};
+
+				mmc_pins: mmc-pins {
+					groups = "emmc_nb";
+					function = "emmc";
+				};
 			};
 
 			nb_pm: syscon@14000 {
@@ -253,6 +258,11 @@
 					function = "mii";
 				};
 
+				sdio_pins: sdio-pins {
+					groups = "sdio_sb";
+					function = "sdio";
+				};
+
 			};
 
 			eth0: ethernet@30000 {
-- 
2.17.1
