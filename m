From: Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 3/3] arm: kirkwood: convert uart0 to devicetree.
Date: Wed, 22 Feb 2012 19:18:46 +0000
Message-ID: <0ad28cac6d608253b01e1d57bb479a29754ae823.1329936660.git.jason@lakedaemon.net>
References: <cover.1329936660.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1329936660.git.jason@lakedaemon.net>
In-Reply-To: <cover.1329936660.git.jason@lakedaemon.net>
References: <cover.1312906908.git.jason@lakedaemon.net>
 <cover.1329936660.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, grant.likely@secretlab.ca
Cc: devicetree-discuss@lists.ozlabs.org, Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This uart is common to all kirkwood SoC's, so I placed it in the
kirkwood.dtsi.

Signed-off-by: Jason Cooper <jason@lakedaemon.net>
---
NOTE: first version of this patch, no changelog.

 arch/arm/boot/dts/kirkwood.dtsi   |    8 ++++++++
 arch/arm/mach-kirkwood/board-dt.c |    2 --
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
index 771c6bb..0531dbb 100644
--- a/arch/arm/boot/dts/kirkwood.dtsi
+++ b/arch/arm/boot/dts/kirkwood.dtsi
@@ -2,5 +2,13 @@
 
 / {
 	compatible = "marvell,kirkwood";
+
+	serial@f1012000 {
+		compatible = "ns16550a";
+		reg = <0xf1012000 0xff>;
+		reg-shift = <2>;
+		interrupts = <33>;
+		clock-frequency = <200000000>;
+	};
 };
 
diff --git a/arch/arm/mach-kirkwood/board-dt.c b/arch/arm/mach-kirkwood/board-dt.c
index ab13eb9..e247ca7 100644
--- a/arch/arm/mach-kirkwood/board-dt.c
+++ b/arch/arm/mach-kirkwood/board-dt.c
@@ -140,8 +140,6 @@ static void __init dreamplug_init(void)
 	 */
 	kirkwood_mpp_conf(dreamplug_mpp_config);
 
-	kirkwood_uart0_init();
-
 	spi_register_board_info(dreamplug_spi_slave_info,
 				ARRAY_SIZE(dreamplug_spi_slave_info));
 	kirkwood_spi_init();
-- 
1.7.3.4
