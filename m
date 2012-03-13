From: Jason Cooper <jason@lakedaemon.net>
Subject: [PATCH 7/7] ARM: kirkwood: use devicetree for rtc-mv
Date: Tue, 13 Mar 2012 01:57:49 +0000
Message-ID: <92d02581e0fce75f84d61edf55678108237e881a.1331601448.git.jason@lakedaemon.net>
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

Signed-off-by: Jason Cooper <jason@lakedaemon.net>
---
 arch/arm/boot/dts/kirkwood.dtsi   |    6 ++++++
 arch/arm/mach-kirkwood/board-dt.c |    1 -
 arch/arm/mach-kirkwood/common.c   |    2 +-
 arch/arm/mach-kirkwood/common.h   |    1 -
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood.dtsi b/arch/arm/boot/dts/kirkwood.dtsi
index 825310b..3474ef8 100644
--- a/arch/arm/boot/dts/kirkwood.dtsi
+++ b/arch/arm/boot/dts/kirkwood.dtsi
@@ -26,5 +26,11 @@
 			/* set clock-frequency in board dts */
 			status = "disabled";
 		};
+
+		rtc@10300 {
+			compatible = "mrvl,kirkwood-rtc", "mrvl,orion-rtc";
+			reg = <0x10300 0x20>;
+			interrupts = <53>;
+		};
 	};
 };
diff --git a/arch/arm/mach-kirkwood/board-dt.c b/arch/arm/mach-kirkwood/board-dt.c
index ce008f2..0819240 100644
--- a/arch/arm/mach-kirkwood/board-dt.c
+++ b/arch/arm/mach-kirkwood/board-dt.c
@@ -43,7 +43,6 @@ static void __init kirkwood_dt_init(void)
 #endif
 
 	/* internal devices that every board has */
-	kirkwood_rtc_init();
 	kirkwood_wdt_init();
 	kirkwood_xor0_init();
 	kirkwood_xor1_init();
diff --git a/arch/arm/mach-kirkwood/common.c b/arch/arm/mach-kirkwood/common.c
index ae90f60..ef45244 100644
--- a/arch/arm/mach-kirkwood/common.c
+++ b/arch/arm/mach-kirkwood/common.c
@@ -162,7 +162,7 @@ void __init kirkwood_nand_init_rnb(struct mtd_partition *parts, int nr_parts,
 /*****************************************************************************
  * SoC RTC
  ****************************************************************************/
-void __init kirkwood_rtc_init(void)
+static void __init kirkwood_rtc_init(void)
 {
 	orion_rtc_init(RTC_PHYS_BASE, IRQ_KIRKWOOD_RTC);
 }
diff --git a/arch/arm/mach-kirkwood/common.h b/arch/arm/mach-kirkwood/common.h
index 194daa9..d7063eb 100644
--- a/arch/arm/mach-kirkwood/common.h
+++ b/arch/arm/mach-kirkwood/common.h
@@ -57,7 +57,6 @@ void dreamplug_init(void);
 /* early init functions not converted to fdt yet */
 char *kirkwood_id(void);
 void kirkwood_l2_init(void);
-void kirkwood_rtc_init(void);
 void kirkwood_wdt_init(void);
 void kirkwood_xor0_init(void);
 void kirkwood_xor1_init(void);
-- 
1.7.3.4
