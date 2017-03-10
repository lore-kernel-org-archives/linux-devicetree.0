From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH v2 1/5] auxdisplay: charlcd: Extract character LCD core from misc/panel
Date: Fri, 10 Mar 2017 15:15:17 +0100
Message-ID: <1489155321-25666-2-git-send-email-geert@linux-m68k.org>
References: <1489155321-25666-1-git-send-email-geert@linux-m68k.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489155321-25666-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Willy Tarreau <willy-W4YR9g1X7EZBDgjK7y7TUQ@public.gmane.org>, Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akira Tsukamoto <akira.tsukamoto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Extract the character LCD core from the Parallel port LCD/Keypad Panel
driver in the misc subsystem, and convert it into a subdriver in the
auxdisplay subsystem.  This allows the character LCD core to be used by
other drivers later.

Compilation is controlled by its own Kconfig symbol CHARLCD, which is to
be selected by its users, but can be enabled manually for
compile-testing.

All functions changed their prefix from "lcd_" to "charlcd_", and gained
a "struct charlcd *" parameter to operate on a specific instance.
While the driver API thus is ready to support multiple instances, the
current limitation of a single display (/dev/lcd has a single misc minor
assigned) is retained.

No functional changes intended.

Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
---
v2:
  - Move backlight mutex initialization before call to
    charlcd_init_display(), to prevent locking an uninitialized mutex
    (reported by 0day).
---
 drivers/auxdisplay/Kconfig   |   3 +
 drivers/auxdisplay/Makefile  |   1 +
 drivers/auxdisplay/charlcd.c | 790 +++++++++++++++++++++++++++++++++++++++++
 drivers/misc/Kconfig         |   1 +
 drivers/misc/panel.c         | 827 +++++--------------------------------------
 include/misc/charlcd.h       |  40 +++
 6 files changed, 927 insertions(+), 735 deletions(-)
 create mode 100644 drivers/auxdisplay/charlcd.c
 create mode 100644 include/misc/charlcd.h

diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 8a8e403644d6e0d6..b4686380d4e3cca9 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -13,6 +13,9 @@ menuconfig AUXDISPLAY
 
 	  If you say N, all options in this submenu will be skipped and disabled.
 
+config CHARLCD
+	tristate "Character LCD core support" if COMPILE_TEST
+
 if AUXDISPLAY
 
 config KS0108
diff --git a/drivers/auxdisplay/Makefile b/drivers/auxdisplay/Makefile
index cb3dd847713bb6d1..f56f45dcc78e332e 100644
--- a/drivers/auxdisplay/Makefile
+++ b/drivers/auxdisplay/Makefile
@@ -2,6 +2,7 @@
 # Makefile for the kernel auxiliary displays device drivers.
 #
 
+obj-$(CONFIG_CHARLCD)		+= charlcd.o
 obj-$(CONFIG_KS0108)		+= ks0108.o
 obj-$(CONFIG_CFAG12864B)	+= cfag12864b.o cfag12864bfb.o
 obj-$(CONFIG_IMG_ASCII_LCD)	+= img-ascii-lcd.o
