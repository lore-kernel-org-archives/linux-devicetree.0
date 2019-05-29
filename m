From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v6 02/10] dt-bindings: connector: add optional properties for Type-B
Date: Wed, 29 May 2019 15:43:40 +0800
Message-ID: <1559115828-19146-3-git-send-email-chunfeng.yun@mediatek.com>
References: <1559115828-19146-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559115828-19146-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Yu Chen <chenyu56@huawei.com>
List-Id: devicetree@vger.kernel.org

Add id-gpios, vbus-gpios, vbus-supply and pinctrl properties for
usb-b-connector

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v6 no changes

v5 changes:
 1. add reviewed by Rob

v4 no changes

v3 changes:
 1. add GPIO direction, and use fixed-regulator for GPIO controlled
    VBUS regulator suggested by Rob;

v2 changes:
 1. describe more clear for vbus-gpios and vbus-supply suggested by Hans
---
 .../bindings/connector/usb-connector.txt           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
index cef556d4e5ee..d357987181ee 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.txt
+++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
@@ -17,6 +17,20 @@ Optional properties:
 - self-powered: Set this property if the usb device that has its own power
   source.
 
+Optional properties for usb-b-connector:
+- id-gpios: an input gpio for USB ID pin.
+- vbus-gpios: an input gpio for USB VBUS pin, used to detect presence of
+  VBUS 5V.
+  see gpio/gpio.txt.
+- vbus-supply: a phandle to the regulator for USB VBUS if needed when host
+  mode or dual role mode is supported.
+  Particularly, if use an output GPIO to control a VBUS regulator, should
+  model it as a regulator.
+  see regulator/fixed-regulator.yaml
+- pinctrl-names : a pinctrl state named "default" is optional
+- pinctrl-0 : pin control group
+  see pinctrl/pinctrl-bindings.txt
+
 Optional properties for usb-c-connector:
 - power-role: should be one of "source", "sink" or "dual"(DRP) if typec
   connector has power support.
-- 
2.21.0
