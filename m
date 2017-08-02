From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 4/5] dt-bindings: phy-rockchip-inno-usb2: add otg mux irq quirk
Date: Wed,  2 Aug 2017 15:53:09 +0800
Message-ID: <1501660390-5956-5-git-send-email-frank.wang@rock-chips.com>
References: <1501660390-5956-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501660390-5956-1-git-send-email-frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wmc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add rockchip,otg_mux_irq_quirk property to support the otg-id/
otg-bvalid/linestate irqs that are multiplexed to one irq in
otg-port on some special Rockchip SoCs (e.g RV1108).

Signed-off-by: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
index ddf868a..d49572b 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
@@ -22,6 +22,8 @@ Optional properties:
 		 register files".
  - rockchip,companion_grf_quirk : when set driver will request
 		 "rockchip,usbgrf" phandle as one companion-grf.
+ - rockchip,otg_mux_irq_quirk: set if otg-id/otg-bvalid/linestate irqs
+		 are multiplexed to one irq in otg-port on some SoCs.
 
 Required nodes : a sub-node is required for each port the phy provides.
 		 The sub-node name is used to identify host or otg port,
@@ -36,6 +38,9 @@ Required properties (port (child) node):
 	* "otg-id" : for the otg id interrupt.
 	* "otg-bvalid" : for the otg vbus interrupt.
 	* "linestate" : for the host/otg linestate interrupt.
+	* "otg-mux" : otg-port interrupt, which multiplex otg-id/otg-bvalid/
+		linestate irqs to one irq. Should specify if
+		rockchip,otg_mux_irq_quirk property is set.
 
 Optional properties:
  - phy-supply : phandle to a regulator that provides power to VBUS.
-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
