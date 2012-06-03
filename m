From: Michael Walle <michael@walle.cc>
Subject: [PATCH 2/3] ARM: kirkwood: use devicetree for orion-spi
Date: Sun,  3 Jun 2012 22:17:57 +0200
Message-ID: <1338754678-17000-2-git-send-email-michael@walle.cc>
References: <1338754678-17000-1-git-send-email-michael@walle.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1338754678-17000-1-git-send-email-michael@walle.cc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, Michael Walle <michael@walle.cc>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

Populate the devices with auxdata to set the device names which are used by
clkdev to lookup the clocks.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm/boot/dts/kirkwood.dtsi   |    9 +++++++++
 arch/arm/mach-kirkwood/board-dt.c |    8 +++++++-
 2 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
index 926528b..46223b3 100644
--- a/arch/arm/boot/dts/kirkwood.dtsi
+++ b/arch/arm/boot/dts/kirkwood.dtsi
@@ -33,6 +33,15 @@
 			interrupts = <53>;
 		};
 
+		spi@10600 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			cell-index = <0>;
+			compatible = "mrvl,orion-spi";
+			reg = <0x10600 0x28>;
+			status = "disabled";
+		};
+
 		nand@3000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/mach-kirkwood/board-dt.c b/arch/arm/mach-kirkwood/board-dt.c
index edc3f8a..cf1e141 100644
--- a/arch/arm/mach-kirkwood/board-dt.c
+++ b/arch/arm/mach-kirkwood/board-dt.c
@@ -25,6 +25,11 @@ static struct of_device_id kirkwood_dt_match_table[] __initdata = {
 	{ }
 };
 
+struct of_dev_auxdata kirkwood_auxdata_lookup[] __initdata = {
+	OF_DEV_AUXDATA("mrvl,orion-spi", 0xf1010600, "orion_spi.0", NULL),
+	{}
+};
+
 static void __init kirkwood_dt_init(void)
 {
 	pr_info("Kirkwood: %s, TCLK=%d.\n", kirkwood_id(), kirkwood_tclk);
@@ -68,7 +73,8 @@ static void __init kirkwood_dt_init(void)
 	if (of_machine_is_compatible("raidsonic,ib-nas62x0"))
 		ib62x0_init();
 
-	of_platform_populate(NULL, kirkwood_dt_match_table, NULL, NULL);
+	of_platform_populate(NULL, kirkwood_dt_match_table,
+				kirkwood_auxdata_lookup, NULL);
 }
 
 static const char *kirkwood_dt_board_compat[] = {
-- 
1.7.2.5
