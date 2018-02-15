From: Amelie Delaunay <amelie.delaunay@st.com>
Subject: [PATCH 1/2] dt-bindings: usb: fix the STM32F7 DWC2 OTG HS core binding
Date: Thu, 15 Feb 2018 16:46:40 +0100
Message-ID: <1518709601-17232-3-git-send-email-amelie.delaunay@st.com>
References: <1518709601-17232-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518709601-17232-1-git-send-email-amelie.delaunay@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <johnyoun@synopsys.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
List-Id: devicetree@vger.kernel.org

This patch fixes binding documentation for DWC2 controller in HS mode
found on STMicroelectronics STM32F7 SoC.
The v2 former patch [1] had been acked by Rob Herring, but v1 was merged.

[1] https://patchwork.kernel.org/patch/9925575/

Fixes: 000777dadc7e ("dt-bindings: usb: Document the STM32F7xx DWC2 ...")
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index e64d903..46da5f1 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -19,7 +19,7 @@ Required properties:
   configured in FS mode;
   - "st,stm32f4x9-hsotg": The DWC2 USB HS controller instance in STM32F4x9 SoCs
   configured in HS mode;
-  - "st,stm32f7xx-hsotg": The DWC2 USB HS controller instance in STM32F7xx SoCs
+  - "st,stm32f7-hsotg": The DWC2 USB HS controller instance in STM32F7 SoCs
     configured in HS mode;
 - reg : Should contain 1 register range (address and length)
 - interrupts : Should contain 1 interrupt
-- 
2.7.4
