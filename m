From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH 22/23] ARM: u300: add FSMC flash into the device tree
Date: Mon, 22 Apr 2013 12:02:19 +0200
Message-ID: <1366624939-7003-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

This registers the U300 FSMC flash controller from the
device tree, and defines the three partitions. Skip the
BBT scan as in the current platform data.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/ste-u300.dts | 26 ++++++++++++++++++++++++++
 arch/arm/mach-u300/core.c      |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/ste-u300.dts b/arch/arm/boot/dts/ste-u300.dts
index 9a163e1..e4b8c7b 100644
--- a/arch/arm/boot/dts/ste-u300.dts
+++ b/arch/arm/boot/dts/ste-u300.dts
@@ -75,6 +75,32 @@
 		interrupts = <2>;
 	};
 
+	/* A NAND flash of 128 MiB */
+	fsmc: flash@40000000 {
+		compatible = "stericsson,fsmc-nand";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x9f800000 0x1000>,	/* FSMC Register*/
+			<0x80000000 0x4000>,	/* NAND Base DATA */
+			<0x80020000 0x4000>,	/* NAND Base ADDR */
+			<0x80010000 0x4000>;	/* NAND Base CMD */
+		reg-names = "fsmc_regs", "nand_data", "nand_addr", "nand_cmd";
+		nand-skip-bbtscan;
+
+		partition@0 {
+		label = "boot records";
+			reg = <0x0 0x20000>;
+		};
+		partition@20000 {
+			label = "free";
+			reg = <0x20000 0x7e0000>;
+		};
+		partition@800000 {
+			label = "platform";
+			reg = <0x800000 0xf800000>;
+		};
+	};
+
 	i2c0: i2c@c0004000 {
 		compatible = "st,ddci2c";
 		reg = <0xc0004000 0x1000>;
diff --git a/arch/arm/mach-u300/core.c b/arch/arm/mach-u300/core.c
index 9467ffe..82f57f1 100644
--- a/arch/arm/mach-u300/core.c
+++ b/arch/arm/mach-u300/core.c
@@ -732,6 +732,8 @@ static struct of_dev_auxdata u300_auxdata_lookup[] __initdata = {
 		"rtc-coh901331", NULL),
 	OF_DEV_AUXDATA("stericsson,coh901318", U300_DMAC_BASE,
 		"coh901318", NULL),
+	OF_DEV_AUXDATA("stericsson,fsmc-nand", U300_NAND_IF_PHYS_BASE,
+		"fsmc-nand", NULL),
 	OF_DEV_AUXDATA("arm,primecell", U300_UART0_BASE,
 		"uart0", &uart0_plat_data),
 	OF_DEV_AUXDATA("arm,primecell", U300_UART1_BASE,
-- 
1.7.11.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
