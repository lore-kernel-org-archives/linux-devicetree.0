From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 1/4] dt-bindings: usb: add DT binding for RK3328 dwc3 controller
Date: Mon,  4 Dec 2017 10:40:38 +0100
Message-ID: <20171204094041.25439-1-heiko@sntech.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Adds the device tree bindings description for RK3328 and
compatible USB DWC3 controller.

Signed-off-by: William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
changes in v2:
- add Rob's Ack

Ideally usb maintainers would pick up this patch to the binding
document and I'll take the devicetree changes after that.

But if so desired, I can also pick up the binding change myself
but would need an Ack for that.

 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
index 50a31536e975..2c3f6a467fda 100644
--- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
@@ -1,7 +1,9 @@
 Rockchip SuperSpeed DWC3 USB SoC controller
 
 Required properties:
-- compatible:	should contain "rockchip,rk3399-dwc3" for rk3399 SoC
+- compatible:	should be one of the following:
+  - "rockchip,rk3399-dwc3": for rk3399 SoC
+  - "rockchip,rk3328-dwc3", "rockchip,rk3399-dwc3": for rk3328 SoC
 - clocks:	A list of phandle + clock-specifier pairs for the
 		clocks listed in clock-names
 - clock-names:	Should contain the following:
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
