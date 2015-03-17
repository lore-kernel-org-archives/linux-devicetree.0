From: Alan Tull <atull@opensource.altera.com>
Subject: [PATCH 2/2] add newhaven lcd tty driver on i2c
Date: Tue, 17 Mar 2015 15:36:47 -0500
Message-ID: <1426624607-2832-3-git-send-email-atull@opensource.altera.com>
References: <1426624607-2832-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426624607-2832-1-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alan Tull <atull@opensource.altera.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Supports the Newhaven NHD=E2=80=900216K3Z=E2=80=90NSW=E2=80=90BBW 2x16 =
LCD module as i2c slave.
Devices will show up as /dev/ttyLCD0, etc.

 * Backspace is supported to the beginning of the current line.
    * i.e. printf '\b' > /dev/ttyLCD0

 * ESC [ 2 J
    * erase whole display and reset cursor to home.
    * i.e. printf '\e[2J' > /dev/ttyLCD0

 * ESC [ 2 K
    * erase current line and set cursor to beginning of line.
    * i.e. printf '\e[2K' > /dev/ttyLCD0

 * CR and LF are supported.

 * Vertical scroll when cursor is on bottom line and receive end of lin=
e.

Default brightness can be set from the device tree/plat data.

Brightness can be set from a sysfs file, for example:
 * echo 6 > /sys/devices/soc.0/ffc04000.i2c/i2c-0/0-0028/brightness

Signed-off-by: Alan Tull <atull@opensource.altera.com>
---
 drivers/tty/Kconfig                        |    5 +
 drivers/tty/Makefile                       |    1 +
 drivers/tty/newhaven_lcd.c                 |  733 ++++++++++++++++++++=
++++++++
 include/linux/platform_data/newhaven_lcd.h |   25 +
 4 files changed, 764 insertions(+)
 create mode 100644 drivers/tty/newhaven_lcd.c
 create mode 100644 include/linux/platform_data/newhaven_lcd.h

diff --git a/drivers/tty/Kconfig b/drivers/tty/Kconfig
index b24aa01..c392405 100644
--- a/drivers/tty/Kconfig
+++ b/drivers/tty/Kconfig
@@ -419,4 +419,9 @@ config DA_CONSOLE
 	help
 	  This enables a console on a Dash channel.
=20
+config NEWHAVEN_LCD
+       tristate "NEWHAVEN LCD"
+       help
+         Add support for a TTY device on a Newhaven I2C LCD device.
+
 endif # TTY
diff --git a/drivers/tty/Makefile b/drivers/tty/Makefile
index 58ad1c0..f6a3d56 100644
--- a/drivers/tty/Makefile
+++ b/drivers/tty/Makefile
@@ -29,5 +29,6 @@ obj-$(CONFIG_SYNCLINK)		+=3D synclink.o
 obj-$(CONFIG_PPC_EPAPR_HV_BYTECHAN) +=3D ehv_bytechan.o
 obj-$(CONFIG_GOLDFISH_TTY)	+=3D goldfish.o
 obj-$(CONFIG_DA_TTY)		+=3D metag_da.o
+obj-$(CONFIG_NEWHAVEN_LCD)	+=3D newhaven_lcd.o
=20
 obj-y +=3D ipwireless/
diff --git a/drivers/tty/newhaven_lcd.c b/drivers/tty/newhaven_lcd.c
new file mode 100644
index 0000000..d79ee47
--- /dev/null
+++ b/drivers/tty/newhaven_lcd.c
@@ -0,0 +1,733 @@
+/*
+ * TTY on a LCD connected to I2C
+ * Supports Newhaven NHD-0216K3Z-NSW-BBW Serial LCD Module
+ *
+ * Copyright (C) 2013-2015 Altera Corporation.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITH=
OUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licen=
se for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License a=
long with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_data/newhaven_lcd.h>
+#include <linux/slab.h>
+#include <linux/tty.h>
+
+#define DRV_NAME "lcd-comm"
+#define DEV_NAME "ttyLCD"
+#define MAX_NEWHAVEN_LCD_COUNT 256
+
+#define LCD_COMMAND             0xfe
+#define LCD_DISPLAY_ON          0x41
+#define LCD_DISPLAY_OFF         0x42
+#define LCD_SET_CURSOR          0x45
+#define LCD_BACKSPACE           0x4e
+#define LCD_CLEAR_SCREEN        0x51
+#define LCD_BRIGHTNESS          0x53
+#define LCD_CUSTOM_CHAR         0x54
+#define LCD_BYTES_PER_FONT      8
+#define LCD_BYTES_PER_FONT_CMD  (LCD_BYTES_PER_FONT + 3)
+
+#define LCD_BRIGHTNESS_MIN	1
+#define LCD_BRIGHTNESS_MAX	8
+
+#define ASCII_BS                0x08
+#define ASCII_LF                0x0a
+#define ASCII_CR                0x0d
+#define ASCII_ESC               0x1b
+#define ASCII_SPACE             0x20
+#define ASCII_BACKSLASH         0x5c
+#define ASCII_TILDE             0x7e
+
+/* Valid displayable character in LCD panel's font table */
+#define valid_font(x) (0x20 <=3D (x) && (x) <=3D 0x7f)
+
+/*
+ * The display module displays a right arrow instead of tilde for
+ * ascii 0x7e. Also, it displays a Japanese character instead of a
+ * backslash character for ascii 0x5c. Work around these by loading
+ * custom characters into the display module's cg ram.
+ */
+struct custom_font {
+	char font[LCD_BYTES_PER_FONT];
+	char ascii;
+};
+
+#define CUSTOM_BACKSLASH        0x00
+#define CUSTOM_TILDE            0x01
+
+struct custom_font custom_fonts[] =3D {
+	[CUSTOM_BACKSLASH] =3D {
+		{ 0x00, 0x10, 0x08, 0x04, 0x02, 0x01, 0x00, 0x00, },
+		ASCII_BACKSLASH,
+	},
+	[CUSTOM_TILDE] =3D {
+		{ 0x00, 0x00, 0x00, 0x08, 0x15, 0x02, 0x00, 0x00, },
+		ASCII_TILDE,
+	},
+};
+
+struct lcd {
+	struct device *dev;
+	struct i2c_client *client;
+	struct tty_port port;
+	unsigned int width;
+	unsigned int height;
+	unsigned int brightness;
+	char *buffer;
+	unsigned int top_line;
+	unsigned int cursor_line;
+	unsigned int cursor_col;
+	unsigned int index;
+	struct list_head next;
+};
+
+static LIST_HEAD(lcd_structs);
+static DEFINE_SPINLOCK(lcd_structs_lock);
+static DEFINE_IDA(lcd_ida);
+
+static struct lcd *lcd_get_by_index(int index)
+{
+	struct lcd *lcd_data;
+
+	spin_lock(&lcd_structs_lock);
+
+	list_for_each_entry(lcd_data, &lcd_structs, next) {
+		if (lcd_data->index =3D=3D index) {
+			tty_port_get(&lcd_data->port);
+			spin_unlock(&lcd_structs_lock);
+			return lcd_data;
+		}
+	}
+
+	spin_unlock(&lcd_structs_lock);
+	return NULL;
+}
+
+/*
+ * The Newhaven NHD-0216K3Z-NSW-BBW runs at max 100KHz I2C rate but al=
so
+ * requires some execution time between commands.  Execution time for =
each
+ * command is listed in the datasheet (100uSec to 4mSec).  Even adding
+ * sleeps between commands isn't sufficient for reliable operation.  R=
unning
+ * the I2C slower, such as at 50KHz is better.
+ */
+static void lcd_i2c_master_send(const struct i2c_client *client,
+				const char *buf, int count, int delay_ms)
+{
+	int ret;
+
+	ret =3D i2c_master_send(client, buf, count);
+	if (ret !=3D sizeof(buf))
+		dev_dbg(&client->dev, "i2c_master_send returns %d\n", ret);
+	if (delay_ms)
+		msleep(delay_ms);
+}
+
+static void lcd_cmd_no_params(struct lcd *lcd_data, char cmd, int dela=
y_ms)
+{
+	char buf[2] =3D {LCD_COMMAND, cmd};
+
+	lcd_i2c_master_send(lcd_data->client, buf, sizeof(buf), delay_ms);
+}
+
+static void lcd_cmd_one_param(struct lcd *lcd_data, char cmd, char par=
am,
+			      int delay_ms)
+{
+	char buf[3] =3D {LCD_COMMAND, cmd, param};
+
+	lcd_i2c_master_send(lcd_data->client, buf, sizeof(buf), delay_ms);
+}
+
+static void lcd_cmd_backlight_brightness(struct lcd *lcd_data)
+{
+	lcd_cmd_one_param(lcd_data, LCD_BRIGHTNESS, lcd_data->brightness, 1);
+}
+
+static void lcd_cmd_display_on(struct lcd *lcd_data)
+{
+	lcd_cmd_no_params(lcd_data, LCD_DISPLAY_ON, 1);
+}
+
+static void lcd_cmd_display_off(struct lcd *lcd_data)
+{
+	lcd_cmd_no_params(lcd_data, LCD_DISPLAY_OFF, 1);
+}
+
+static void lcd_cmd_clear_screen(struct lcd *lcd_data)
+{
+	lcd_cmd_no_params(lcd_data, LCD_CLEAR_SCREEN, 2);
+}
+
+static void lcd_cmd_backspace(struct lcd *lcd_data)
+{
+	lcd_cmd_no_params(lcd_data, LCD_BACKSPACE, 1);
+}
+
+/*
+ * Note that this has to happen early on or the LCD module will not
+ * process the command.
+ */
+static void lcd_load_custom_fonts(struct lcd *lcd_data)
+{
+	char buf[LCD_BYTES_PER_FONT_CMD];
+	int i;
+
+	for (i =3D 0; i < ARRAY_SIZE(custom_fonts); i++) {
+		buf[0] =3D LCD_COMMAND;
+		buf[1] =3D LCD_CUSTOM_CHAR;
+		buf[2] =3D i;
+		memcpy(buf + 3, &custom_fonts[i].font, LCD_BYTES_PER_FONT);
+		lcd_i2c_master_send(lcd_data->client, buf, sizeof(buf), 1);
+	}
+}
+
+/*
+ * Check to see if the ascii val is a character that we are printing
+ * using a custom font.  If so, return the index of the font.
+ */
+static char lcd_translate_printable_char(char val)
+{
+	int i;
+
+	for (i =3D 0; i < ARRAY_SIZE(custom_fonts); i++)
+		if (val =3D=3D custom_fonts[i].ascii)
+			return i;
+
+	return val;
+}
+
+/* From NHD-0216K3Z-NSW-BBY Display Module datasheet. */
+#define LCD_CURSOR_LINE_MULTIPLIER 0x40
+
+static void lcd_cmd_set_cursor(struct lcd *lcd_data, unsigned int line=
,
+			       unsigned int col)
+{
+	unsigned int cursor;
+
+	cursor =3D col + (LCD_CURSOR_LINE_MULTIPLIER * line);
+
+	lcd_cmd_one_param(lcd_data, LCD_SET_CURSOR, cursor, 1);
+}
+
+/*
+ * Map a line on the lcd display to a line on the buffer.
+ * Note that the top line on the display (line 0) may not be line 0 on=
 the
+ * buffer due to scrolling.
+ */
+static unsigned int lcd_line_to_buf_line(struct lcd *lcd_data,
+					 unsigned int line)
+{
+	unsigned int buf_line;
+
+	buf_line =3D line + lcd_data->top_line;
+
+	if (buf_line >=3D lcd_data->height)
+		buf_line -=3D lcd_data->height;
+
+	return buf_line;
+}
+
+/* Returns a pointer to the line, column position in the lcd buffer */
+static char *lcd_buf_pointer(struct lcd *lcd_data, unsigned int line,
+			     unsigned int col)
+{
+	unsigned int buf_line;
+	char *buf;
+
+	if ((lcd_data->cursor_line >=3D lcd_data->height) ||
+	    (lcd_data->cursor_col >=3D lcd_data->width))
+		return lcd_data->buffer;
+
+	buf_line =3D lcd_line_to_buf_line(lcd_data, line);
+
+	buf =3D lcd_data->buffer + (buf_line * lcd_data->width) + col;
+
+	return buf;
+}
+
+static void lcd_clear_buffer_line(struct lcd *lcd_data, unsigned int l=
ine)
+{
+	char *buf =3D lcd_buf_pointer(lcd_data, line, 0);
+
+	memset(buf, ASCII_SPACE, lcd_data->width);
+}
+
+static void lcd_clear_buffer(struct lcd *lcd_data)
+{
+	memset(lcd_data->buffer, ASCII_SPACE,
+	       lcd_data->width * lcd_data->height);
+	lcd_data->cursor_line =3D 0;
+	lcd_data->cursor_col =3D 0;
+	lcd_data->top_line =3D 0;
+}
+
+static void lcd_reprint_one_line(struct lcd *lcd_data, unsigned int li=
ne)
+{
+	char *buf =3D lcd_buf_pointer(lcd_data, line, 0);
+
+	lcd_cmd_set_cursor(lcd_data, line, 0);
+	lcd_i2c_master_send(lcd_data->client, buf, lcd_data->width, 1);
+}
+
+static void lcd_print_top_n_lines(struct lcd *lcd_data, unsigned int l=
ines)
+{
+	unsigned int disp_line =3D 0;
+
+	while (disp_line < lines)
+		lcd_reprint_one_line(lcd_data, disp_line++);
+}
+
+static void lcd_add_char_at_cursor(struct lcd *lcd_data, char val)
+{
+	char *buf;
+
+	buf =3D lcd_buf_pointer(lcd_data, lcd_data->cursor_line,
+			      lcd_data->cursor_col);
+	*buf =3D val;
+	if (lcd_data->cursor_col < (lcd_data->width - 1))
+		lcd_data->cursor_col++;
+}
+
+static void lcd_crlf(struct lcd *lcd_data)
+{
+	if (lcd_data->cursor_line < (lcd_data->height - 1)) {
+		/* Next line is blank, carriage return to beginning of line. */
+		lcd_data->cursor_line++;
+		if (lcd_data->cursor_line >=3D lcd_data->height)
+			lcd_data->cursor_line =3D 0;
+	} else {
+		/* Display is full.  Scroll up one line. */
+		lcd_data->top_line++;
+		if (lcd_data->top_line >=3D lcd_data->height)
+			lcd_data->top_line =3D 0;
+
+		lcd_cmd_clear_screen(lcd_data);
+		lcd_clear_buffer_line(lcd_data, lcd_data->cursor_line);
+		lcd_print_top_n_lines(lcd_data, lcd_data->height);
+	}
+
+	lcd_cmd_set_cursor(lcd_data, lcd_data->height - 1, 0);
+	lcd_data->cursor_col =3D 0;
+}
+
+static void lcd_backspace(struct lcd *lcd_data)
+{
+	if (lcd_data->cursor_col > 0) {
+		lcd_cmd_backspace(lcd_data);
+		lcd_data->cursor_col--;
+	}
+}
+
+static void lcd_clear_screen(struct lcd *lcd_data)
+{
+	lcd_clear_buffer(lcd_data);
+	lcd_cmd_clear_screen(lcd_data);
+}
+
+static void lcd_clear_line(struct lcd *lcd_data, unsigned int cursor_l=
ine)
+{
+	lcd_clear_buffer_line(lcd_data, cursor_line);
+	lcd_reprint_one_line(lcd_data, cursor_line);
+	lcd_cmd_set_cursor(lcd_data, cursor_line, 0);
+	lcd_data->cursor_col =3D 0;
+}
+
+static int lcd_write(struct tty_struct *tty, const unsigned char *buf,
+		     int count)
+{
+	struct lcd *lcd_data =3D tty->driver_data;
+	int buf_i =3D 0, left;
+	char val;
+
+	if (!lcd_data)
+		return -ENODEV;
+
+	while (buf_i < count) {
+		left =3D count - buf_i;
+
+		/* process displayable chars */
+		if (valid_font(buf[buf_i])) {
+			while ((buf_i < count) && valid_font(buf[buf_i])) {
+				val =3D lcd_translate_printable_char(buf[buf_i]);
+				lcd_add_char_at_cursor(lcd_data, val);
+				buf_i++;
+			}
+
+			/* send the line to the display when we get to eol */
+			lcd_reprint_one_line(lcd_data, lcd_data->cursor_line);
+
+		/*
+		 * ECMA-48 CSI sequences (from console_codes man page):
+		 *  ESC [ 2 J : erase whole display.
+		 *  ESC [ 2 K : erase whole line.
+		 */
+		} else if (buf[buf_i] =3D=3D ASCII_ESC) {
+			if ((left >=3D 4) &&
+			    (!strncmp(&buf[buf_i + 1], "[2J", 3))) {
+				lcd_clear_screen(lcd_data);
+				buf_i +=3D 4;
+			} else if ((left >=3D 4) &&
+				   (!strncmp(&buf[buf_i + 1], "[2K", 3))) {
+				lcd_clear_line(lcd_data, lcd_data->cursor_line);
+				buf_i +=3D 4;
+			} else {
+				dev_dbg(lcd_data->dev,
+					"Unsupported escape sequence\n");
+				buf_i++;
+			}
+
+		} else if ((left >=3D 2) &&
+			(buf[buf_i] =3D=3D ASCII_CR) &&
+			 (buf[buf_i + 1] =3D=3D ASCII_LF)) {
+			lcd_crlf(lcd_data);
+			buf_i +=3D 2;
+
+		} else if ((left >=3D 1) && (buf[buf_i] =3D=3D ASCII_CR)) {
+			lcd_crlf(lcd_data);
+			buf_i++;
+
+		} else if ((left >=3D 1) && (buf[buf_i] =3D=3D ASCII_LF)) {
+			lcd_crlf(lcd_data);
+			buf_i++;
+
+		} else if ((left >=3D 1) && (buf[buf_i] =3D=3D ASCII_BS)) {
+			lcd_backspace(lcd_data);
+			buf_i++;
+
+		} else {
+			dev_dbg(lcd_data->dev, "Unsupported command 0x%02x\n",
+				buf[buf_i]);
+			buf_i++;
+		}
+	}
+
+	return count;
+}
+
+static ssize_t brightness_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct lcd *lcd_data =3D dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", lcd_data->brightness);
+}
+
+static ssize_t brightness_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct lcd *lcd_data =3D dev_get_drvdata(dev);
+	unsigned int brightness;
+	int ret;
+
+	ret =3D kstrtouint(buf, 10, &brightness);
+	if (ret)
+		return ret;
+
+	if ((brightness < LCD_BRIGHTNESS_MIN) ||
+	    (brightness > LCD_BRIGHTNESS_MAX)) {
+		dev_err(lcd_data->dev, "out of range (%d to %d)\n",
+			LCD_BRIGHTNESS_MIN, LCD_BRIGHTNESS_MAX);
+		return -EINVAL;
+	}
+
+	lcd_data->brightness =3D brightness;
+	lcd_cmd_backlight_brightness(lcd_data);
+
+	return count;
+}
+static DEVICE_ATTR(brightness, S_IRUGO | S_IWUSR,
+		   brightness_show, brightness_store);
+
+static struct attribute *lcd_attrs[] =3D {
+	&dev_attr_brightness.attr,
+	NULL,
+};
+
+static struct attribute_group lcd_attr_group =3D {
+	.attrs =3D lcd_attrs,
+};
+
+static int lcd_install(struct tty_driver *driver, struct tty_struct *t=
ty)
+{
+	struct lcd *lcd_data;
+	int ret;
+
+	lcd_data =3D lcd_get_by_index(tty->index);
+	if (!lcd_data)
+		return -ENODEV;
+
+	tty->driver_data =3D lcd_data;
+
+	ret =3D tty_port_install(&lcd_data->port, driver, tty);
+	if (ret)
+		tty_port_put(&lcd_data->port);
+
+	return ret;
+}
+
+static int lcd_open(struct tty_struct *tty, struct file *filp)
+{
+	struct lcd *lcd_data =3D tty->driver_data;
+	unsigned long flags;
+
+	tty->driver_data =3D lcd_data;
+	spin_lock_irqsave(&lcd_data->port.lock, flags);
+	lcd_data->port.count++;
+	spin_unlock_irqrestore(&lcd_data->port.lock, flags);
+	tty_port_tty_set(&lcd_data->port, tty);
+
+	return 0;
+}
+
+static void lcd_close(struct tty_struct *tty, struct file *filp)
+{
+	struct lcd *lcd_data =3D tty->driver_data;
+	unsigned long flags;
+	bool last;
+
+	spin_lock_irqsave(&lcd_data->port.lock, flags);
+	--lcd_data->port.count;
+	last =3D (lcd_data->port.count =3D=3D 0);
+	spin_unlock_irqrestore(&lcd_data->port.lock, flags);
+	if (last)
+		tty_port_tty_set(&lcd_data->port, NULL);
+}
+
+static int lcd_write_room(struct tty_struct *tty)
+{
+	struct lcd *lcd_data =3D tty->driver_data;
+
+	return lcd_data->height * lcd_data->width;
+}
+
+static const struct tty_operations lcd_ops =3D {
+	.install         =3D lcd_install,
+	.open            =3D lcd_open,
+	.close           =3D lcd_close,
+	.write           =3D lcd_write,
+	.write_room      =3D lcd_write_room,
+};
+
+#ifdef CONFIG_OF
+static struct newhaven_lcd_pdata *lcd_parse_dt(struct device *dev)
+{
+	struct device_node *np =3D dev->of_node;
+	unsigned int width, height, brightness;
+	struct newhaven_lcd_pdata *pdata;
+
+	if (of_property_read_u32(np, "height", &height) ||
+	    of_property_read_u32(np, "width", &width)) {
+		dev_dbg(dev,
+			"Need to specify lcd width/height in device tree\n");
+		return NULL;
+	}
+
+	if (of_property_read_u32(np, "brightness", &brightness) ||
+	    (brightness < LCD_BRIGHTNESS_MIN) ||
+	    (brightness > LCD_BRIGHTNESS_MAX))
+		brightness =3D LCD_BRIGHTNESS_MAX;
+
+	pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return NULL;
+
+	pdata->width =3D width;
+	pdata->height =3D height;
+	pdata->brightness =3D brightness;
+
+	return pdata;
+}
+#else
+static struct newhaven_lcd_pdata *lcd_parse_dt(struct device *dev)
+{
+	return 0;
+}
+#endif
+
+static struct tty_driver *lcd_tty_driver;
+
+static int lcd_probe(struct i2c_client *client,
+		     const struct i2c_device_id *i2c_id)
+{
+	struct newhaven_lcd_pdata *pdata;
+	struct lcd *lcd_data;
+	int id, ret =3D -ENOMEM;
+
+	pdata =3D dev_get_platdata(&client->dev);
+	if (!pdata && client->dev.of_node)
+		pdata =3D lcd_parse_dt(&client->dev);
+
+	if (!pdata) {
+		dev_err(&client->dev, "No platform data found.\n");
+		return -ENODEV;
+	}
+
+	lcd_data =3D devm_kzalloc(&client->dev, sizeof(*lcd_data), GFP_KERNEL=
);
+	if (!lcd_data)
+		return -ENOMEM;
+
+	lcd_data->buffer =3D devm_kzalloc(&client->dev,
+					pdata->height * pdata->width,
+					GFP_KERNEL);
+	if (!lcd_data->buffer)
+		return -ENOMEM;
+
+	id =3D ida_simple_get(&lcd_ida, 0, MAX_NEWHAVEN_LCD_COUNT, GFP_KERNEL=
);
+	if (id < 0)
+		return id;
+	lcd_data->index =3D id;
+
+	spin_lock(&lcd_structs_lock);
+	list_add_tail(&lcd_data->next, &lcd_structs);
+	spin_unlock(&lcd_structs_lock);
+
+	i2c_set_clientdata(client, lcd_data);
+
+	lcd_data->client  =3D client;
+	lcd_data->dev     =3D &client->dev;
+	lcd_data->height  =3D pdata->height;
+	lcd_data->width   =3D pdata->width;
+	lcd_data->brightness =3D pdata->brightness;
+
+	dev_set_drvdata(&client->dev, lcd_data);
+	tty_port_init(&lcd_data->port);
+
+	lcd_clear_buffer(lcd_data);
+	lcd_load_custom_fonts(lcd_data);
+	lcd_cmd_display_on(lcd_data);
+	lcd_cmd_backlight_brightness(lcd_data);
+	lcd_cmd_clear_screen(lcd_data);
+
+	ret =3D sysfs_create_group(&lcd_data->dev->kobj, &lcd_attr_group);
+	if (ret) {
+		dev_err(lcd_data->dev, "Can't create sysfs attrs for lcd\n");
+		goto err_group;
+	}
+
+	tty_register_device(lcd_tty_driver, lcd_data->index, &client->dev);
+
+	dev_info(&client->dev, "LCD driver initialized\n");
+
+	return 0;
+
+err_group:
+	spin_lock(&lcd_structs_lock);
+	list_del(&lcd_data->next);
+	spin_unlock(&lcd_structs_lock);
+
+	ida_simple_remove(&lcd_ida, lcd_data->index);
+
+	return ret;
+}
+
+static int __exit lcd_remove(struct i2c_client *client)
+{
+	struct lcd *lcd_data =3D i2c_get_clientdata(client);
+
+	spin_lock(&lcd_structs_lock);
+	list_del(&lcd_data->next);
+	spin_unlock(&lcd_structs_lock);
+
+	ida_simple_remove(&lcd_ida, lcd_data->index);
+
+	lcd_cmd_display_off(lcd_data);
+
+	tty_unregister_device(lcd_tty_driver, lcd_data->index);
+
+	sysfs_remove_group(&lcd_data->dev->kobj, &lcd_attr_group);
+
+	tty_port_put(&lcd_data->port);
+
+	return 0;
+}
+
+static const struct i2c_device_id lcd_id[] =3D {
+	{ DRV_NAME, 0 },
+	{ }
+};
+
+#ifdef CONFIG_OF
+static const struct of_device_id lcd_of_match[] =3D {
+	{ .compatible =3D "newhaven,nhd-0216k3z-nsw-bbw", },
+};
+MODULE_DEVICE_TABLE(i2c, lcd_id);
+#endif
+
+static struct i2c_driver lcd_i2c_driver =3D {
+	.driver =3D {
+		.name =3D DRV_NAME,
+		.owner =3D THIS_MODULE,
+#ifdef CONFIG_OF
+		.of_match_table =3D lcd_of_match,
+#endif
+	},
+	.probe =3D lcd_probe,
+	.remove =3D lcd_remove,
+	.id_table =3D lcd_id,
+};
+
+static int __init lcd_init(void)
+{
+	int ret;
+
+	lcd_tty_driver =3D tty_alloc_driver(MAX_NEWHAVEN_LCD_COUNT,
+					  TTY_DRIVER_DYNAMIC_DEV);
+	if (IS_ERR(lcd_tty_driver))
+		return PTR_ERR(lcd_tty_driver);
+
+	/* initialize the tty_driver structure */
+	lcd_tty_driver->driver_name  =3D DRV_NAME;
+	lcd_tty_driver->name         =3D DEV_NAME;
+	lcd_tty_driver->major	     =3D 0;
+	lcd_tty_driver->minor_start  =3D 0;
+	lcd_tty_driver->type         =3D TTY_DRIVER_TYPE_SERIAL;
+	lcd_tty_driver->subtype      =3D SERIAL_TYPE_NORMAL;
+	lcd_tty_driver->init_termios =3D tty_std_termios;
+	tty_set_operations(lcd_tty_driver, &lcd_ops);
+
+	ret =3D tty_register_driver(lcd_tty_driver);
+	if (ret)
+		goto lcd_put_tty;
+
+	ret =3D i2c_add_driver(&lcd_i2c_driver);
+	if (ret)
+		goto lcd_unreg_tty;
+
+	return 0;
+
+lcd_unreg_tty:
+	tty_unregister_driver(lcd_tty_driver);
+
+lcd_put_tty:
+	put_tty_driver(lcd_tty_driver);
+	return ret;
+}
+subsys_initcall(lcd_init);
+
+static void __exit lcd_exit(void)
+{
+	tty_unregister_driver(lcd_tty_driver);
+	put_tty_driver(lcd_tty_driver);
+	i2c_del_driver(&lcd_i2c_driver);
+	ida_destroy(&lcd_ida);
+}
+module_exit(lcd_exit);
+
+MODULE_DESCRIPTION("Newhaven LCD");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/newhaven_lcd.h b/include/linux=
/platform_data/newhaven_lcd.h
new file mode 100644
index 0000000..68a6d19
--- /dev/null
+++ b/include/linux/platform_data/newhaven_lcd.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (C) 2013-2015 Altera Corporation
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITH=
OUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY =
or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licen=
se for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License a=
long with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef __NEWHAVEN_LCD_H
+#define __NEWHAVEN_LCD_H
+
+struct newhaven_lcd_pdata {
+	unsigned int width;
+	unsigned int height;
+	unsigned int brightness;
+};
+
+#endif /* __NEWHAVEN_LCD_H */
--=20
1.7.9.5
