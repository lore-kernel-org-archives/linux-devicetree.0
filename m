From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v6 03/10] dt-bindings: usb: add binding for Type-B GPIO
 connector driver
Date: Wed, 29 May 2019 15:43:41 +0800
Message-ID: <1559115828-19146-4-git-send-email-chunfeng.yun@mediatek.com>
References: <1559115828-19146-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1559115828-19146-1-git-send-email-chunfeng.yun@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Badhri Jagan Sridharan <badhri@google.com>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Yu Chen <chenyu56@huawei.com>, linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

It's used to support dual role switch via GPIO when use Type-B
receptacle, typically the USB ID pin is connected to an input
GPIO pin

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
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
 .../bindings/usb/typeb-conn-gpio.txt          | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt

diff --git a/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
new file mode 100644
index 000000000000..5be443a16c6b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
@@ -0,0 +1,30 @@
+USB Type-B GPIO Connector
+
+This is typically used to switch dual role mode from the USB ID pin connected
+to an input GPIO pin.
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