diff --git a/drivers/auxdisplay/charlcd.c b/drivers/auxdisplay/charlcd.c
new file mode 100644
index 0000000000000000..930ffb2fb31787c5
--- /dev/null
+++ b/drivers/auxdisplay/charlcd.c
@@ -0,0 +1,790 @@
+/*
+ * Character LCD driver for Linux
+ *
+ * Copyright (C) 2000-2008, Willy Tarreau <w@1wt.eu>
+ * Copyright (C) 2016-2017 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/atomic.h>
+#include <linux/delay.h>
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/reboot.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/workqueue.h>
+
+#include <generated/utsrelease.h>
+
+#include <misc/charlcd.h>
+
+#define LCD_MINOR		156
+
+#define DEFAULT_LCD_BWIDTH      40
+#define DEFAULT_LCD_HWIDTH      64
+
+/* Keep the backlight on this many seconds for each flash */
+#define LCD_BL_TEMPO_PERIOD	4
+
+#define LCD_FLAG_B		0x0004	/* Blink on */
+#define LCD_FLAG_C		0x0008	/* Cursor on */
+#define LCD_FLAG_D		0x0010	/* Display on */
+#define LCD_FLAG_F		0x0020	/* Large font mode */
+#define LCD_FLAG_N		0x0040	/* 2-rows mode */
+#define LCD_FLAG_L		0x0080	/* Backlight enabled */
+
+/* LCD commands */
+#define LCD_CMD_DISPLAY_CLEAR	0x01	/* Clear entire display */
+
+#define LCD_CMD_ENTRY_MODE	0x04	/* Set entry mode */
+#define LCD_CMD_CURSOR_INC	0x02	/* Increment cursor */
+
+#define LCD_CMD_DISPLAY_CTRL	0x08	/* Display control */
+#define LCD_CMD_DISPLAY_ON	0x04	/* Set display on */
+#define LCD_CMD_CURSOR_ON	0x02	/* Set cursor on */
+#define LCD_CMD_BLINK_ON	0x01	/* Set blink on */
+
+#define LCD_CMD_SHIFT		0x10	/* Shift cursor/display */
+#define LCD_CMD_DISPLAY_SHIFT	0x08	/* Shift display instead of cursor */
+#define LCD_CMD_SHIFT_RIGHT	0x04	/* Shift display/cursor to the right */
+
+#define LCD_CMD_FUNCTION_SET	0x20	/* Set function */
+#define LCD_CMD_DATA_LEN_8BITS	0x10	/* Set data length to 8 bits */
+#define LCD_CMD_TWO_LINES	0x08	/* Set to two display lines */
+#define LCD_CMD_FONT_5X10_DOTS	0x04	/* Set char font to 5x10 dots */
+
+#define LCD_CMD_SET_CGRAM_ADDR	0x40	/* Set char generator RAM address */
+
+#define LCD_CMD_SET_DDRAM_ADDR	0x80	/* Set display data RAM address */
+
+#define LCD_ESCAPE_LEN		24	/* Max chars for LCD escape command */
+#define LCD_ESCAPE_CHAR		27	/* Use char 27 for escape command */
+
+struct charlcd_priv {
+	struct charlcd lcd;
+
+	struct delayed_work bl_work;
+	struct mutex bl_tempo_lock;	/* Protects access to bl_tempo */
+	bool bl_tempo;
+
+	bool must_clear;
+
+	/* contains the LCD config state */
+	unsigned long int flags;
+
+	/* Contains the LCD X and Y offset */
+	struct {
+		unsigned long int x;
+		unsigned long int y;
+	} addr;
+
+	/* Current escape sequence and it's length or -1 if outside */
+	struct {
+		char buf[LCD_ESCAPE_LEN + 1];
+		int len;
+	} esc_seq;
+
+	unsigned long long drvdata[0];
+};
+
+#define to_priv(p)	container_of(p, struct charlcd_priv, lcd)
+
+/* Device single-open policy control */
+static atomic_t charlcd_available = ATOMIC_INIT(1);
+
+/* sleeps that many milliseconds with a reschedule */
+static void long_sleep(int ms)
+{
+	if (in_interrupt())
+		mdelay(ms);
+	else
+		schedule_timeout_interruptible(msecs_to_jiffies(ms));
+}
+
+/* turn the backlight on or off */
+static void charlcd_backlight(struct charlcd *lcd, int on)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+
+	if (!lcd->ops->backlight)
+		return;
+
+	mutex_lock(&priv->bl_tempo_lock);
+	if (!priv->bl_tempo)
+		lcd->ops->backlight(lcd, on);
+	mutex_unlock(&priv->bl_tempo_lock);
+}
+
+static void charlcd_bl_off(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct charlcd_priv *priv =
+		container_of(dwork, struct charlcd_priv, bl_work);
+
+	mutex_lock(&priv->bl_tempo_lock);
+	if (priv->bl_tempo) {
+		priv->bl_tempo = false;
+		if (!(priv->flags & LCD_FLAG_L))
+			priv->lcd.ops->backlight(&priv->lcd, 0);
+	}
+	mutex_unlock(&priv->bl_tempo_lock);
+}
+
+/* turn the backlight on for a little while */
+void charlcd_poke(struct charlcd *lcd)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+
+	if (!lcd->ops->backlight)
+		return;
+
+	cancel_delayed_work_sync(&priv->bl_work);
+
+	mutex_lock(&priv->bl_tempo_lock);
+	if (!priv->bl_tempo && !(priv->flags & LCD_FLAG_L))
+		lcd->ops->backlight(lcd, 1);
+	priv->bl_tempo = true;
+	schedule_delayed_work(&priv->bl_work, LCD_BL_TEMPO_PERIOD * HZ);
+	mutex_unlock(&priv->bl_tempo_lock);
+}
+EXPORT_SYMBOL_GPL(charlcd_poke);
+
+static void charlcd_gotoxy(struct charlcd *lcd)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+
+	lcd->ops->write_cmd(lcd,
+		LCD_CMD_SET_DDRAM_ADDR | (priv->addr.y ? lcd->hwidth : 0) |
+		/*
+		 * we force the cursor to stay at the end of the
+		 * line if it wants to go farther
+		 */
+		((priv->addr.x < lcd->bwidth) ? priv->addr.x & (lcd->hwidth - 1)
+					      : lcd->bwidth - 1));
+}
+
+static void charlcd_home(struct charlcd *lcd)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+
+	priv->addr.x = 0;
+	priv->addr.y = 0;
+	charlcd_gotoxy(lcd);
+}
+
+static void charlcd_print(struct charlcd *lcd, char c)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+
+	if (priv->addr.x < lcd->bwidth) {
+		if (lcd->char_conv)
+			c = lcd->char_conv[(unsigned char)c];
+		lcd->ops->write_data(lcd, c);
+		priv->addr.x++;
+	}
+	/* prevents the cursor from wrapping onto the next line */
+	if (priv->addr.x == lcd->bwidth)
+		charlcd_gotoxy(lcd);
+}
+
+static void charlcd_clear_fast(struct charlcd *lcd)
+{
+	int pos;
+
+	charlcd_home(lcd);
+
+	if (lcd->ops->clear_fast)
+		lcd->ops->clear_fast(lcd);
+	else
+		for (pos = 0; pos < lcd->height * lcd->hwidth; pos++)
+			lcd->ops->write_data(lcd, ' ');
+
+	charlcd_home(lcd);
+}
+
+/* clears the display and resets X/Y */
+static void charlcd_clear_display(struct charlcd *lcd)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+
+	lcd->ops->write_cmd(lcd, LCD_CMD_DISPLAY_CLEAR);
+	priv->addr.x = 0;
+	priv->addr.y = 0;
+	/* we must wait a few milliseconds (15) */
+	long_sleep(15);
+}
+
+static int charlcd_init_display(struct charlcd *lcd)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+
+	priv->flags = ((lcd->height > 1) ? LCD_FLAG_N : 0) | LCD_FLAG_D |
+		      LCD_FLAG_C | LCD_FLAG_B;
+
+	long_sleep(20);		/* wait 20 ms after power-up for the paranoid */
+
+	/* 8bits, 1 line, small fonts; let's do it 3 times */
+	lcd->ops->write_cmd(lcd, LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS);
+	long_sleep(10);
+	lcd->ops->write_cmd(lcd, LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS);
+	long_sleep(10);
+	lcd->ops->write_cmd(lcd, LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS);
+	long_sleep(10);
+
+	/* set font height and lines number */
+	lcd->ops->write_cmd(lcd,
+		LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS |
+		((priv->flags & LCD_FLAG_F) ? LCD_CMD_FONT_5X10_DOTS : 0) |
+		((priv->flags & LCD_FLAG_N) ? LCD_CMD_TWO_LINES : 0));
+	long_sleep(10);
+
+	/* display off, cursor off, blink off */
+	lcd->ops->write_cmd(lcd, LCD_CMD_DISPLAY_CTRL);
+	long_sleep(10);
+
+	lcd->ops->write_cmd(lcd,
+		LCD_CMD_DISPLAY_CTRL |	/* set display mode */
+		((priv->flags & LCD_FLAG_D) ? LCD_CMD_DISPLAY_ON : 0) |
+		((priv->flags & LCD_FLAG_C) ? LCD_CMD_CURSOR_ON : 0) |
+		((priv->flags & LCD_FLAG_B) ? LCD_CMD_BLINK_ON : 0));
+
+	charlcd_backlight(lcd, (priv->flags & LCD_FLAG_L) ? 1 : 0);
+
+	long_sleep(10);
+
+	/* entry mode set : increment, cursor shifting */
+	lcd->ops->write_cmd(lcd, LCD_CMD_ENTRY_MODE | LCD_CMD_CURSOR_INC);
+
+	charlcd_clear_display(lcd);
+	return 0;
+}
+
+/*
+ * These are the file operation function for user access to /dev/lcd
+ * This function can also be called from inside the kernel, by
+ * setting file and ppos to NULL.
+ *
+ */
+
+static inline int handle_lcd_special_code(struct charlcd *lcd)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+
+	/* LCD special codes */
+
+	int processed = 0;
+
+	char *esc = priv->esc_seq.buf + 2;
+	int oldflags = priv->flags;
+
+	/* check for display mode flags */
+	switch (*esc) {
+	case 'D':	/* Display ON */
+		priv->flags |= LCD_FLAG_D;
+		processed = 1;
+		break;
+	case 'd':	/* Display OFF */
+		priv->flags &= ~LCD_FLAG_D;
+		processed = 1;
+		break;
+	case 'C':	/* Cursor ON */
+		priv->flags |= LCD_FLAG_C;
+		processed = 1;
+		break;
+	case 'c':	/* Cursor OFF */
+		priv->flags &= ~LCD_FLAG_C;
+		processed = 1;
+		break;
+	case 'B':	/* Blink ON */
+		priv->flags |= LCD_FLAG_B;
+		processed = 1;
+		break;
+	case 'b':	/* Blink OFF */
+		priv->flags &= ~LCD_FLAG_B;
+		processed = 1;
+		break;
+	case '+':	/* Back light ON */
+		priv->flags |= LCD_FLAG_L;
+		processed = 1;
+		break;
+	case '-':	/* Back light OFF */
+		priv->flags &= ~LCD_FLAG_L;
+		processed = 1;
+		break;
+	case '*':	/* Flash back light */
+		charlcd_poke(lcd);
+		processed = 1;
+		break;
+	case 'f':	/* Small Font */
+		priv->flags &= ~LCD_FLAG_F;
+		processed = 1;
+		break;
+	case 'F':	/* Large Font */
+		priv->flags |= LCD_FLAG_F;
+		processed = 1;
+		break;
+	case 'n':	/* One Line */
+		priv->flags &= ~LCD_FLAG_N;
+		processed = 1;
+		break;
+	case 'N':	/* Two Lines */
+		priv->flags |= LCD_FLAG_N;
+		break;
+	case 'l':	/* Shift Cursor Left */
+		if (priv->addr.x > 0) {
+			/* back one char if not at end of line */
+			if (priv->addr.x < lcd->bwidth)
+				lcd->ops->write_cmd(lcd, LCD_CMD_SHIFT);
+			priv->addr.x--;
+		}
+		processed = 1;
+		break;
+	case 'r':	/* shift cursor right */
+		if (priv->addr.x < lcd->width) {
+			/* allow the cursor to pass the end of the line */
+			if (priv->addr.x < (lcd->bwidth - 1))
+				lcd->ops->write_cmd(lcd,
+					LCD_CMD_SHIFT | LCD_CMD_SHIFT_RIGHT);
+			priv->addr.x++;
+		}
+		processed = 1;
+		break;
+	case 'L':	/* shift display left */
+		lcd->ops->write_cmd(lcd, LCD_CMD_SHIFT | LCD_CMD_DISPLAY_SHIFT);
+		processed = 1;
+		break;
+	case 'R':	/* shift display right */
+		lcd->ops->write_cmd(lcd,
+				    LCD_CMD_SHIFT | LCD_CMD_DISPLAY_SHIFT |
+				    LCD_CMD_SHIFT_RIGHT);
+		processed = 1;
+		break;
+	case 'k': {	/* kill end of line */
+		int x;
+
+		for (x = priv->addr.x; x < lcd->bwidth; x++)
+			lcd->ops->write_data(lcd, ' ');
+
+		/* restore cursor position */
+		charlcd_gotoxy(lcd);
+		processed = 1;
+		break;
+	}
+	case 'I':	/* reinitialize display */
+		charlcd_init_display(lcd);
+		processed = 1;
+		break;
+	case 'G': {
+		/* Generator : LGcxxxxx...xx; must have <c> between '0'
+		 * and '7', representing the numerical ASCII code of the
+		 * redefined character, and <xx...xx> a sequence of 16
+		 * hex digits representing 8 bytes for each character.
+		 * Most LCDs will only use 5 lower bits of the 7 first
+		 * bytes.
+		 */
+
+		unsigned char cgbytes[8];
+		unsigned char cgaddr;
+		int cgoffset;
+		int shift;
+		char value;
+		int addr;
+
+		if (!strchr(esc, ';'))
+			break;
+
+		esc++;
+
+		cgaddr = *(esc++) - '0';
+		if (cgaddr > 7) {
+			processed = 1;
+			break;
+		}
+
+		cgoffset = 0;
+		shift = 0;
+		value = 0;
+		while (*esc && cgoffset < 8) {
+			shift ^= 4;
+			if (*esc >= '0' && *esc <= '9') {
+				value |= (*esc - '0') << shift;
+			} else if (*esc >= 'A' && *esc <= 'Z') {
+				value |= (*esc - 'A' + 10) << shift;
+			} else if (*esc >= 'a' && *esc <= 'z') {
+				value |= (*esc - 'a' + 10) << shift;
+			} else {
+				esc++;
+				continue;
+			}
+
+			if (shift == 0) {
+				cgbytes[cgoffset++] = value;
+				value = 0;
+			}
+
+			esc++;
+		}
+
+		lcd->ops->write_cmd(lcd, LCD_CMD_SET_CGRAM_ADDR | (cgaddr * 8));
+		for (addr = 0; addr < cgoffset; addr++)
+			lcd->ops->write_data(lcd, cgbytes[addr]);
+
+		/* ensures that we stop writing to CGRAM */
+		charlcd_gotoxy(lcd);
+		processed = 1;
+		break;
+	}
+	case 'x':	/* gotoxy : LxXXX[yYYY]; */
+	case 'y':	/* gotoxy : LyYYY[xXXX]; */
+		if (!strchr(esc, ';'))
+			break;
+
+		while (*esc) {
+			if (*esc == 'x') {
+				esc++;
+				if (kstrtoul(esc, 10, &priv->addr.x) < 0)
+					break;
+			} else if (*esc == 'y') {
+				esc++;
+				if (kstrtoul(esc, 10, &priv->addr.y) < 0)
+					break;
+			} else {
+				break;
+			}
+		}
+
+		charlcd_gotoxy(lcd);
+		processed = 1;
+		break;
+	}
+
+	/* TODO: This indent party here got ugly, clean it! */
+	/* Check whether one flag was changed */
+	if (oldflags == priv->flags)
+		return processed;
+
+	/* check whether one of B,C,D flags were changed */
+	if ((oldflags ^ priv->flags) &
+	    (LCD_FLAG_B | LCD_FLAG_C | LCD_FLAG_D))
+		/* set display mode */
+		lcd->ops->write_cmd(lcd,
+			LCD_CMD_DISPLAY_CTRL |
+			((priv->flags & LCD_FLAG_D) ? LCD_CMD_DISPLAY_ON : 0) |
+			((priv->flags & LCD_FLAG_C) ? LCD_CMD_CURSOR_ON : 0) |
+			((priv->flags & LCD_FLAG_B) ? LCD_CMD_BLINK_ON : 0));
+	/* check whether one of F,N flags was changed */
+	else if ((oldflags ^ priv->flags) & (LCD_FLAG_F | LCD_FLAG_N))
+		lcd->ops->write_cmd(lcd,
+			LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS |
+			((priv->flags & LCD_FLAG_F) ? LCD_CMD_FONT_5X10_DOTS : 0) |
+			((priv->flags & LCD_FLAG_N) ? LCD_CMD_TWO_LINES : 0));
+	/* check whether L flag was changed */
+	else if ((oldflags ^ priv->flags) & LCD_FLAG_L)
+		charlcd_backlight(lcd, !!(priv->flags & LCD_FLAG_L));
+
+	return processed;
+}
+
+static void charlcd_write_char(struct charlcd *lcd, char c)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+
+	/* first, we'll test if we're in escape mode */
+	if ((c != '\n') && priv->esc_seq.len >= 0) {
+		/* yes, let's add this char to the buffer */
+		priv->esc_seq.buf[priv->esc_seq.len++] = c;
+		priv->esc_seq.buf[priv->esc_seq.len] = 0;
+	} else {
+		/* aborts any previous escape sequence */
+		priv->esc_seq.len = -1;
+
+		switch (c) {
+		case LCD_ESCAPE_CHAR:
+			/* start of an escape sequence */
+			priv->esc_seq.len = 0;
+			priv->esc_seq.buf[priv->esc_seq.len] = 0;
+			break;
+		case '\b':
+			/* go back one char and clear it */
+			if (priv->addr.x > 0) {
+				/*
+				 * check if we're not at the
+				 * end of the line
+				 */
+				if (priv->addr.x < lcd->bwidth)
+					/* back one char */
+					lcd->ops->write_cmd(lcd, LCD_CMD_SHIFT);
+				priv->addr.x--;
+			}
+			/* replace with a space */
+			lcd->ops->write_data(lcd, ' ');
+			/* back one char again */
+			lcd->ops->write_cmd(lcd, LCD_CMD_SHIFT);
+			break;
+		case '\014':
+			/* quickly clear the display */
+			charlcd_clear_fast(lcd);
+			break;
+		case '\n':
+			/*
+			 * flush the remainder of the current line and
+			 * go to the beginning of the next line
+			 */
+			for (; priv->addr.x < lcd->bwidth; priv->addr.x++)
+				lcd->ops->write_data(lcd, ' ');
+			priv->addr.x = 0;
+			priv->addr.y = (priv->addr.y + 1) % lcd->height;
+			charlcd_gotoxy(lcd);
+			break;
+		case '\r':
+			/* go to the beginning of the same line */
+			priv->addr.x = 0;
+			charlcd_gotoxy(lcd);
+			break;
+		case '\t':
+			/* print a space instead of the tab */
+			charlcd_print(lcd, ' ');
+			break;
+		default:
+			/* simply print this char */
+			charlcd_print(lcd, c);
+			break;
+		}
+	}
+
+	/*
+	 * now we'll see if we're in an escape mode and if the current
+	 * escape sequence can be understood.
+	 */
+	if (priv->esc_seq.len >= 2) {
+		int processed = 0;
+
+		if (!strcmp(priv->esc_seq.buf, "[2J")) {
+			/* clear the display */
+			charlcd_clear_fast(lcd);
+			processed = 1;
+		} else if (!strcmp(priv->esc_seq.buf, "[H")) {
+			/* cursor to home */
+			charlcd_home(lcd);
+			processed = 1;
+		}
+		/* codes starting with ^[[L */
+		else if ((priv->esc_seq.len >= 3) &&
+			 (priv->esc_seq.buf[0] == '[') &&
+			 (priv->esc_seq.buf[1] == 'L')) {
+			processed = handle_lcd_special_code(lcd);
+		}
+
+		/* LCD special escape codes */
+		/*
+		 * flush the escape sequence if it's been processed
+		 * or if it is getting too long.
+		 */
+		if (processed || (priv->esc_seq.len >= LCD_ESCAPE_LEN))
+			priv->esc_seq.len = -1;
+	} /* escape codes */
+}
+
+static struct charlcd *the_charlcd;
+
+static ssize_t charlcd_write(struct file *file, const char __user *buf,
+			     size_t count, loff_t *ppos)
+{
+	const char __user *tmp = buf;
+	char c;
+
+	for (; count-- > 0; (*ppos)++, tmp++) {
+		if (!in_interrupt() && (((count + 1) & 0x1f) == 0))
+			/*
+			 * let's be a little nice with other processes
+			 * that need some CPU
+			 */
+			schedule();
+
+		if (get_user(c, tmp))
+			return -EFAULT;
+
+		charlcd_write_char(the_charlcd, c);
+	}
+
+	return tmp - buf;
+}
+
+static int charlcd_open(struct inode *inode, struct file *file)
+{
+	struct charlcd_priv *priv = to_priv(the_charlcd);
+
+	if (!atomic_dec_and_test(&charlcd_available))
+		return -EBUSY;	/* open only once at a time */
+
+	if (file->f_mode & FMODE_READ)	/* device is write-only */
+		return -EPERM;
+
+	if (priv->must_clear) {
+		charlcd_clear_display(&priv->lcd);
+		priv->must_clear = false;
+	}
+	return nonseekable_open(inode, file);
+}
+
+static int charlcd_release(struct inode *inode, struct file *file)
+{
+	atomic_inc(&charlcd_available);
+	return 0;
+}
+
+static const struct file_operations charlcd_fops = {
+	.write   = charlcd_write,
+	.open    = charlcd_open,
+	.release = charlcd_release,
+	.llseek  = no_llseek,
+};
+
+static struct miscdevice charlcd_dev = {
+	.minor	= LCD_MINOR,
+	.name	= "lcd",
+	.fops	= &charlcd_fops,
+};
+
+static void charlcd_puts(struct charlcd *lcd, const char *s)
+{
+	const char *tmp = s;
+	int count = strlen(s);
+
+	for (; count-- > 0; tmp++) {
+		if (!in_interrupt() && (((count + 1) & 0x1f) == 0))
+			/*
+			 * let's be a little nice with other processes
+			 * that need some CPU
+			 */
+			schedule();
+
+		charlcd_write_char(lcd, *tmp);
+	}
+}
+
+/* initialize the LCD driver */
+static int charlcd_init(struct charlcd *lcd)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+	int ret;
+
+	if (lcd->ops->backlight) {
+		mutex_init(&priv->bl_tempo_lock);
+		INIT_DELAYED_WORK(&priv->bl_work, charlcd_bl_off);
+	}
+
+	/*
+	 * before this line, we must NOT send anything to the display.
+	 * Since charlcd_init_display() needs to write data, we have to
+	 * enable mark the LCD initialized just before.
+	 */
+	ret = charlcd_init_display(lcd);
+	if (ret)
+		return ret;
+
+	/* display a short message */
+#ifdef CONFIG_PANEL_CHANGE_MESSAGE
+#ifdef CONFIG_PANEL_BOOT_MESSAGE
+	charlcd_puts(lcd, "\x1b[Lc\x1b[Lb\x1b[L*" CONFIG_PANEL_BOOT_MESSAGE);
+#endif
+#else
+	charlcd_puts(lcd, "\x1b[Lc\x1b[Lb\x1b[L*Linux-" UTS_RELEASE "\n");
+#endif
+	/* clear the display on the next device opening */
+	priv->must_clear = true;
+	charlcd_home(lcd);
+	return 0;
+}
+
+struct charlcd *charlcd_alloc(unsigned int drvdata_size)
+{
+	struct charlcd_priv *priv;
+	struct charlcd *lcd;
+
+	priv = kzalloc(sizeof(*priv) + drvdata_size, GFP_KERNEL);
+	if (!priv)
+		return NULL;
+
+	priv->esc_seq.len = -1;
+
+	lcd = &priv->lcd;
+	lcd->bwidth = DEFAULT_LCD_BWIDTH;
+	lcd->hwidth = DEFAULT_LCD_HWIDTH;
+	lcd->drvdata = priv->drvdata;
+
+	return lcd;
+}
+EXPORT_SYMBOL_GPL(charlcd_alloc);
+
+static int panel_notify_sys(struct notifier_block *this, unsigned long code,
+			    void *unused)
+{
+	struct charlcd *lcd = the_charlcd;
+
+	switch (code) {
+	case SYS_DOWN:
+		charlcd_puts(lcd,
+			     "\x0cReloading\nSystem...\x1b[Lc\x1b[Lb\x1b[L+");
+		break;
+	case SYS_HALT:
+		charlcd_puts(lcd, "\x0cSystem Halted.\x1b[Lc\x1b[Lb\x1b[L+");
+		break;
+	case SYS_POWER_OFF:
+		charlcd_puts(lcd, "\x0cPower off.\x1b[Lc\x1b[Lb\x1b[L+");
+		break;
+	default:
+		break;
+	}
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block panel_notifier = {
+	panel_notify_sys,
+	NULL,
+	0
+};
+
+int charlcd_register(struct charlcd *lcd)
+{
+	int ret;
+
+	ret = charlcd_init(lcd);
+	if (ret)
+		return ret;
+
+	ret = misc_register(&charlcd_dev);
+	if (ret)
+		return ret;
+
+	the_charlcd = lcd;
+	register_reboot_notifier(&panel_notifier);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(charlcd_register);
+
+int charlcd_unregister(struct charlcd *lcd)
+{
+	struct charlcd_priv *priv = to_priv(lcd);
+
+	unregister_reboot_notifier(&panel_notifier);
+	charlcd_puts(lcd, "\x0cLCD driver unloaded.\x1b[Lc\x1b[Lb\x1b[L-");
+	misc_deregister(&charlcd_dev);
+	the_charlcd = NULL;
+	if (lcd->ops->backlight) {
+		cancel_delayed_work_sync(&priv->bl_work);
+		priv->lcd.ops->backlight(&priv->lcd, 0);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(charlcd_unregister);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index c290990d73edf87e..6e7bf55a542ebf8c 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -495,6 +495,7 @@ config VEXPRESS_SYSCFG
 config PANEL
 	tristate "Parallel port LCD/Keypad Panel support"
 	depends on PARPORT
+	select CHARLCD
 	---help---
 	  Say Y here if you have an HD44780 or KS-0074 LCD connected to your
 	  parallel port. This driver also features 4 and 6-key keypads. The LCD
diff --git a/drivers/misc/panel.c b/drivers/misc/panel.c
index ef2ece0f26afc6b5..e0c014c2356ffb14 100644
--- a/drivers/misc/panel.c
+++ b/drivers/misc/panel.c
@@ -1,6 +1,7 @@
 /*
  * Front panel driver for Linux
  * Copyright (C) 2000-2008, Willy Tarreau <w@1wt.eu>
+ * Copyright (C) 2016-2017 Glider bvba
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
@@ -54,15 +55,12 @@
 #include <linux/ctype.h>
 #include <linux/parport.h>
 #include <linux/list.h>
-#include <linux/notifier.h>
-#include <linux/reboot.h>
-#include <linux/workqueue.h>
-#include <generated/utsrelease.h>
 
 #include <linux/io.h>
 #include <linux/uaccess.h>
 
-#define LCD_MINOR		156
+#include <misc/charlcd.h>
+
 #define KEYPAD_MINOR		185
 
 #define LCD_MAXBYTES		256	/* max burst write */
@@ -76,9 +74,6 @@
 /* a key repeats this times INPUT_POLL_TIME */
 #define KEYPAD_REP_DELAY	(2)
 
-/* keep the light on this many seconds for each flash */
-#define FLASH_LIGHT_TEMPO	(4)
-
 /* converts an r_str() input to an active high, bits string : 000BAOSE */
 #define PNL_PINPUT(a)		((((unsigned char)(a)) ^ 0x7F) >> 3)
 
@@ -120,40 +115,6 @@
 #define PIN_SELECP		17
 #define PIN_NOT_SET		127
 
-#define LCD_FLAG_B		0x0004	/* blink on */
-#define LCD_FLAG_C		0x0008	/* cursor on */
-#define LCD_FLAG_D		0x0010	/* display on */
-#define LCD_FLAG_F		0x0020	/* large font mode */
-#define LCD_FLAG_N		0x0040	/* 2-rows mode */
-#define LCD_FLAG_L		0x0080	/* backlight enabled */
-
-/* LCD commands */
-#define LCD_CMD_DISPLAY_CLEAR	0x01	/* Clear entire display */
-
-#define LCD_CMD_ENTRY_MODE	0x04	/* Set entry mode */
-#define LCD_CMD_CURSOR_INC	0x02	/* Increment cursor */
-
-#define LCD_CMD_DISPLAY_CTRL	0x08	/* Display control */
-#define LCD_CMD_DISPLAY_ON	0x04	/* Set display on */
-#define LCD_CMD_CURSOR_ON	0x02	/* Set cursor on */
-#define LCD_CMD_BLINK_ON	0x01	/* Set blink on */
-
-#define LCD_CMD_SHIFT		0x10	/* Shift cursor/display */
-#define LCD_CMD_DISPLAY_SHIFT	0x08	/* Shift display instead of cursor */
-#define LCD_CMD_SHIFT_RIGHT	0x04	/* Shift display/cursor to the right */
-
-#define LCD_CMD_FUNCTION_SET	0x20	/* Set function */
-#define LCD_CMD_DATA_LEN_8BITS	0x10	/* Set data length to 8 bits */
-#define LCD_CMD_TWO_LINES	0x08	/* Set to two display lines */
-#define LCD_CMD_FONT_5X10_DOTS	0x04	/* Set char font to 5x10 dots */
-
-#define LCD_CMD_SET_CGRAM_ADDR	0x40	/* Set char generator RAM address */
-
-#define LCD_CMD_SET_DDRAM_ADDR	0x80	/* Set display data RAM address */
-
-#define LCD_ESCAPE_LEN		24	/* max chars for LCD escape command */
-#define LCD_ESCAPE_CHAR	27	/* use char 27 for escape command */
-
 #define NOT_SET			-1
 
 /* macros to simplify use of the parallel port */
@@ -245,19 +206,10 @@ static wait_queue_head_t keypad_read_wait;
 static struct {
 	bool enabled;
 	bool initialized;
-	bool must_clear;
 
-	int height;
-	int width;
-	int bwidth;
-	int hwidth;
 	int charset;
 	int proto;
 
-	struct delayed_work bl_work;
-	struct mutex bl_tempo_lock;	/* Protects access to bl_tempo */
-	bool bl_tempo;
-
 	/* TODO: use union here? */
 	struct {
 		int e;
@@ -268,20 +220,7 @@ static struct {
 		int bl;
 	} pins;
 
-	/* contains the LCD config state */
-	unsigned long int flags;
-
-	/* Contains the LCD X and Y offset */
-	struct {
-		unsigned long int x;
-		unsigned long int y;
-	} addr;
-
-	/* Current escape sequence and it's length or -1 if outside */
-	struct {
-		char buf[LCD_ESCAPE_LEN + 1];
-		int len;
-	} esc_seq;
+	struct charlcd *charlcd;
 } lcd;
 
 /* Needed only for init */
@@ -464,17 +403,12 @@ static unsigned char lcd_bits[LCD_PORTS][LCD_BITS][BIT_STATES];
 /* global variables */
 
 /* Device single-open policy control */
-static atomic_t lcd_available = ATOMIC_INIT(1);
 static atomic_t keypad_available = ATOMIC_INIT(1);
 
 static struct pardevice *pprt;
 
 static int keypad_initialized;
 
-static void (*lcd_write_cmd)(int);
-static void (*lcd_write_data)(int);
-static void (*lcd_clear_fast)(void);
-
 static DEFINE_SPINLOCK(pprt_lock);
 static struct timer_list scan_timer;
 
@@ -574,8 +508,6 @@ static int keypad_enabled = NOT_SET;
 module_param(keypad_enabled, int, 0000);
 MODULE_PARM_DESC(keypad_enabled, "Deprecated option, use keypad_type instead");
 
-static const unsigned char *lcd_char_conv;
-
 /* for some LCD drivers (ks0074) we need a charset conversion table. */
 static const unsigned char lcd_char_conv_ks0074[256] = {
 	/*          0|8   1|9   2|A   3|B   4|C   5|D   6|E   7|F */
@@ -752,15 +684,6 @@ static void pin_to_bits(int pin, unsigned char *d_val, unsigned char *c_val)
 	}
 }
 
-/* sleeps that many milliseconds with a reschedule */
-static void long_sleep(int ms)
-{
-	if (in_interrupt())
-		mdelay(ms);
-	else
-		schedule_timeout_interruptible(msecs_to_jiffies(ms));
-}
-
 /*
  * send a serial byte to the LCD panel. The caller is responsible for locking
  * if needed.
@@ -792,8 +715,11 @@ static void lcd_send_serial(int byte)
 }
 
 /* turn the backlight on or off */
-static void __lcd_backlight(int on)
+static void lcd_backlight(struct charlcd *charlcd, int on)
 {
+	if (lcd.pins.bl == PIN_NONE)
+		return;
+
 	/* The backlight is activated by setting the AUTOFEED line to +5V  */
 	spin_lock_irq(&pprt_lock);
 	if (on)
@@ -804,46 +730,8 @@ static void __lcd_backlight(int on)
 	spin_unlock_irq(&pprt_lock);
 }
 
-static void lcd_backlight(int on)
-{
-	if (lcd.pins.bl == PIN_NONE)
-		return;
-
-	mutex_lock(&lcd.bl_tempo_lock);
-	if (!lcd.bl_tempo)
-		__lcd_backlight(on);
-	mutex_unlock(&lcd.bl_tempo_lock);
-}
-
-static void lcd_bl_off(struct work_struct *work)
-{
-	mutex_lock(&lcd.bl_tempo_lock);
-	if (lcd.bl_tempo) {
-		lcd.bl_tempo = false;
-		if (!(lcd.flags & LCD_FLAG_L))
-			__lcd_backlight(0);
-	}
-	mutex_unlock(&lcd.bl_tempo_lock);
-}
-
-/* turn the backlight on for a little while */
-static void lcd_poke(void)
-{
-	if (lcd.pins.bl == PIN_NONE)
-		return;
-
-	cancel_delayed_work_sync(&lcd.bl_work);
-
-	mutex_lock(&lcd.bl_tempo_lock);
-	if (!lcd.bl_tempo && !(lcd.flags & LCD_FLAG_L))
-		__lcd_backlight(1);
-	lcd.bl_tempo = true;
-	schedule_delayed_work(&lcd.bl_work, FLASH_LIGHT_TEMPO * HZ);
-	mutex_unlock(&lcd.bl_tempo_lock);
-}
-
 /* send a command to the LCD panel in serial mode */
-static void lcd_write_cmd_s(int cmd)
+static void lcd_write_cmd_s(struct charlcd *charlcd, int cmd)
 {
 	spin_lock_irq(&pprt_lock);
 	lcd_send_serial(0x1F);	/* R/W=W, RS=0 */
@@ -854,7 +742,7 @@ static void lcd_write_cmd_s(int cmd)
 }
 
 /* send data to the LCD panel in serial mode */
-static void lcd_write_data_s(int data)
+static void lcd_write_data_s(struct charlcd *charlcd, int data)
 {
 	spin_lock_irq(&pprt_lock);
 	lcd_send_serial(0x5F);	/* R/W=W, RS=1 */
@@ -865,7 +753,7 @@ static void lcd_write_data_s(int data)
 }
 
 /* send a command to the LCD panel in 8 bits parallel mode */
-static void lcd_write_cmd_p8(int cmd)
+static void lcd_write_cmd_p8(struct charlcd *charlcd, int cmd)
 {
 	spin_lock_irq(&pprt_lock);
 	/* present the data to the data port */
@@ -887,7 +775,7 @@ static void lcd_write_cmd_p8(int cmd)
 }
 
 /* send data to the LCD panel in 8 bits parallel mode */
-static void lcd_write_data_p8(int data)
+static void lcd_write_data_p8(struct charlcd *charlcd, int data)
 {
 	spin_lock_irq(&pprt_lock);
 	/* present the data to the data port */
@@ -909,7 +797,7 @@ static void lcd_write_data_p8(int data)
 }
 
 /* send a command to the TI LCD panel */
-static void lcd_write_cmd_tilcd(int cmd)
+static void lcd_write_cmd_tilcd(struct charlcd *charlcd, int cmd)
 {
 	spin_lock_irq(&pprt_lock);
 	/* present the data to the control port */
@@ -919,7 +807,7 @@ static void lcd_write_cmd_tilcd(int cmd)
 }
 
 /* send data to the TI LCD panel */
-static void lcd_write_data_tilcd(int data)
+static void lcd_write_data_tilcd(struct charlcd *charlcd, int data)
 {
 	spin_lock_irq(&pprt_lock);
 	/* present the data to the data port */
@@ -928,47 +816,13 @@ static void lcd_write_data_tilcd(int data)
 	spin_unlock_irq(&pprt_lock);
 }
 
-static void lcd_gotoxy(void)
-{
-	lcd_write_cmd(LCD_CMD_SET_DDRAM_ADDR
-		      | (lcd.addr.y ? lcd.hwidth : 0)
-		      /*
-		       * we force the cursor to stay at the end of the
-		       * line if it wants to go farther
-		       */
-		      | ((lcd.addr.x < lcd.bwidth) ? lcd.addr.x &
-			 (lcd.hwidth - 1) : lcd.bwidth - 1));
-}
-
-static void lcd_home(void)
-{
-	lcd.addr.x = 0;
-	lcd.addr.y = 0;
-	lcd_gotoxy();
-}
-
-static void lcd_print(char c)
-{
-	if (lcd.addr.x < lcd.bwidth) {
-		if (lcd_char_conv)
-			c = lcd_char_conv[(unsigned char)c];
-		lcd_write_data(c);
-		lcd.addr.x++;
-	}
-	/* prevents the cursor from wrapping onto the next line */
-	if (lcd.addr.x == lcd.bwidth)
-		lcd_gotoxy();
-}
-
 /* fills the display with spaces and resets X/Y */
-static void lcd_clear_fast_s(void)
+static void lcd_clear_fast_s(struct charlcd *charlcd)
 {
 	int pos;
 
-	lcd_home();
-
 	spin_lock_irq(&pprt_lock);
-	for (pos = 0; pos < lcd.height * lcd.hwidth; pos++) {
+	for (pos = 0; pos < charlcd->height * charlcd->hwidth; pos++) {
 		lcd_send_serial(0x5F);	/* R/W=W, RS=1 */
 		lcd_send_serial(' ' & 0x0F);
 		lcd_send_serial((' ' >> 4) & 0x0F);
@@ -976,19 +830,15 @@ static void lcd_clear_fast_s(void)
 		udelay(40);
 	}
 	spin_unlock_irq(&pprt_lock);
-
-	lcd_home();
 }
 
 /* fills the display with spaces and resets X/Y */
-static void lcd_clear_fast_p8(void)
+static void lcd_clear_fast_p8(struct charlcd *charlcd)
 {
 	int pos;
 
-	lcd_home();
-
 	spin_lock_irq(&pprt_lock);
-	for (pos = 0; pos < lcd.height * lcd.hwidth; pos++) {
+	for (pos = 0; pos < charlcd->height * charlcd->hwidth; pos++) {
 		/* present the data to the data port */
 		w_dtr(pprt, ' ');
 
@@ -1010,488 +860,62 @@ static void lcd_clear_fast_p8(void)
 		udelay(45);
 	}
 	spin_unlock_irq(&pprt_lock);
-
-	lcd_home();
 }
 
 /* fills the display with spaces and resets X/Y */
-static void lcd_clear_fast_tilcd(void)
+static void lcd_clear_fast_tilcd(struct charlcd *charlcd)
 {
 	int pos;
 
-	lcd_home();
-
 	spin_lock_irq(&pprt_lock);
-	for (pos = 0; pos < lcd.height * lcd.hwidth; pos++) {
+	for (pos = 0; pos < charlcd->height * charlcd->hwidth; pos++) {
 		/* present the data to the data port */
 		w_dtr(pprt, ' ');
 		udelay(60);
 	}
 
 	spin_unlock_irq(&pprt_lock);
-
-	lcd_home();
-}
-
-/* clears the display and resets X/Y */
-static void lcd_clear_display(void)
-{
-	lcd_write_cmd(LCD_CMD_DISPLAY_CLEAR);
-	lcd.addr.x = 0;
-	lcd.addr.y = 0;
-	/* we must wait a few milliseconds (15) */
-	long_sleep(15);
 }
 
-static void lcd_init_display(void)
-{
-	lcd.flags = ((lcd.height > 1) ? LCD_FLAG_N : 0)
-	    | LCD_FLAG_D | LCD_FLAG_C | LCD_FLAG_B;
-
-	long_sleep(20);		/* wait 20 ms after power-up for the paranoid */
-
-	/* 8bits, 1 line, small fonts; let's do it 3 times */
-	lcd_write_cmd(LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS);
-	long_sleep(10);
-	lcd_write_cmd(LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS);
-	long_sleep(10);
-	lcd_write_cmd(LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS);
-	long_sleep(10);
-
-	/* set font height and lines number */
-	lcd_write_cmd(LCD_CMD_FUNCTION_SET | LCD_CMD_DATA_LEN_8BITS
-		      | ((lcd.flags & LCD_FLAG_F) ? LCD_CMD_FONT_5X10_DOTS : 0)
-		      | ((lcd.flags & LCD_FLAG_N) ? LCD_CMD_TWO_LINES : 0)
-	    );
-	long_sleep(10);
-
-	/* display off, cursor off, blink off */
-	lcd_write_cmd(LCD_CMD_DISPLAY_CTRL);
-	long_sleep(10);
-
-	lcd_write_cmd(LCD_CMD_DISPLAY_CTRL	/* set display mode */
-		      | ((lcd.flags & LCD_FLAG_D) ? LCD_CMD_DISPLAY_ON : 0)
-		      | ((lcd.flags & LCD_FLAG_C) ? LCD_CMD_CURSOR_ON : 0)
-		      | ((lcd.flags & LCD_FLAG_B) ? LCD_CMD_BLINK_ON : 0)
-	    );
-
-	lcd_backlight((lcd.flags & LCD_FLAG_L) ? 1 : 0);
-
-	long_sleep(10);
-
-	/* entry mode set : increment, cursor shifting */
-	lcd_write_cmd(LCD_CMD_ENTRY_MODE | LCD_CMD_CURSOR_INC);
+static struct charlcd_ops charlcd_serial_ops = {
+	.write_cmd	= lcd_write_cmd_s,
+	.write_data	= lcd_write_data_s,
+	.clear_fast	= lcd_clear_fast_s,
+	.backlight	= lcd_backlight,
+};
 
-	lcd_clear_display();
-}
+static struct charlcd_ops charlcd_parallel_ops = {
+	.write_cmd	= lcd_write_cmd_p8,
+	.write_data	= lcd_write_data_p8,
+	.clear_fast	= lcd_clear_fast_p8,
+	.backlight	= lcd_backlight,
+};
 
-/*
- * These are the file operation function for user access to /dev/lcd
- * This function can also be called from inside the kernel, by
- * setting file and ppos to NULL.
- *
- */
+static struct charlcd_ops charlcd_tilcd_ops = {
+	.write_cmd	= lcd_write_cmd_tilcd,
+	.write_data	= lcd_write_data_tilcd,
+	.clear_fast	= lcd_clear_fast_tilcd,
+	.backlight	= lcd_backlight,
+};
 
-static inline int handle_lcd_special_code(void)
+/* initialize the LCD driver */
+static void lcd_init(void)
 {
-	/* LCD special codes */
-
-	int processed = 0;
+	struct charlcd *charlcd;
 
-	char *esc = lcd.esc_seq.buf + 2;
-	int oldflags = lcd.flags;
-
-	/* check for display mode flags */
-	switch (*esc) {
-	case 'D':	/* Display ON */
-		lcd.flags |= LCD_FLAG_D;
-		processed = 1;
-		break;
-	case 'd':	/* Display OFF */
-		lcd.flags &= ~LCD_FLAG_D;
-		processed = 1;
-		break;
-	case 'C':	/* Cursor ON */
-		lcd.flags |= LCD_FLAG_C;
-		processed = 1;
-		break;
-	case 'c':	/* Cursor OFF */
-		lcd.flags &= ~LCD_FLAG_C;
-		processed = 1;
-		break;
-	case 'B':	/* Blink ON */
-		lcd.flags |= LCD_FLAG_B;
-		processed = 1;
-		break;
-	case 'b':	/* Blink OFF */
-		lcd.flags &= ~LCD_FLAG_B;
-		processed = 1;
-		break;
-	case '+':	/* Back light ON */
-		lcd.flags |= LCD_FLAG_L;
-		processed = 1;
-		break;
-	case '-':	/* Back light OFF */
-		lcd.flags &= ~LCD_FLAG_L;
-		processed = 1;
-		break;
-	case '*':
-		/* flash back light */
-		lcd_poke();
-		processed = 1;
-		break;
-	case 'f':	/* Small Font */
-		lcd.flags &= ~LCD_FLAG_F;
-		processed = 1;
-		break;
-	case 'F':	/* Large Font */
-		lcd.flags |= LCD_FLAG_F;
-		processed = 1;
-		break;
-	case 'n':	/* One Line */
-		lcd.flags &= ~LCD_FLAG_N;
-		processed = 1;
-		break;
-	case 'N':	/* Two Lines */
-		lcd.flags |= LCD_FLAG_N;
-		break;
-	case 'l':	/* Shift Cursor Left */
-		if (lcd.addr.x > 0) {
-			/* back one char if not at end of line */
-			if (lcd.addr.x < lcd.bwidth)
-				lcd_write_cmd(LCD_CMD_SHIFT);
-			lcd.addr.x--;
-		}
-		processed = 1;
-		break;
-	case 'r':	/* shift cursor right */
-		if (lcd.addr.x < lcd.width) {
-			/* allow the cursor to pass the end of the line */
-			if (lcd.addr.x < (lcd.bwidth - 1))
-				lcd_write_cmd(LCD_CMD_SHIFT |
-						LCD_CMD_SHIFT_RIGHT);
-			lcd.addr.x++;
-		}
-		processed = 1;
-		break;
-	case 'L':	/* shift display left */
-		lcd_write_cmd(LCD_CMD_SHIFT | LCD_CMD_DISPLAY_SHIFT);
-		processed = 1;
-		break;
-	case 'R':	/* shift display right */
-		lcd_write_cmd(LCD_CMD_SHIFT | LCD_CMD_DISPLAY_SHIFT |
-				LCD_CMD_SHIFT_RIGHT);
-		processed = 1;
-		break;
-	case 'k': {	/* kill end of line */
-		int x;
-
-		for (x = lcd.addr.x; x < lcd.bwidth; x++)
-			lcd_write_data(' ');
-
-		/* restore cursor position */
-		lcd_gotoxy();
-		processed = 1;
-		break;
-	}
-	case 'I':	/* reinitialize display */
-		lcd_init_display();
-		processed = 1;
-		break;
-	case 'G': {
-		/* Generator : LGcxxxxx...xx; must have <c> between '0'
-		 * and '7', representing the numerical ASCII code of the
-		 * redefined character, and <xx...xx> a sequence of 16
-		 * hex digits representing 8 bytes for each character.
-		 * Most LCDs will only use 5 lower bits of the 7 first
-		 * bytes.
-		 */
-
-		unsigned char cgbytes[8];
-		unsigned char cgaddr;
-		int cgoffset;
-		int shift;
-		char value;
-		int addr;
-
-		if (!strchr(esc, ';'))
-			break;
-
-		esc++;
-
-		cgaddr = *(esc++) - '0';
-		if (cgaddr > 7) {
-			processed = 1;
-			break;
-		}
-
-		cgoffset = 0;
-		shift = 0;
-		value = 0;
-		while (*esc && cgoffset < 8) {
-			shift ^= 4;
-			if (*esc >= '0' && *esc <= '9') {
-				value |= (*esc - '0') << shift;
-			} else if (*esc >= 'A' && *esc <= 'Z') {
-				value |= (*esc - 'A' + 10) << shift;
-			} else if (*esc >= 'a' && *esc <= 'z') {
-				value |= (*esc - 'a' + 10) << shift;
-			} else {
-				esc++;
-				continue;
-			}
-
-			if (shift == 0) {
-				cgbytes[cgoffset++] = value;
-				value = 0;
-			}
-
-			esc++;
-		}
-
-		lcd_write_cmd(LCD_CMD_SET_CGRAM_ADDR | (cgaddr * 8));
-		for (addr = 0; addr < cgoffset; addr++)
-			lcd_write_data(cgbytes[addr]);
-
-		/* ensures that we stop writing to CGRAM */
-		lcd_gotoxy();
-		processed = 1;
-		break;
-	}
-	case 'x':	/* gotoxy : LxXXX[yYYY]; */
-	case 'y':	/* gotoxy : LyYYY[xXXX]; */
-		if (!strchr(esc, ';'))
-			break;
-
-		while (*esc) {
-			if (*esc == 'x') {
-				esc++;
-				if (kstrtoul(esc, 10, &lcd.addr.x) < 0)
-					break;
-			} else if (*esc == 'y') {
-				esc++;
-				if (kstrtoul(esc, 10, &lcd.addr.y) < 0)
-					break;
-			} else {
-				break;
-			}
-		}
-
-		lcd_gotoxy();
-		processed = 1;
-		break;
-	}
-
-	/* TODO: This indent party here got ugly, clean it! */
-	/* Check whether one flag was changed */
-	if (oldflags != lcd.flags) {
-		/* check whether one of B,C,D flags were changed */
-		if ((oldflags ^ lcd.flags) &
-		    (LCD_FLAG_B | LCD_FLAG_C | LCD_FLAG_D))
-			/* set display mode */
-			lcd_write_cmd(LCD_CMD_DISPLAY_CTRL
-				      | ((lcd.flags & LCD_FLAG_D)
-						      ? LCD_CMD_DISPLAY_ON : 0)
-				      | ((lcd.flags & LCD_FLAG_C)
-						      ? LCD_CMD_CURSOR_ON : 0)
-				      | ((lcd.flags & LCD_FLAG_B)
-						      ? LCD_CMD_BLINK_ON : 0));
-		/* check whether one of F,N flags was changed */
-		else if ((oldflags ^ lcd.flags) & (LCD_FLAG_F | LCD_FLAG_N))
-			lcd_write_cmd(LCD_CMD_FUNCTION_SET
-				      | LCD_CMD_DATA_LEN_8BITS
-				      | ((lcd.flags & LCD_FLAG_F)
-						      ? LCD_CMD_FONT_5X10_DOTS
-								      : 0)
-				      | ((lcd.flags & LCD_FLAG_N)
-						      ? LCD_CMD_TWO_LINES
-								      : 0));
-		/* check whether L flag was changed */
-		else if ((oldflags ^ lcd.flags) & (LCD_FLAG_L))
-			lcd_backlight(!!(lcd.flags & LCD_FLAG_L));
-	}
-
-	return processed;
-}
-
-static void lcd_write_char(char c)
-{
-	/* first, we'll test if we're in escape mode */
-	if ((c != '\n') && lcd.esc_seq.len >= 0) {
-		/* yes, let's add this char to the buffer */
-		lcd.esc_seq.buf[lcd.esc_seq.len++] = c;
-		lcd.esc_seq.buf[lcd.esc_seq.len] = 0;
-	} else {
-		/* aborts any previous escape sequence */
-		lcd.esc_seq.len = -1;
-
-		switch (c) {
-		case LCD_ESCAPE_CHAR:
-			/* start of an escape sequence */
-			lcd.esc_seq.len = 0;
-			lcd.esc_seq.buf[lcd.esc_seq.len] = 0;
-			break;
-		case '\b':
-			/* go back one char and clear it */
-			if (lcd.addr.x > 0) {
-				/*
-				 * check if we're not at the
-				 * end of the line
-				 */
-				if (lcd.addr.x < lcd.bwidth)
-					/* back one char */
-					lcd_write_cmd(LCD_CMD_SHIFT);
-				lcd.addr.x--;
-			}
-			/* replace with a space */
-			lcd_write_data(' ');
-			/* back one char again */
-			lcd_write_cmd(LCD_CMD_SHIFT);
-			break;
-		case '\014':
-			/* quickly clear the display */
-			lcd_clear_fast();
-			break;
-		case '\n':
-			/*
-			 * flush the remainder of the current line and
-			 * go to the beginning of the next line
-			 */
-			for (; lcd.addr.x < lcd.bwidth; lcd.addr.x++)
-				lcd_write_data(' ');
-			lcd.addr.x = 0;
-			lcd.addr.y = (lcd.addr.y + 1) % lcd.height;
-			lcd_gotoxy();
-			break;
-		case '\r':
-			/* go to the beginning of the same line */
-			lcd.addr.x = 0;
-			lcd_gotoxy();
-			break;
-		case '\t':
-			/* print a space instead of the tab */
-			lcd_print(' ');
-			break;
-		default:
-			/* simply print this char */
-			lcd_print(c);
-			break;
-		}
-	}
+	charlcd = charlcd_alloc(0);
+	if (!charlcd)
+		return;
 
 	/*
-	 * now we'll see if we're in an escape mode and if the current
-	 * escape sequence can be understood.
+	 * Init lcd struct with load-time values to preserve exact
+	 * current functionality (at least for now).
 	 */
-	if (lcd.esc_seq.len >= 2) {
-		int processed = 0;
-
-		if (!strcmp(lcd.esc_seq.buf, "[2J")) {
-			/* clear the display */
-			lcd_clear_fast();
-			processed = 1;
-		} else if (!strcmp(lcd.esc_seq.buf, "[H")) {
-			/* cursor to home */
-			lcd_home();
-			processed = 1;
-		}
-		/* codes starting with ^[[L */
-		else if ((lcd.esc_seq.len >= 3) &&
-			 (lcd.esc_seq.buf[0] == '[') &&
-			 (lcd.esc_seq.buf[1] == 'L')) {
-			processed = handle_lcd_special_code();
-		}
-
-		/* LCD special escape codes */
-		/*
-		 * flush the escape sequence if it's been processed
-		 * or if it is getting too long.
-		 */
-		if (processed || (lcd.esc_seq.len >= LCD_ESCAPE_LEN))
-			lcd.esc_seq.len = -1;
-	} /* escape codes */
-}
+	charlcd->height = lcd_height;
+	charlcd->width = lcd_width;
+	charlcd->bwidth = lcd_bwidth;
+	charlcd->hwidth = lcd_hwidth;
 
-static ssize_t lcd_write(struct file *file,
-			 const char __user *buf, size_t count, loff_t *ppos)
-{
-	const char __user *tmp = buf;
-	char c;
-
-	for (; count-- > 0; (*ppos)++, tmp++) {
-		if (!in_interrupt() && (((count + 1) & 0x1f) == 0))
-			/*
-			 * let's be a little nice with other processes
-			 * that need some CPU
-			 */
-			schedule();
-
-		if (get_user(c, tmp))
-			return -EFAULT;
-
-		lcd_write_char(c);
-	}
-
-	return tmp - buf;
-}
-
-static int lcd_open(struct inode *inode, struct file *file)
-{
-	if (!atomic_dec_and_test(&lcd_available))
-		return -EBUSY;	/* open only once at a time */
-
-	if (file->f_mode & FMODE_READ)	/* device is write-only */
-		return -EPERM;
-
-	if (lcd.must_clear) {
-		lcd_clear_display();
-		lcd.must_clear = false;
-	}
-	return nonseekable_open(inode, file);
-}
-
-static int lcd_release(struct inode *inode, struct file *file)
-{
-	atomic_inc(&lcd_available);
-	return 0;
-}
-
-static const struct file_operations lcd_fops = {
-	.write   = lcd_write,
-	.open    = lcd_open,
-	.release = lcd_release,
-	.llseek  = no_llseek,
-};
-
-static struct miscdevice lcd_dev = {
-	.minor	= LCD_MINOR,
-	.name	= "lcd",
-	.fops	= &lcd_fops,
-};
-
-/* public function usable from the kernel for any purpose */
-static void panel_lcd_print(const char *s)
-{
-	const char *tmp = s;
-	int count = strlen(s);
-
-	if (lcd.enabled && lcd.initialized) {
-		for (; count-- > 0; tmp++) {
-			if (!in_interrupt() && (((count + 1) & 0x1f) == 0))
-				/*
-				 * let's be a little nice with other processes
-				 * that need some CPU
-				 */
-				schedule();
-
-			lcd_write_char(*tmp);
-		}
-	}
-}
-
-/* initialize the LCD driver */
-static void lcd_init(void)
-{
 	switch (selected_lcd_type) {
 	case LCD_TYPE_OLD:
 		/* parallel mode, 8 bits */
@@ -1500,10 +924,10 @@ static void lcd_init(void)
 		lcd.pins.e = PIN_STROBE;
 		lcd.pins.rs = PIN_AUTOLF;
 
-		lcd.width = 40;
-		lcd.bwidth = 40;
-		lcd.hwidth = 64;
-		lcd.height = 2;
+		charlcd->width = 40;
+		charlcd->bwidth = 40;
+		charlcd->hwidth = 64;
+		charlcd->height = 2;
 		break;
 	case LCD_TYPE_KS0074:
 		/* serial mode, ks0074 */
@@ -1513,10 +937,10 @@ static void lcd_init(void)
 		lcd.pins.cl = PIN_STROBE;
 		lcd.pins.da = PIN_D0;
 
-		lcd.width = 16;
-		lcd.bwidth = 40;
-		lcd.hwidth = 16;
-		lcd.height = 2;
+		charlcd->width = 16;
+		charlcd->bwidth = 40;
+		charlcd->hwidth = 16;
+		charlcd->height = 2;
 		break;
 	case LCD_TYPE_NEXCOM:
 		/* parallel mode, 8 bits, generic */
@@ -1526,10 +950,10 @@ static void lcd_init(void)
 		lcd.pins.rs = PIN_SELECP;
 		lcd.pins.rw = PIN_INITP;
 
-		lcd.width = 16;
-		lcd.bwidth = 40;
-		lcd.hwidth = 64;
-		lcd.height = 2;
+		charlcd->width = 16;
+		charlcd->bwidth = 40;
+		charlcd->hwidth = 64;
+		charlcd->height = 2;
 		break;
 	case LCD_TYPE_CUSTOM:
 		/* customer-defined */
@@ -1545,22 +969,22 @@ static void lcd_init(void)
 		lcd.pins.e = PIN_STROBE;
 		lcd.pins.rs = PIN_SELECP;
 
-		lcd.width = 16;
-		lcd.bwidth = 40;
-		lcd.hwidth = 64;
-		lcd.height = 2;
+		charlcd->width = 16;
+		charlcd->bwidth = 40;
+		charlcd->hwidth = 64;
+		charlcd->height = 2;
 		break;
 	}
 
 	/* Overwrite with module params set on loading */
 	if (lcd_height != NOT_SET)
-		lcd.height = lcd_height;
+		charlcd->height = lcd_height;
 	if (lcd_width != NOT_SET)
-		lcd.width = lcd_width;
+		charlcd->width = lcd_width;
 	if (lcd_bwidth != NOT_SET)
-		lcd.bwidth = lcd_bwidth;
+		charlcd->bwidth = lcd_bwidth;
 	if (lcd_hwidth != NOT_SET)
-		lcd.hwidth = lcd_hwidth;
+		charlcd->hwidth = lcd_hwidth;
 	if (lcd_charset != NOT_SET)
 		lcd.charset = lcd_charset;
 	if (lcd_proto != NOT_SET)
@@ -1579,19 +1003,17 @@ static void lcd_init(void)
 		lcd.pins.bl = lcd_bl_pin;
 
 	/* this is used to catch wrong and default values */
-	if (lcd.width <= 0)
-		lcd.width = DEFAULT_LCD_WIDTH;
-	if (lcd.bwidth <= 0)
-		lcd.bwidth = DEFAULT_LCD_BWIDTH;
-	if (lcd.hwidth <= 0)
-		lcd.hwidth = DEFAULT_LCD_HWIDTH;
-	if (lcd.height <= 0)
-		lcd.height = DEFAULT_LCD_HEIGHT;
+	if (charlcd->width <= 0)
+		charlcd->width = DEFAULT_LCD_WIDTH;
+	if (charlcd->bwidth <= 0)
+		charlcd->bwidth = DEFAULT_LCD_BWIDTH;
+	if (charlcd->hwidth <= 0)
+		charlcd->hwidth = DEFAULT_LCD_HWIDTH;
+	if (charlcd->height <= 0)
+		charlcd->height = DEFAULT_LCD_HEIGHT;
 
 	if (lcd.proto == LCD_PROTO_SERIAL) {	/* SERIAL */
-		lcd_write_cmd = lcd_write_cmd_s;
-		lcd_write_data = lcd_write_data_s;
-		lcd_clear_fast = lcd_clear_fast_s;
+		charlcd->ops = &charlcd_serial_ops;
 
 		if (lcd.pins.cl == PIN_NOT_SET)
 			lcd.pins.cl = DEFAULT_LCD_PIN_SCL;
@@ -1599,9 +1021,7 @@ static void lcd_init(void)
 			lcd.pins.da = DEFAULT_LCD_PIN_SDA;
 
 	} else if (lcd.proto == LCD_PROTO_PARALLEL) {	/* PARALLEL */
-		lcd_write_cmd = lcd_write_cmd_p8;
-		lcd_write_data = lcd_write_data_p8;
-		lcd_clear_fast = lcd_clear_fast_p8;
+		charlcd->ops = &charlcd_parallel_ops;
 
 		if (lcd.pins.e == PIN_NOT_SET)
 			lcd.pins.e = DEFAULT_LCD_PIN_E;
@@ -1610,9 +1030,7 @@ static void lcd_init(void)
 		if (lcd.pins.rw == PIN_NOT_SET)
 			lcd.pins.rw = DEFAULT_LCD_PIN_RW;
 	} else {
-		lcd_write_cmd = lcd_write_cmd_tilcd;
-		lcd_write_data = lcd_write_data_tilcd;
-		lcd_clear_fast = lcd_clear_fast_tilcd;
+		charlcd->ops = &charlcd_tilcd_ops;
 	}
 
 	if (lcd.pins.bl == PIN_NOT_SET)
@@ -1635,14 +1053,9 @@ static void lcd_init(void)
 		lcd.charset = DEFAULT_LCD_CHARSET;
 
 	if (lcd.charset == LCD_CHARSET_KS0074)
-		lcd_char_conv = lcd_char_conv_ks0074;
+		charlcd->char_conv = lcd_char_conv_ks0074;
 	else
-		lcd_char_conv = NULL;
-
-	if (lcd.pins.bl != PIN_NONE) {
-		mutex_init(&lcd.bl_tempo_lock);
-		INIT_DELAYED_WORK(&lcd.bl_work, lcd_bl_off);
-	}
+		charlcd->char_conv = NULL;
 
 	pin_to_bits(lcd.pins.e, lcd_bits[LCD_PORT_D][LCD_BIT_E],
 		    lcd_bits[LCD_PORT_C][LCD_BIT_E]);
@@ -1657,25 +1070,8 @@ static void lcd_init(void)
 	pin_to_bits(lcd.pins.da, lcd_bits[LCD_PORT_D][LCD_BIT_DA],
 		    lcd_bits[LCD_PORT_C][LCD_BIT_DA]);
 
-	/*
-	 * before this line, we must NOT send anything to the display.
-	 * Since lcd_init_display() needs to write data, we have to
-	 * enable mark the LCD initialized just before.
-	 */
+	lcd.charlcd = charlcd;
 	lcd.initialized = true;
-	lcd_init_display();
-
-	/* display a short message */
-#ifdef CONFIG_PANEL_CHANGE_MESSAGE
-#ifdef CONFIG_PANEL_BOOT_MESSAGE
-	panel_lcd_print("\x1b[Lc\x1b[Lb\x1b[L*" CONFIG_PANEL_BOOT_MESSAGE);
-#endif
-#else
-	panel_lcd_print("\x1b[Lc\x1b[Lb\x1b[L*Linux-" UTS_RELEASE);
-#endif
-	/* clear the display on the next device opening */
-	lcd.must_clear = true;
-	lcd_home();
 }
 
 /*
@@ -2011,7 +1407,7 @@ static void panel_scan_timer(void)
 	}
 
 	if (keypressed && lcd.enabled && lcd.initialized)
-		lcd_poke();
+		charlcd_poke(lcd.charlcd);
 
 	mod_timer(&scan_timer, jiffies + INPUT_POLL_TIME);
 }
@@ -2175,35 +1571,6 @@ static void keypad_init(void)
 /* device initialization                          */
 /**************************************************/
 
-static int panel_notify_sys(struct notifier_block *this, unsigned long code,
-			    void *unused)
-{
-	if (lcd.enabled && lcd.initialized) {
-		switch (code) {
-		case SYS_DOWN:
-			panel_lcd_print
-			    ("\x0cReloading\nSystem...\x1b[Lc\x1b[Lb\x1b[L+");
-			break;
-		case SYS_HALT:
-			panel_lcd_print
-			    ("\x0cSystem Halted.\x1b[Lc\x1b[Lb\x1b[L+");
-			break;
-		case SYS_POWER_OFF:
-			panel_lcd_print("\x0cPower off.\x1b[Lc\x1b[Lb\x1b[L+");
-			break;
-		default:
-			break;
-		}
-	}
-	return NOTIFY_DONE;
-}
-
-static struct notifier_block panel_notifier = {
-	panel_notify_sys,
-	NULL,
-	0
-};
-
 static void panel_attach(struct parport *port)
 {
 	struct pardev_cb panel_cb;
@@ -2239,7 +1606,7 @@ static void panel_attach(struct parport *port)
 	 */
 	if (lcd.enabled) {
 		lcd_init();
-		if (misc_register(&lcd_dev))
+		if (!lcd.charlcd || charlcd_register(lcd.charlcd))
 			goto err_unreg_device;
 	}
 
@@ -2248,13 +1615,14 @@ static void panel_attach(struct parport *port)
 		if (misc_register(&keypad_dev))
 			goto err_lcd_unreg;
 	}
-	register_reboot_notifier(&panel_notifier);
 	return;
 
 err_lcd_unreg:
 	if (lcd.enabled)
-		misc_deregister(&lcd_dev);
+		charlcd_unregister(lcd.charlcd);
 err_unreg_device:
+	kfree(lcd.charlcd);
+	lcd.charlcd = NULL;
 	parport_unregister_device(pprt);
 	pprt = NULL;
 }
@@ -2278,20 +1646,16 @@ static void panel_detach(struct parport *port)
 	}
 
 	if (lcd.enabled) {
-		panel_lcd_print("\x0cLCD driver unloaded.\x1b[Lc\x1b[Lb\x1b[L-");
-		misc_deregister(&lcd_dev);
-		if (lcd.pins.bl != PIN_NONE) {
-			cancel_delayed_work_sync(&lcd.bl_work);
-			__lcd_backlight(0);
-		}
+		charlcd_unregister(lcd.charlcd);
 		lcd.initialized = false;
+		kfree(lcd.charlcd);
+		lcd.charlcd = NULL;
 	}
 
 	/* TODO: free all input signals */
 	parport_release(pprt);
 	parport_unregister_device(pprt);
 	pprt = NULL;
-	unregister_reboot_notifier(&panel_notifier);
 }
 
 static struct parport_driver panel_driver = {
@@ -2369,10 +1733,6 @@ static int __init panel_init_module(void)
 		 * Init lcd struct with load-time values to preserve exact
 		 * current functionality (at least for now).
 		 */
-		lcd.height = lcd_height;
-		lcd.width = lcd_width;
-		lcd.bwidth = lcd_bwidth;
-		lcd.hwidth = lcd_hwidth;
 		lcd.charset = lcd_charset;
 		lcd.proto = lcd_proto;
 		lcd.pins.e = lcd_e_pin;
@@ -2381,9 +1741,6 @@ static int __init panel_init_module(void)
 		lcd.pins.cl = lcd_cl_pin;
 		lcd.pins.da = lcd_da_pin;
 		lcd.pins.bl = lcd_bl_pin;
-
-		/* Leave it for now, just in case */
-		lcd.esc_seq.len = -1;
 	}
 
 	switch (selected_keypad_type) {
diff --git a/include/misc/charlcd.h b/include/misc/charlcd.h
new file mode 100644
index 0000000000000000..c40047b673c9ea09
--- /dev/null
+++ b/include/misc/charlcd.h
@@ -0,0 +1,40 @@
+/*
+ * Character LCD driver for Linux
+ *
+ * Copyright (C) 2000-2008, Willy Tarreau <w@1wt.eu>
+ * Copyright (C) 2016-2017 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+struct charlcd {
+	const struct charlcd_ops *ops;
+	const unsigned char *char_conv;	/* Optional */
+
+	int height;
+	int width;
+	int bwidth;			/* Default set by charlcd_alloc() */
+	int hwidth;			/* Default set by charlcd_alloc() */
+
+	void *drvdata;			/* Set by charlcd_alloc() */
+};
+
+struct charlcd_ops {
+	/* Required */
+	void (*write_cmd)(struct charlcd *lcd, int cmd);
+	void (*write_data)(struct charlcd *lcd, int data);
+
+	/* Optional */
+	void (*clear_fast)(struct charlcd *lcd);
+	void (*backlight)(struct charlcd *lcd, int on);
+};
+
+struct charlcd *charlcd_alloc(unsigned int drvdata_size);
+
+int charlcd_register(struct charlcd *lcd);
+int charlcd_unregister(struct charlcd *lcd);
+
+void charlcd_poke(struct charlcd *lcd);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
