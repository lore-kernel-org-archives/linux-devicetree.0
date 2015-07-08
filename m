From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 4/4] musb: sunxi: Add support for musb
 controller in A33 SoC
Date: Wed,  8 Jul 2015 16:41:40 +0200
Message-ID: <1436366500-12555-5-git-send-email-hdegoede@redhat.com>
References: <1436366500-12555-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBMXN6SWAKGQE4BPQQ4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1436366500-12555-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The A33 SoC uses the same musb controller as found on the A31 and later,
but allwinner has removed the configdata register, this commit adds special
handling for this.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt  |  3 ++-
 drivers/usb/musb/sunxi.c                                  | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
index fde180b..862cd7c 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.txt
@@ -2,7 +2,8 @@ Allwinner sun4i A10 musb DRC/OTG controller
 -------------------------------------------
 
 Required properties:
- - compatible      : "allwinner,sun4i-a10-musb" or "allwinner,sun6i-a31-musb"
+ - compatible      : "allwinner,sun4i-a10-musb", "allwinner,sun6i-a31-musb"
+                     or "allwinner,sun8i-a33-musb"
  - reg             : mmio address range of the musb controller
  - clocks          : clock specifier for the musb controller ahb gate clock
  - reset           : reset specifier for the ahb reset (A31 and newer only)
diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index df2f75e..f9f6304 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -73,6 +73,7 @@
 #define SUNXI_MUSB_FL_PHY_ON			4
 #define SUNXI_MUSB_FL_HAS_SRAM			5
 #define SUNXI_MUSB_FL_HAS_RESET			6
+#define SUNXI_MUSB_FL_NO_CONFIGDATA		7
 
 /* Our read/write methods need access and do not get passed in a musb ref :| */
 static struct musb *sunxi_musb;
@@ -370,6 +371,8 @@ static u32 sunxi_musb_busctl_offset(u8 epnum, u16 offset)
 
 static u8 sunxi_musb_readb(const void __iomem *addr, unsigned offset)
 {
+	struct sunxi_glue *glue;
+
 	if (addr == sunxi_musb->mregs) {
 		/* generic control or fifo control reg access */
 		switch (offset) {
@@ -392,6 +395,12 @@ static u8 sunxi_musb_readb(const void __iomem *addr, unsigned offset)
 		case MUSB_RXFIFOSZ:
 			return readb(addr + SUNXI_MUSB_RXFIFOSZ);
 		case MUSB_CONFIGDATA + 0x10: /* See musb_read_configdata() */
+			glue = dev_get_drvdata(sunxi_musb->controller->parent);
+			/* A33 saves a reg, and we get to hardcode this */
+			if (test_bit(SUNXI_MUSB_FL_NO_CONFIGDATA,
+				     &glue->flags))
+				return 0xde;
+
 			return readb(addr + SUNXI_MUSB_CONFIGDATA);
 		/* Offset for these is fixed by sunxi_musb_busctl_offset() */
 		case SUNXI_MUSB_TXFUNCADDR:
@@ -643,6 +652,11 @@ static int sunxi_musb_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(np, "allwinner,sun6i-a31-musb"))
 		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
 
+	if (of_device_is_compatible(np, "allwinner,sun8i-a33-musb")) {
+		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
+		set_bit(SUNXI_MUSB_FL_NO_CONFIGDATA, &glue->flags);
+	}
+
 	glue->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(glue->clk)) {
 		dev_err(&pdev->dev, "Error getting clock: %ld\n",
@@ -723,6 +737,7 @@ static int sunxi_musb_remove(struct platform_device *pdev)
 static const struct of_device_id sunxi_musb_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-musb", },
 	{ .compatible = "allwinner,sun6i-a31-musb", },
+	{ .compatible = "allwinner,sun8i-a33-musb", },
 	{}
 };
 
-- 
2.4.3
