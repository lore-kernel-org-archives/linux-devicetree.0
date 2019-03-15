From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2 2/6] dt-bindings: usb: add binding for Type-B dual role switch by GPIO
Date: Fri, 15 Mar 2019 15:38:29 +0800
Message-ID: <1552635513-2378-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552635513-2378-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

It's used to support dual role switch via GPIO when use Type-B
receptacle

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2 changes:
  1. new patch to make binding clear suggested by Hans
---
 .../bindings/usb/typeb-switch-gpio.txt        | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/typeb-switch-gpio.txt

diff --git a/Documentation/devicetree/bindings/usb/typeb-switch-gpio.txt b/Documentation/devicetree/bindings/usb/typeb-switch-gpio.txt
new file mode 100644
index 000000000000..d46d83bc6500
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typeb-switch-gpio.txt
@@ -0,0 +1,26 @@
+USB Type-B dual role switch via a GPIO
+
+This is a virtual device used to switch dual role mode from the USB ID pin
+connected to a GPIO pin.
+
+Required properties:
+- compatible: Should be "linux,typeb-switch-gpio"
+
+Either one of id-gpios or vbus-gpios must be present, and both can be present
+as well.
+vbus-supply could be present if needed when support dual role mode.
+	see connector/usb-connector.txt
+
+Example:
+
+&mtu3 {
+	status = "okay";
+
+	connector@0 {
+		compatible = "usb-b-connector", "linux,typeb-switch-gpio";
+		label = "micro-USB";
+		type = "micro";
+		id-gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb_p0_vbus>;
+	};
+};
-- 
2.20.1
