From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 19/20] MIPS: SEAD3: Use img-ascii-lcd driver
Date: Tue, 9 Aug 2016 13:35:44 +0100
Message-ID: <20160809123546.10190-20-paul.burton@imgtec.com>
References: <20160809123546.10190-1-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160809123546.10190-1-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Probe the img-ascii-lcd driver using device tree in order to display a
message on the SEAD3 board's LCD display, and remove the platform code
that was formerly performing this function. This removes more platform
code and moves SEAD3 further towards being entirely DT-based.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---

 arch/mips/boot/dts/mti/sead3.dts    |  5 +++
 arch/mips/mti-sead3/Makefile        |  3 +-
 arch/mips/mti-sead3/sead3-display.c | 77 -------------------------------------
 arch/mips/mti-sead3/sead3-time.c    |  2 -
 4 files changed, 6 insertions(+), 81 deletions(-)
 delete mode 100644 arch/mips/mti-sead3/sead3-display.c

diff --git a/arch/mips/boot/dts/mti/sead3.dts b/arch/mips/boot/dts/mti/sead3.dts
index ae2e3ab..a3d2ae1 100644
--- a/arch/mips/boot/dts/mti/sead3.dts
+++ b/arch/mips/boot/dts/mti/sead3.dts
@@ -201,6 +201,11 @@
 			mask = <0x80>;
 			label = "fled7";
 		};
+
+		lcd@200 {
+			compatible = "mti,sead3-lcd";
+			offset = <0x200>;
+		};
 	};
 
 	/* UART connected to FTDI & miniUSB socket */
diff --git a/arch/mips/mti-sead3/Makefile b/arch/mips/mti-sead3/Makefile
index cb6d620..1674b9c 100644
--- a/arch/mips/mti-sead3/Makefile
+++ b/arch/mips/mti-sead3/Makefile
@@ -8,8 +8,7 @@
 # Copyright (C) 2012 MIPS Technoligies, Inc.  All rights reserved.
 # Steven J. Hill <sjhill-8NJIiSa5LzA@public.gmane.org>
 #
-obj-y := sead3-display.o
-obj-y += sead3-dtshim.o
+obj-y := sead3-dtshim.o
 obj-y += sead3-init.o
 obj-y += sead3-int.o
 obj-y += sead3-setup.o
diff --git a/arch/mips/mti-sead3/sead3-display.c b/arch/mips/mti-sead3/sead3-display.c
deleted file mode 100644
index 9487599..0000000
--- a/arch/mips/mti-sead3/sead3-display.c
+++ /dev/null
@@ -1,77 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2012 MIPS Technologies, Inc.  All rights reserved.
- */
-#include <linux/timer.h>
-#include <linux/io.h>
-#include <asm/mips-boards/generic.h>
-
-static unsigned int display_count;
-static unsigned int max_display_count;
-
-#define LCD_DISPLAY_POS_BASE		0x1f000400
-#define DISPLAY_LCDINSTRUCTION		(0*2)
-#define DISPLAY_LCDDATA			(1*2)
-#define DISPLAY_CPLDSTATUS		(2*2)
-#define DISPLAY_CPLDDATA		(3*2)
-#define LCD_SETDDRAM			0x80
-#define LCD_IR_BF			0x80
-
-const char display_string[] = "		      LINUX ON SEAD3		   ";
-
-static void scroll_display_message(unsigned long data);
-static DEFINE_TIMER(mips_scroll_timer, scroll_display_message, HZ, 0);
-
-static void lcd_wait(unsigned int __iomem *display)
-{
-	/* Wait for CPLD state machine to become idle. */
-	do { } while (__raw_readl(display + DISPLAY_CPLDSTATUS) & 1);
-
-	do {
-		__raw_readl(display + DISPLAY_LCDINSTRUCTION);
-
-		/* Wait for CPLD state machine to become idle. */
-		do { } while (__raw_readl(display + DISPLAY_CPLDSTATUS) & 1);
-	} while (__raw_readl(display + DISPLAY_CPLDDATA) & LCD_IR_BF);
-}
-
-void mips_display_message(const char *str)
-{
-	static unsigned int __iomem *display;
-	char ch;
-	int i;
-
-	if (unlikely(display == NULL))
-		display = ioremap_nocache(LCD_DISPLAY_POS_BASE,
-			(8 * sizeof(int)));
-
-	for (i = 0; i < 16; i++) {
-		if (*str)
-			ch = *str++;
-		else
-			ch = ' ';
-		lcd_wait(display);
-		__raw_writel((LCD_SETDDRAM | i),
-			(display + DISPLAY_LCDINSTRUCTION));
-		lcd_wait(display);
-		__raw_writel(ch, display + DISPLAY_LCDDATA);
-	}
-}
-
-static void scroll_display_message(unsigned long data)
-{
-	mips_display_message(&display_string[display_count++]);
-	if (display_count == max_display_count)
-		display_count = 0;
-	mod_timer(&mips_scroll_timer, jiffies + HZ);
-}
-
-void mips_scroll_message(void)
-{
-	del_timer_sync(&mips_scroll_timer);
-	max_display_count = strlen(display_string) + 1 - 16;
-	mod_timer(&mips_scroll_timer, jiffies + 1);
-}
diff --git a/arch/mips/mti-sead3/sead3-time.c b/arch/mips/mti-sead3/sead3-time.c
index a120b7a..10b0bf3 100644
--- a/arch/mips/mti-sead3/sead3-time.c
+++ b/arch/mips/mti-sead3/sead3-time.c
@@ -94,6 +94,4 @@ void __init plat_time_init(void)
 
 	pr_debug("CPU frequency %d.%02d MHz\n", (est_freq / 1000000),
 		(est_freq % 1000000) * 100 / 1000000);
-
-	mips_scroll_message();
 }
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
