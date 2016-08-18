From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH] Documentation: dt: dwc3: note the supported phy-names
Date: Thu, 18 Aug 2016 14:37:16 -0700
Message-ID: <1471556236-3803-1-git-send-email-briannorris@chromium.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The dwc3 driver expicitly looks for "usb2-phy" or "usb3-phy", but we
never noted these names in the documentation.

Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 7d7ce089b003..2358779cf6cb 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -13,7 +13,8 @@ Optional properties:
    in the array is expected to be a handle to the USB2/HS PHY and
    the second element is expected to be a handle to the USB3/SS PHY
  - phys: from the *Generic PHY* bindings
- - phy-names: from the *Generic PHY* bindings
+ - phy-names: from the *Generic PHY* bindings; supported names are "usb2-phy"
+	or "usb3-phy".
  - snps,usb3_lpm_capable: determines if platform is USB3 LPM capable
  - snps,disable_scramble_quirk: true when SW should disable data scrambling.
 	Only really useful for FPGA builds.
-- 
2.8.0.rc3.226.g39d4020

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
