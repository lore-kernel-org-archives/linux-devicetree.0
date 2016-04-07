From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v1 1/2] dt/bindings/usb: Add bindings for PIC32 MUSB driver.
Date: Thu, 7 Apr 2016 16:46:14 +0530
Message-ID: <1460027775-20729-1-git-send-email-purna.mandal@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joshua Henderson <digitalpeer-icZdIMMiY0PM6KjX8ROVJw@public.gmane.org>, Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document devicetree binding for the USB controller
and USB Phy found on Microchip PIC32 class devices.

Signed-off-by: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

---

 .../bindings/usb/microchip,pic32-musb.txt          | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt

diff --git a/Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt b/Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt
new file mode 100644
index 0000000..e1cec9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt
@@ -0,0 +1,67 @@
+Microchip PIC32 MUSB DRC/OTG controller
+-------------------------------------------
+
+Required properties:
+ - compatible       : should be "microchip,pic32mzda-usb".
+ - reg              : offset and length of "MUSB Core Registers" and
+                      "USB Clock & Reset Registers".
+ - reg-names        : should be "mc", and "usbcr" in order
+ - clocks           : clock specifier for the musb controller clock
+ - clock-names      : should be "usb_clk"
+ - interrupts       : interrupt number for MUSB Core General interrupt
+                      and DMA interrupt
+ - interrupt-names  : must be "mc" and "dma" in order.
+ - phys             : phy specifier for the otg phy.
+ - dr_mode          : should be one of "host", "peripheral" or "otg".
+ - mentor,multipoint: Should be "1" indicating the musb controller supports
+                      multipoint. This is MUSB configuration-specific setting.
+ - mentor,num-eps   : Specifies the number of endpoints. This is also a
+                      MUSB configuration-specific setting. Should be set to "8".
+ - mentor,ram-bits  : Specifies the ram address size. Should be set to "11".
+ - mentor,power     : Should be "500". This signifies the controller can supply
+                      up to 500mA when operating in host mode.
+ - phys             : phandle of the USB phy.
+ - usb_overcurrent  : phandle to MUSB over-current note. It should have
+                      interrupt number for over-current detection logic.
+
+Optional properties:
+ - microchip,fifo-mode: Specifies layout of internal SRAM for end-point fifos.
+                        Should be 0 (default) or 1.
+
+Example:
+	aliases {
+		usb1 = &usb1;
+		phy1 = &usb1_phy;
+	};
+
+	usb1: hsusb1_core@1f8e3000 {
+		compatible = "microchip,pic32mzda-usb";
+		reg = <0x1f8e3000 0x1000>,
+		      <0x1f884000 0x1000>;
+		reg-names = "mc", "usbcr";
+		interrupts = <132 IRQ_TYPE_EDGE_RISING>,
+			     <133 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "mc", "dma";
+		dr_mode = "host";
+		mentor,multipoint = <1>;
+		mentor,num-eps = <8>;
+		mentor,ram-bits = <11>;
+		mentor,power = <500>;
+		phys = <&usb1_phy>;
+		clocks = <&rootclk PB5CLK>;
+		clock-names = "usb_clk";
+		usb_overcurrent = <&usb1_overcurrent>;
+	};
+
+	usb1_phy: hsusb1_phy@1f8e4000 {
+		compatible = "usb-nop-xceiv";
+		reg = <0x1f8e4000 0x1000>;
+		clocks = <&rootclk UPLLCLK>;
+		clock-names = "main_clk";
+		clock-frequency = <24000000>;
+	};
+
+	usb1_overcurrent: hsusb1_oc@0 {
+		interrupt-parent = <&gpio1>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+	};
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
