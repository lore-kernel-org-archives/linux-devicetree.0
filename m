From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH v2 3/5] auxdisplay: charlcd: Add support for displays with more than two lines
Date: Fri, 10 Mar 2017 15:15:19 +0100
Message-ID: <1489155321-25666-4-git-send-email-geert@linux-m68k.org>
References: <1489155321-25666-1-git-send-email-geert@linux-m68k.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489155321-25666-1-git-send-email-geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Miguel Ojeda Sandonis <miguel.ojeda.sandonis-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Willy Tarreau <willy-W4YR9g1X7EZBDgjK7y7TUQ@public.gmane.org>, Ksenija Stanojevic <ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akira Tsukamoto <akira.tsukamoto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On displays with more than two lines, the additional lines are stored in
the buffers used for the first two lines, but beyond the visible parts.
Adjust the DDRAM address calculation to cater for this.

When clearing the display, avoid writing more spaces than the actual
size of the physical buffer.

Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
---
v2:
  - No changes.
---
 drivers/auxdisplay/charlcd.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/auxdisplay/charlcd.c b/drivers/auxdisplay/charlcd.c
index b3a84e90a268478c..cfeb049a01ef8442 100644
--- a/drivers/auxdisplay/charlcd.c
+++ b/drivers/auxdisplay/charlcd.c
@@ -159,15 +159,19 @@ EXPORT_SYMBOL_GPL(charlcd_poke);
 static void charlcd_gotoxy(struct charlcd *lcd)
 {
 	struct charlcd_priv *priv = to_priv(lcd);
+	unsigned int addr;
 
-	lcd->ops->write_cmd(lcd,
-		LCD_CMD_SET_DDRAM_ADDR | (priv->addr.y ? lcd->hwidth : 0) |
-		/*
-		 * we force the cursor to stay at the end of the
-		 * line if it wants to go farther
-		 */
-		((priv->addr.x < lcd->bwidth) ? priv->addr.x & (lcd->hwidth - 1)
-					      : lcd->bwidth - 1));
+	/*
+	 * we force the cursor to stay at the end of the
+	 * line if it wants to go farther
+	 */
+	addr = priv->addr.x < lcd->bwidth ? priv->addr.x & (lcd->hwidth - 1)
+					  : lcd->bwidth - 1;
+	if (priv->addr.y & 1)
+		addr += lcd->hwidth;
+	if (priv->addr.y & 2)
+		addr += lcd->bwidth;
+	lcd->ops->write_cmd(lcd, LCD_CMD_SET_DDRAM_ADDR | addr);
 }
 
 static void charlcd_home(struct charlcd *lcd)
@@ -203,7 +207,7 @@ static void charlcd_clear_fast(struct charlcd *lcd)
 	if (lcd->ops->clear_fast)
 		lcd->ops->clear_fast(lcd);
 	else
-		for (pos = 0; pos < lcd->height * lcd->hwidth; pos++)
+		for (pos = 0; pos < min(2, lcd->height) * lcd->hwidth; pos++)
 			lcd->ops->write_data(lcd, ' ');
 
 	charlcd_home(lcd);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
