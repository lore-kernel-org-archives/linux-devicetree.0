From: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v4 2/5] Documentation: bindings: add doc for the Rockchip usb PHY
Date: Tue,  9 Dec 2014 10:48:13 +0800
Message-ID: <1418093293-30557-1-git-send-email-lyz@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the bindings of the Rockchip usb PHY driver.

Signed-off-by: Yunzhi Li <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

Changes in v4:
- Updata description for phy device tree subnode.

Changes in v3: None

 .../devicetree/bindings/phy/rockchip-usb-phy.txt   | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
new file mode 100644
index 0000000..0b725e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip-usb-phy.txt
@@ -0,0 +1,32 @@
+ROCKCHIP USB2 PHY
+
+Required properties:
+ - compatible: rockchip,rk3288-usb-phy
+ - rockchip,grf : phandle to the syscon managing the "general
+   register files"
+ - #phy-cells: should be 1
+ - #address-cells: should be 1
+ - #size-cells: should be 0
+
+Sub-nodes:
+Each PHY should be represented as a sub-node.
+
+Sub-nodes
+required properties:
+- reg: the PHY number
+		"0" - PHY connect to OTG controller
+		"1" - PHY connect to HOST0 controller
+		"2" - PHY connect to HOST1 controller
+
+Optional Properties:
+- clocks : phandle + clock specifier for the phy clocks
+
+Example:
+
+usbphy: phy {
+	#phy-cells = <1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "rockchip,rk3288-usb-phy";
+	rockchip,grf = <&grf>;
+};
-- 
2.0.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
