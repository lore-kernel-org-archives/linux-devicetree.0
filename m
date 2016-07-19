From: Randy Li <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: rockchip: Point rk3288 dwc2 usb at the full PHY reset
Date: Tue, 19 Jul 2016 20:05:53 +0800
Message-ID: <1468929953-7023-1-git-send-email-randy.li@rock-chips.com>
References: <1446236275-12698-2-git-send-email-dianders@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446236275-12698-2-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org, eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

The "host1" port (AKA the dwc2 port that isn't the OTG port) on rk3288
has a hardware errata that causes everything to get confused when we get
a remote wakeup.  We'll use the reset that's in the CRU to reset the
port when it's in a bad state.

Note that we add the reset to both dwc2 controllers even though only one
has the errata in case we find some other use for this reset that's
unrelated to the current hardware errata.  Only the host port gets the
quirk property, though.

Signed-off-by: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/rk3288.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 3b44ef3..94fa26f 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -578,6 +578,9 @@
 		dr_mode = "host";
 		phys = <&usbphy2>;
 		phy-names = "usb2-phy";
+		resets = <&cru SRST_USBHOST1_PHY>;
+		reset-names = "phy-full-reset";
+		snps,need-phy-full-reset-on-wake;
 		status = "disabled";
 	};
 
@@ -595,6 +598,8 @@
 		g-use-dma;
 		phys = <&usbphy0>;
 		phy-names = "usb2-phy";
+		resets = <&cru SRST_USBOTG_PHY>;
+		reset-names = "phy-full-reset";
 		status = "disabled";
 	};
 
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
