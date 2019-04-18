From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 3/5] Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
Date: Wed, 17 Apr 2019 17:13:54 -0700
Message-ID: <20190418001356.124334-4-dianders@chromium.org>
References: <20190418001356.124334-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418001356.124334-1-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, heiko@sntech.de
Cc: Alan Stern <stern@rowland.harvard.edu>, Artur Petrosyan <Arthur.Petrosyan@synopsys.com>, amstan@chromium.org, linux-rockchip@lists.infradead.org, William Wu <william.wu@rock-chips.com>, linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Randy Li <ayaka@soulik.info>, zyw@rock-chips.com, mka@chromium.org, ryandcase@chromium.org, Amelie Delaunay <amelie.delaunay@st.com>, jwerner@chromium.org, dinguyen@opensource.altera.com, Elaine Zhang <zhangqing@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Some SoCs with a dwc2 USB controller may need to keep the PHY on to
support remote wakeup.  Allow specifying this as a device tree
property.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
For relevant prior discussion on this patch, see:

https://lkml.kernel.org/r/1435017144-2971-3-git-send-email-dianders@chromium.org

I didn't make any changes from the prior version since I never found
out what Rob thought of my previous arguments.  If folks want a
change, perhaps they could choose from these options:

1. Assume that all dwc2 hosts would like to keep their PHY on for
   suspend if there's a USB wakeup enabled, thus we totally drop this
   binding.  This doesn't seem super great to me since I'd bet that
   many devices that use dwc2 weren't designed for USB wakeup (they
   may not keep enough clocks or rails on) so we might be wasting
   power for nothing.
2. Rename this property to "snps,wakeup-from-suspend-with-phy" to make
   it more obvious that this property is intended both to document
   that wakeup from suspend is possible and that we need the PHY for
   said wakeup.
3. Rename this property to "snps,can-wakeup-from-suspend" and assume
   it's implicit that if we can wakeup from suspend that we need to
   keep the PHY on.  If/when someone shows that a device exists using
   dwc2 where we can wakeup from suspend without the PHY they can add
   a new property.

Changes in v2: None

 Documentation/devicetree/bindings/usb/dwc2.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index f70f3aee4bfc..1c5e29d23c51 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -37,6 +37,8 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
 - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
+- snps,need-phy-for-wake: If present indicates that the phy needs to be left
+                          on for remote wakeup during suspend.
 - snps,reset-phy-on-wake: If present indicates that we need to reset the PHY when
                           we detect a wakeup.  This is due to a hardware errata.
 
@@ -53,4 +55,5 @@ Example:
 		clock-names = "otg";
 		phys = <&usbphy>;
 		phy-names = "usb2-phy";
+		snps,need-phy-for-wake;
         };
-- 
2.21.0.593.g511ec345e18-goog
