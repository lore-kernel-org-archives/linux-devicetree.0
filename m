From: Bruno Herrera <bruherrera@gmail.com>
Subject: [v2 3/3] dt-bindings: Document the STM32 USB OTG DWC2 core binding
Date: Mon, 16 Jan 2017 00:09:56 -0200
Message-ID: <20170116020958.62767-3-bruherrera@gmail.com>
References: <20170116020958.62767-1-bruherrera@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170116020958.62767-1-bruherrera@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the documentation for STM32F4x9 USB OTG FS/HS compatible strings.

Signed-off-by: Bruno Herrera <bruherrera@gmail.com>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 6c7c2bce..637223a 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -14,6 +14,10 @@ Required properties:
   - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
   - "amcc,dwc-otg": The DWC2 USB controller instance in AMCC Canyonlands 460EX SoCs;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
+  - "st,stm32f4xx-fsotg": The DWC2 USB FS/HS controller instance in STM32F4xx SoCs
+  configured in FS mode;
+  - "st,stm32f4xx-hsotg": The DWC2 USB HS controller instance in STM32F4xx SoCs
+  configured in HS mode;
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
 - clocks: clock provider specifier
-- 
2.10.1 (Apple Git-78)
