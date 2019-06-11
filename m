From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v7 03/10] dt-bindings: usb: add binding for Type-B GPIO connector driver
Date: Tue, 11 Jun 2019 16:44:33 +0800
Message-ID: <1560242680-23844-4-git-send-email-chunfeng.yun@mediatek.com>
References: <1560242680-23844-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560242680-23844-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Yu Chen <chenyu56@huawei.com>, Nagarjuna Kristam <nkristam@nvidia.com>, Felipe Balbi <felipe.balbi@linux.intel.com>
List-Id: devicetree@vger.kernel.org

It's used to support dual role switch via GPIO when use Type-B
receptacle, typically the USB ID pin is connected to an input
GPIO, and also used to enable/disable device when the USB Vbus
pin is connected to an input GPIO.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v7 changes:
 1. add description for device only mode

v6 changes:
 1. remove status and port nodes in example
 2. make vbus-supply as optional property

v5 changes:
 1. treat type-B connector as child device of USB controller's, but not
    as a separate virtual device, suggested by Rob
 2. put connector's port node under connector node, suggested by Rob

v4 no changes

v3 changes:
 1. treat type-B connector as a virtual device, but not child device of
    USB controller's

v2 changes:
  1. new patch to make binding clear suggested by Hans
---
 .../bindings/usb/typeb-conn-gpio.txt          | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt

diff --git a/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
new file mode 100644
index 000000000000..83adb38ceead
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
@@ -0,0 +1,31 @@
+USB Type-B GPIO Connector
+
+This is typically used to switch dual role mode from the USB ID pin connected
+to an input GPIO, and also used to enable/disable device mode from the USB
+Vbus pin connected to an input GPIO.
+
+Required properties:
+- compatible : should include "linux,typeb-conn-gpio" and "usb-b-connector".
+- id-gpios, vbus-gpios : input gpios, either one of them must be present,
+	and both can be present as well.
+	see connector/usb-connector.txt
+
+Optional properties:
+- vbus-supply : can be present if needed when supports dual role mode.
+	see connector/usb-connector.txt
+
+- Sub-nodes:
+	- port : can be present.
+		see graph.txt
+
+Example:
+
+&mtu3 {
+	connector {
+		compatible = "linux,typeb-conn-gpio", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+		id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb_p0_vbus>;
+	};
+};
-- 
2.21.0
