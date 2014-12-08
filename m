From: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 2/5] Documentation: bindings: add doc for the Rockchip usb PHY
Date: Mon,  8 Dec 2014 17:46:25 +0800
Message-ID: <1418031988-2700-3-git-send-email-lyz@rock-chips.com>
References: <1418031988-2700-1-git-send-email-lyz@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418031988-2700-1-git-send-email-lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, romain.perier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the bindings of the Rockchip usb PHY driver.

Signed-off-by: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v3: None

 .../devicetree/bindings/phy/rockchip-usb-phy.txt   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
new file mode 100644
index 0000000..4574696
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
@@ -0,0 +1,22 @@
+ROCKCHIP USB2 PHY
+
+Required properties:
+ - compatible: rockchip,rk3288-usb-phy
+ - rockchip,grf : phandle to the syscon managing the "general
+   register files"
+ - #phy-cells: must be 1
+
+Optional Properties:
+ - clocks : phandle + clock specifier for the phy clocks
+ - clock-names :
+		"usbphy0" - PHY clock for OTG controller
+		"usbphy1" - PHY clock for HOST0 controller
+		"usbphy2" - PHY clock for HOST1 controller
+
+Example:
+
+usbphy: phy {
+	#phy-cells = <1>;
+	compatible = "rockchip,rk3288-usb-phy";
+	rockchip,grf = <&grf>;
+};
-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
