From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 2/5] auxdisplay: charlcd: Add support for 4-bit interfaces
Date: Fri, 10 Mar 2017 15:15:18 +0100
Message-ID: <1489155321-25666-3-git-send-email-geert@linux-m68k.org>
References: <1489155321-25666-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489155321-25666-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Willy Tarreau <willy@haproxy.com>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Akira Tsukamoto <akira.tsukamoto@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

In 4-bit mode, 8-bit commands and data are written using two raw writes
to the data interface: high nibble first, low nibble last.  This must be
handled by the low-level driver.

However, as we don't know in which mode (4-bit or 8-bit) nor 4-bit phase
the LCD was left, initialization must always be handled using raw
writes, and needs to configure the LCD for 8-bit mode first.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - No changes.
---
 drivers/auxdisplay/charlcd.c | 36 ++++++++++++++++++++++++++++++------
 include/misc/charlcd.h       |  2 ++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/auxdisplay/charlcd.c b/drivers/auxdisplay/charlcd.c
index 930ffb2fb31787c5..b3a84e90a268478c 100644
--- a/drivers/auxdisplay/charlcd.c
+++ b/drivers/auxdisplay/charlcd.c
@@ -223,24 +223,46 @@ static void charlcd_clear_display(struct charlcd *lcd)
 
 static int charlcd_init_display(struct charlcd *lcd)
 {
+	void (*write_cmd_raw)(struct charlcd *lcd, int cmd);
 	struct charlcd_priv *priv = to_priv(lcd);
+	u8 init;
+
+	if (lcd->ifwidth != 4 && lcd->ifwidth != 8)
+		return -EINVAL;
 
 	priv->flags = ((lcd->height > 1) ? LCD_FLAG_N : 0) | LCD_FLAG_D |
 		      LCD_FLAG_C | LCD_FLAG_B;
 
 	long_sleep(20);		/* wait 20 ms after power-up for the paranoid */
 
-	/* 8bits, 1 line, small fonts; let's do it 3 times */
-	lcd->ops->write_cmd(lcd, LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS);
+	/*
+	 * 8-bit mode, 1 line, small fonts; let's do it 3 times, to make sure
+	 * the LCD is in 8-bit mode afterwards
+	 */
+	init = LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS;
+	if (lcd->ifwidth == 4) {
+		init >>= 4;
+		write_cmd_raw = lcd->ops->write_cmd_raw4;
+	} else {
+		write_cmd_raw = lcd->ops->write_cmd;
+	}
+	write_cmd_raw(lcd, init);
 	long_sleep(10);
-	lcd->ops->write_cmd(lcd, LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS);
+	write_cmd_raw(lcd, init);
 	long_sleep(10);
-	lcd->ops->write_cmd(lcd, LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS);
+	write_cmd_raw(lcd, init);
 	long_sleep(10);
 
+	if (lcd->ifwidth == 4) {
+		/* Switch to 4-bit mode, 1 line, small fonts */
+		lcd->ops->write_cmd_raw4(lcd, LCD_CMD_FUNCTION_SET >> 4);
+		long_sleep(10);
+	}
+
 	/* set font height and lines number */
 	lcd->ops->write_cmd(lcd,
-		LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS |
+		LCD_CMD_FUNCTION_SET |
+		((lcd->ifwidth == 8) ? LCD_CMD_DATA_LEN_8BITS : 0) |
 		((priv->flags & LCD_FLAG_F) ? LCD_CMD_FONT_5X10_DOTS : 0) |
 		((priv->flags & LCD_FLAG_N) ? LCD_CMD_TWO_LINES : 0));
 	long_sleep(10);
@@ -482,7 +504,8 @@ static inline int handle_lcd_special_code(struct charlcd *lcd)
 	/* check whether one of F,N flags was changed */
 	else if ((oldflags ^ priv->flags) & (LCD_FLAG_F | LCD_FLAG_N))
 		lcd->ops->write_cmd(lcd,
-			LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS |
+			LCD_CMD_FUNCTION_SET |
+			((lcd->ifwidth == 8) ? LCD_CMD_DATA_LEN_8BITS : 0) |
 			((priv->flags & LCD_FLAG_F) ? LCD_CMD_FONT_5X10_DOTS : 0) |
 			((priv->flags & LCD_FLAG_N) ? LCD_CMD_TWO_LINES : 0));
 	/* check whether L flag was changed */
@@ -716,6 +739,7 @@ struct charlcd *charlcd_alloc(unsigned int drvdata_size)
 	priv->esc_seq.len = -1;
 
 	lcd = &priv->lcd;
+	lcd->ifwidth = 8;
 	lcd->bwidth = DEFAULT_LCD_BWIDTH;
 	lcd->hwidth = DEFAULT_LCD_HWIDTH;
 	lcd->drvdata = priv->drvdata;
diff --git a/include/misc/charlcd.h b/include/misc/charlcd.h
index c40047b673c9ea09..23f61850f3639ae1 100644
--- a/include/misc/charlcd.h
+++ b/include/misc/charlcd.h
@@ -14,6 +14,7 @@ struct charlcd {
 	const struct charlcd_ops *ops;
 	const unsigned char *char_conv;	/* Optional */
 
+	int ifwidth;			/* 4-bit or 8-bit (default) */
 	int height;
 	int width;
 	int bwidth;			/* Default set by charlcd_alloc() */
@@ -28,6 +29,7 @@ struct charlcd_ops {
 	void (*write_data)(struct charlcd *lcd, int data);
 
 	/* Optional */
+	void (*write_cmd_raw4)(struct charlcd *lcd, int cmd);	/* 4-bit only */
 	void (*clear_fast)(struct charlcd *lcd);
 	void (*backlight)(struct charlcd *lcd, int on);
 };
-- 
2.7.4
