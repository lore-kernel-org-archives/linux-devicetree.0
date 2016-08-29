From: John Youn <johnyoun@synopsys.com>
Subject: [PATCH 6/6] Documentation: devicetree: dwc2: Deprecate g-tx-fifo-size
Date: Mon, 29 Aug 2016 13:39:03 -0700
Message-ID: <47342acebdbd240cb1f92b2da7c1055a06f440d6.1472502978.git.johnyoun__6745.28082968226$1472503177$gmane$org@synopsys.com>
References: <cover.1472502978.git.johnyoun@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1472502978.git.johnyoun@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Youn <johnyoun@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This property is not needed because the periodic fifos are not
configurable. So it was incorrect to add this property in the first
place.

Signed-off-by: John Youn <johnyoun@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 20a68bf..7d16ebf 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -26,7 +26,10 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
 - g-use-dma: enable dma usage in gadget driver.
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
-- g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
+
+Deprecated properties:
+- g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0)
+  in gadget mode.
 
 Example:
 
-- 
2.9.0
