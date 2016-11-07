From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 01/30] usb: dwc2: Deprecate g-use-dma binding
Date: Mon, 07 Nov 2016 14:39:47 -0800
Message-ID: <e99e9d8df77884671f94734109a1a8d76a0222c1.1478558343.git.johnyoun@synopsys.com>
References: <cover.1478558343.git.johnyoun@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1478558343.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a vendor prefix and make the name more consistent by renaming it to
"snps,gadget-dma-enable".

Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 5 ++++-
 arch/arm/boot/dts/rk3036.dtsi                  | 2 +-
 arch/arm/boot/dts/rk3288.dtsi                  | 2 +-
 arch/arm/boot/dts/rk3xxx.dtsi                  | 2 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi       | 2 +-
 drivers/usb/dwc2/params.c                      | 9 ++++++++-
 drivers/usb/dwc2/pci.c                         | 2 +-
 8 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 9472111..389a461 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -26,11 +26,14 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
 - dr_mode: shall be one of "host", "peripheral" and "otg"
   Refer to usb/generic.txt
 - snps,host-dma-disable: disable host DMA mode.
-- g-use-dma: enable dma usage in gadget driver.
+- snps,gadget-dma-enable: enable gadget DMA mode.
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
 - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
 
+Deprecated properties:
+- g-use-dma: Use "snps,gadget-dma-enable" instead.
+
 Example:
 
         usb@101c0000 {
diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index a935523..2604d2d 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -204,7 +204,7 @@
 		g-np-tx-fifo-size = <16>;
 		g-rx-fifo-size = <275>;
 		g-tx-fifo-size = <256 128 128 64 64 32>;
-		g-use-dma;
+		snps,gadget-dma-enable;
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 17ec2e2..c0db4ae 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -596,7 +596,7 @@
 		g-np-tx-fifo-size = <16>;
 		g-rx-fifo-size = <275>;
 		g-tx-fifo-size = <256 128 128 64 64 32>;
-		g-use-dma;
+		snps,gadget-dma-enable;
 		phys = <&usbphy0>;
 		phy-names = "usb2-phy";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index e15beb3..c96d622 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -181,7 +181,7 @@
 		g-np-tx-fifo-size = <16>;
 		g-rx-fifo-size = <275>;
 		g-tx-fifo-size = <256 128 128 64 64 32>;
-		g-use-dma;
+		snps,gadget-dma-enable;
 		phys = <&usbphy0>;
 		phy-names = "usb2-phy";
 		status = "disabled";
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 17839db..fe441f7 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -747,7 +747,7 @@
 			clocks = <&sys_ctrl HI6220_USBOTG_HCLK>;
 			clock-names = "otg";
 			dr_mode = "otg";
-			g-use-dma;
+			snps,gadget-dma-enable;
 			g-rx-fifo-size = <512>;
 			g-np-tx-fifo-size = <128>;
 			g-tx-fifo-size = <128 128 128 128 128 128>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 0fcb214..6b44544 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -537,7 +537,7 @@
 		g-np-tx-fifo-size = <16>;
 		g-rx-fifo-size = <275>;
 		g-tx-fifo-size = <256 128 128 64 64 32>;
-		g-use-dma;
+		snps,gadget-dma-enable;
 		status = "disabled";
 	};
 
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 2eb79e8..aeece91 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -1161,10 +1161,17 @@ static void dwc2_set_parameters(struct dwc2_hsotg *hsotg,
 	    (hsotg->dr_mode == USB_DR_MODE_OTG)) {
 		dev_dbg(hsotg->dev, "Setting peripheral device properties\n");
 
-		dwc2_set_param_bool(hsotg, &p->g_dma, true, "g-use-dma",
+		dwc2_set_param_bool(hsotg, &p->g_dma, true,
+				    "snps,gadget-dma-enable",
 				    false, false,
 				    dma_capable);
 
+		/* Check the deprecated property. */
+		if (!p->g_dma)
+			dwc2_set_param_bool(hsotg, &p->g_dma, true, "g-use-dma",
+					    false, false,
+					    dma_capable);
+
 		/*
 		 * The values for g_rx_fifo_size (2048) and
 		 * g_np_tx_fifo_size (1024) come from the legacy s3c
diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
index b3f3b58..46a9d2b 100644
--- a/drivers/usb/dwc2/pci.c
+++ b/drivers/usb/dwc2/pci.c
@@ -67,7 +67,7 @@ static int dwc2_pci_quirks(struct pci_dev *pdev, struct platform_device *dwc2)
 	if (pdev->vendor == PCI_VENDOR_ID_SYNOPSYS &&
 	    pdev->device == PCI_PRODUCT_ID_HAPS_HSOTG) {
 		struct property_entry properties[] = {
-			PROPERTY_ENTRY_BOOL("g-use-dma"),
+			PROPERTY_ENTRY_BOOL("snps,gadget-dma-enable"),
 			{ },
 		};
 
-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
