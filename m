From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v4 2/6] dt-bindings: usb: add binding for Type-B GPIO connector driver
Date: Fri, 26 Apr 2019 14:47:13 +0800
Message-ID: <1556261237-13823-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1556261237-13823-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556261237-13823-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

It's used to support dual role switch via GPIO when use Type-B
receptacle, typically the USB ID pin is connected to an input
GPIO pin

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4 no changes

v3 changes:
 1. treat type-B connector as a virtual device, but not child device of
    USB controller's

v2 changes:
  1. new patch to make binding clear suggested by Hans
---
 .../bindings/usb/typeb-conn-gpio.txt          | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt

diff --git a/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
new file mode 100644
index 000000000000..d2e1c4e01b6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
@@ -0,0 +1,49 @@
+USB Type-B GPIO Connector
+
+This is a virtual device used to switch dual role mode from the USB ID pin
+connected to an input GPIO pin.
+
+Required properties:
+- compatible : Should be "linux,typeb-conn-gpio"
+
+Sub-nodes:
+- connector : should be present.
+	- compatible : should be "usb-b-connector".
+	- id-gpios, vbus-gpios : either one of them must be present,
+		and both can be present as well.
+	- vbus-supply : can be present if needed when supports dual role mode.
+	see connector/usb-connector.txt
+
+- port : should be present.
+	see graph.txt
+
+Example:
+
+rsw_iddig: role_sw_iddig {
+	compatible = "linux,typeb-conn-gpio";
+	status = "okay";
+
+	connector {
+		compatible = "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+		id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb_p0_vbus>;
+	};
+
+	port {
+		bconn_ep: endpoint@0 {
+			remote-endpoint = <&usb_role_sw>;
+		};
+	};
+};
+
+&mtu3 {
+	status = "okay";
+
+	port {
+		usb_role_sw: endpoint@0 {
+			remote-endpoint = <&bconn_ep>;
+		};
+	};
+};
-- 
2.21.0
