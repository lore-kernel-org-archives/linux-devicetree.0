From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v5 3/5] ARM: davinci: da8xx: Add USB PHY platform
 declaration
Date: Wed, 22 Jun 2016 12:08:50 -0500
Message-ID: <576AC622.20608@lechnology.com>
References: <1462837612-7803-1-git-send-email-david@lechnology.com>
 <1462837612-7803-4-git-send-email-david@lechnology.com>
 <01040628-8116-f0db-dc20-f511f6d3a2b0@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <01040628-8116-f0db-dc20-f511f6d3a2b0-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, nsekhar-l0cyMroinI0@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

 From 53c9b38e0a7860e51ce7bdfe6d4f1d83cf2394a5 Mon Sep 17 00:00:00 2001
From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Date: Wed, 16 Mar 2016 14:25:23 -0500
Subject: [PATCH] ARM: davinci: da8xx: Add USB PHY platform declaration

There is now a proper phy driver for the DA8xx SoC USB PHY. This adds the
platform device declarations needed to use it.

Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
---

id = 0 is changed to id = -1


  arch/arm/mach-davinci/board-da830-evm.c     | 28 
+++++-----------------------
  arch/arm/mach-davinci/board-omapl138-hawk.c |  5 +++++
  arch/arm/mach-davinci/include/mach/da8xx.h  |  1 +
  arch/arm/mach-davinci/usb-da8xx.c           | 11 +++++++++++
  4 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da830-evm.c 
b/arch/arm/mach-davinci/board-da830-evm.c
index 3051cb6..c62766e 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -26,7 +26,6 @@
  #include <linux/platform_data/mtd-davinci.h>
  #include <linux/platform_data/mtd-davinci-aemif.h>
  #include <linux/platform_data/spi-davinci.h>
-#include <linux/platform_data/usb-davinci.h>

  #include <asm/mach-types.h>
  #include <asm/mach/arch.h>
@@ -106,30 +105,8 @@ static irqreturn_t da830_evm_usb_ocic_irq(int irq, 
void *dev_id)

  static __init void da830_evm_usb_init(void)
  {
-	u32 cfgchip2;
  	int ret;

-	/*
-	 * Set up USB clock/mode in the CFGCHIP2 register.
-	 * FYI:  CFGCHIP2 is 0x0000ef00 initially.
-	 */
-	cfgchip2 = __raw_readl(DA8XX_SYSCFG0_VIRT(DA8XX_CFGCHIP2_REG));
-
-	/*
-	 * We have to override VBUS/ID signals when MUSB is configured into the
-	 * host-only mode -- ID pin will float if no cable is connected, so the
-	 * controller won't be able to drive VBUS thinking that it's a B-device.
-	 * Otherwise, we want to use the OTG mode and enable VBUS comparators.
-	 */
-	cfgchip2 &= ~CFGCHIP2_OTGMODE;
-#ifdef	CONFIG_USB_MUSB_HOST
-	cfgchip2 |=  CFGCHIP2_FORCE_HOST;
-#else
-	cfgchip2 |=  CFGCHIP2_SESENDEN | CFGCHIP2_VBDTCTEN;
-#endif
-
-	__raw_writel(cfgchip2, DA8XX_SYSCFG0_VIRT(DA8XX_CFGCHIP2_REG));
-
  	/* USB_REFCLKIN is not used. */
  	ret = da8xx_register_usb20_phy_clk(false);
  	if (ret)
@@ -141,6 +118,11 @@ static __init void da830_evm_usb_init(void)
  		pr_warn("%s: USB 1.1 PHY CLK registration failed: %d\n",
  			__func__, ret);

+	ret = da8xx_register_usb_phy();
+	if (ret)
+		pr_warn("%s: USB PHY registration failed: %d\n",
+			__func__, ret);
+
  	ret = davinci_cfg_reg(DA830_USB0_DRVVBUS);
  	if (ret)
  		pr_warn("%s: USB 2.0 PinMux setup failed: %d\n", __func__, ret);
diff --git a/arch/arm/mach-davinci/board-omapl138-hawk.c 
b/arch/arm/mach-davinci/board-omapl138-hawk.c
index 8691a25..c5cb8d9 100644
--- a/arch/arm/mach-davinci/board-omapl138-hawk.c
+++ b/arch/arm/mach-davinci/board-omapl138-hawk.c
@@ -260,6 +260,11 @@ static __init void omapl138_hawk_usb_init(void)
  		pr_warn("%s: USB 1.1 PHY CLK registration failed: %d\n",
  			__func__, ret);

+	ret = da8xx_register_usb_phy();
+	if (ret)
+		pr_warn("%s: USB PHY registration failed: %d\n",
+			__func__, ret);
+
  	ret = gpio_request_one(DA850_USB1_VBUS_PIN,
  			GPIOF_DIR_OUT, "USB1 VBUS");
  	if (ret < 0) {
diff --git a/arch/arm/mach-davinci/include/mach/da8xx.h 
b/arch/arm/mach-davinci/include/mach/da8xx.h
index c32444b..38d932e 100644
--- a/arch/arm/mach-davinci/include/mach/da8xx.h
+++ b/arch/arm/mach-davinci/include/mach/da8xx.h
@@ -92,6 +92,7 @@ int da8xx_register_watchdog(void);
  int da8xx_register_usb_refclkin(int rate);
  int da8xx_register_usb20_phy_clk(bool use_usb_refclkin);
  int da8xx_register_usb11_phy_clk(bool use_usb_refclkin);
+int da8xx_register_usb_phy(void);
  int da8xx_register_usb20(unsigned mA, unsigned potpgt);
  int da8xx_register_usb11(struct da8xx_ohci_root_hub *pdata);
  int da8xx_register_emac(void);
diff --git a/arch/arm/mach-davinci/usb-da8xx.c 
b/arch/arm/mach-davinci/usb-da8xx.c
index c524d9e..7c3175f 100644
--- a/arch/arm/mach-davinci/usb-da8xx.c
+++ b/arch/arm/mach-davinci/usb-da8xx.c
@@ -7,6 +7,7 @@
  #include <linux/platform_data/usb-davinci.h>
  #include <linux/platform_device.h>
  #include <linux/mfd/da8xx-cfgchip.h>
+#include <linux/phy/phy.h>
  #include <linux/usb/musb.h>

  #include <mach/clock.h>
@@ -230,6 +231,16 @@ int __init da8xx_register_usb11_phy_clk(bool 
use_usb_refclkin)
  	return ret;
  }

+static struct platform_device da8xx_usb_phy = {
+	.name		= "da8xx-usb-phy",
+	.id		= -1,
+};
+
+int __init da8xx_register_usb_phy(void)
+{
+	return platform_device_register(&da8xx_usb_phy);
+}
+
  #if IS_ENABLED(CONFIG_USB_MUSB_HDRC)

  static struct musb_hdrc_config musb_config = {
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
