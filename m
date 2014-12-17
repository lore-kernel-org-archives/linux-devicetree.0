From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 01/13] pinctrl: sun6i: Add some missing functions
Date: Wed, 17 Dec 2014 18:18:12 +0100
Message-ID: <1418836704-15689-2-git-send-email-hdegoede@redhat.com>
References: <1418836704-15689-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORB27VY2SAKGQERELZ7IY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1418836704-15689-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

While working on pinctrl for the A31s, I noticed that function 4 of
PA15 - PA18 was missing, add these.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-Drop the changes to the muxing of i2c3 this was based on
 "A31s Datasheet v1.40.pdf", but all other A31 related info puts them at the
 pins where we already have them, so leave this as is
---
 drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c b/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c
index f42858e..18038f0 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun6i-a31.c
@@ -134,24 +134,28 @@ static const struct sunxi_desc_pin sun6i_a31_pins[] = {
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "gmac"),		/* RXD4 */
 		  SUNXI_FUNCTION(0x3, "lcd1"),		/* D15 */
+		  SUNXI_FUNCTION(0x4, "clk_out_a"),
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)),	/* PA_EINT15 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 16),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "gmac"),		/* RXD5 */
 		  SUNXI_FUNCTION(0x3, "lcd1"),		/* D16 */
+		  SUNXI_FUNCTION(0x4, "dmic"),		/* CLK */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)),	/* PA_EINT16 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 17),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "gmac"),		/* RXD6 */
 		  SUNXI_FUNCTION(0x3, "lcd1"),		/* D17 */
+		  SUNXI_FUNCTION(0x4, "dmic"),		/* DIN */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 17)),	/* PA_EINT17 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 18),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "gmac"),		/* RXD7 */
 		  SUNXI_FUNCTION(0x3, "lcd1"),		/* D18 */
+		  SUNXI_FUNCTION(0x4, "clk_out_b"),
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 18)),	/* PA_EINT18 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 19),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
@@ -207,6 +211,7 @@ static const struct sunxi_desc_pin sun6i_a31_pins[] = {
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "gmac"),		/* MDC */
 		  SUNXI_FUNCTION(0x3, "lcd1"),		/* HSYNC */
+		  SUNXI_FUNCTION(0x4, "clk_out_c"),
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 26)),	/* PA_EINT26 */
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 27),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
-- 
2.1.0
