From: Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 5/7 v2] ARM: kirkwood: convert uart0 to devicetree.
Date: Tue, 13 Mar 2012 01:57:47 +0000
Message-ID: <970083c931bbd5c58be3aa982a66fddc48ceb534.1331601448.git.jason@lakedaemon.net>
References: <cover.1331601448.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1331601448.git.jason@lakedaemon.net>
In-Reply-To: <cover.1331601448.git.jason@lakedaemon.net>
References: <cover.1330625877.git.jason@lakedaemon.net>
 <cover.1331601448.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arnd@arndb.de, olof@lixom.net
Cc: nicolas.pitre@linaro.org, andrew@lunn.ch, Jason Cooper <jason@lakedaemon.net>, jm@lentin.co.uk, grant.likely@secretlab.ca, michael@walle.cc, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This uart is the primary console for the dreamplug.  Removed
kirkwood_uart0_init() call from board-dreamplug.c.

There are two uarts on the kirkwood SoC, all or none of them may be
enabled, and the clock-frequency is board-dependant.  So, enabling and
clock-frequency are left to the board dts.

Signed-off-by: Jason Cooper <jason@lakedaemon.net>
---

Changes from v1:

* moved on-chip peripherals (uart's here) in kirkwood.dtsi and used ranges to
  simplify addressing
* disable uarts by default as not all boards enable them.  Can be enabled in
  board file
* specify clock-frequency in board file as it is board specific.  of_serial
  prints an error message if it isn't specified (view with earlyprintk)
* removed previous versions Reviewed-By's and Acked-By's as this is
  significantly different from the previous version.

 arch/arm/boot/dts/kirkwood-dreamplug.dts |    7 +++++++
 arch/arm/boot/dts/kirkwood.dtsi          |   26 +++++++++++++++++++++++++-
 arch/arm/mach-kirkwood/board-dreamplug.c |    2 --
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boot/dts/kirkwood-dreamplug.dts
index 9946d01..a5376b8 100644
--- a/arch/arm/boot/dts/kirkwood-dreamplug.dts
+++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
@@ -14,4 +14,11 @@
 	chosen {
 		bootargs = "console=ttyS0,115200n8 earlyprintk";
 	};
+
+	ocp@f1000000 {
+		serial@12000 {
+			clock-frequency = <200000000>;
+			status = "ok";
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
index 702b955..825310b 100644
--- a/arch/arm/boot/dts/kirkwood.dtsi
+++ b/arch/arm/boot/dts/kirkwood.dtsi
@@ -2,5 +2,29 @@
 
 / {
 	compatible = "mrvl,kirkwood";
-};
 
+	ocp@f1000000 {
+		compatible = "simple-bus";
+		ranges = <0 0xf1000000 0x1000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		serial@12000 {
+			compatible = "ns16550a";
+			reg = <0x12000 0x100>;
+			reg-shift = <2>;
+			interrupts = <33>;
+			/* set clock-frequency in board dts */
+			status = "disabled";
+		};
+
+		serial@12100 {
+			compatible = "ns16550a";
+			reg = <0x12100 0x100>;
+			reg-shift = <2>;
+			interrupts = <34>;
+			/* set clock-frequency in board dts */
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/mach-kirkwood/board-dreamplug.c b/arch/arm/mach-kirkwood/board-dreamplug.c
index 3b37315..3fbfb7d 100644
--- a/arch/arm/mach-kirkwood/board-dreamplug.c
+++ b/arch/arm/mach-kirkwood/board-dreamplug.c
@@ -135,8 +135,6 @@ void __init dreamplug_init(void)
 	 */
 	kirkwood_mpp_conf(dreamplug_mpp_config);
 
-	kirkwood_uart0_init();
-
 	spi_register_board_info(dreamplug_spi_slave_info,
 				ARRAY_SIZE(dreamplug_spi_slave_info));
 	kirkwood_spi_init();
-- 
1.7.3.4
