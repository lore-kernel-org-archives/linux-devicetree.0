From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] pinctrl: sunxi: Fix irq_of_xlate for the
 r_pio pinctrl block
Date: Thu, 15 Oct 2015 16:27:25 +0200
Message-ID: <1444919246-23694-2-git-send-email-hdegoede@redhat.com>
References: <1444919246-23694-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBW7P72YAKGQEZCSE2LQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1444919246-23694-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thomas Kaiser <Thomas.Kaiser-id7G5ibTm3AZ78jC37dNPg@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The r_pio gpio / pin controller has a pin_base of non 0, we need to
adjust for this before calling sunxi_pinctrl_desc_find_function_by_pin.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 38e0c7b..96a58e4 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -716,6 +716,7 @@ static int sunxi_pinctrl_irq_of_xlate(struct irq_domain *d,
 				      unsigned long *out_hwirq,
 				      unsigned int *out_type)
 {
+	struct sunxi_pinctrl *pctl = d->host_data;
 	struct sunxi_desc_function *desc;
 	int pin, base;
 
@@ -723,10 +724,9 @@ static int sunxi_pinctrl_irq_of_xlate(struct irq_domain *d,
 		return -EINVAL;
 
 	base = PINS_PER_BANK * intspec[0];
-	pin = base + intspec[1];
+	pin = pctl->desc->pin_base + base + intspec[1];
 
-	desc = sunxi_pinctrl_desc_find_function_by_pin(d->host_data,
-						       pin, "irq");
+	desc = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq");
 	if (!desc)
 		return -EINVAL;
 
-- 
2.5.0
