From: <sean.wang@mediatek.com>
Subject: [PATCH v1 1/4] dt-bindings: net: bluetooth: add boot-gpios property to UART-based device
Date: Sun, 2 Jun 2019 09:04:14 +0800
Message-ID: <1559437457-26766-2-git-send-email-sean.wang@mediatek.com>
References: <1559437457-26766-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559437457-26766-1-git-send-email-sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Not every platform has the pinctrl device integrates the GPIO the function
such as MT7621 whose pinctrl and GPIO are separate hardware so adding an
additional boot-gpios property for such platform allows them to bring up
the device.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../devicetree/bindings/net/mediatek-bluetooth.txt  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
index 41a7dcc80f5b..14f23b354a6d 100644
--- a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
@@ -50,11 +50,24 @@ Required properties:
 		  "mediatek,mt7663u-bluetooth": for MT7663U device
 		  "mediatek,mt7668u-bluetooth": for MT7668U device
 - vcc-supply:	Main voltage regulator
+
+If the pin controller on the platform can support both pinmux and GPIO
+control such as the most of MediaTek platform. Please use below properties.
+
 - pinctrl-names: Should be "default", "runtime"
 - pinctrl-0: Should contain UART RXD low when the device is powered up to
 	     enter proper bootstrap mode.
 - pinctrl-1: Should contain UART mode pin ctrl
 
+Else, the pin controller on the platform only can support pinmux control and
+the GPIO control still has to rely on the dedicated GPIO controller such as
+a legacy MediaTek SoC, MT7621. Please use the below properties.
+
+- boot-gpios:	GPIO same to the pin as UART RXD and used to keep LOW when
+		the device is powered up to enter proper bootstrap mode when
+- pinctrl-names: Should be "default"
+- pinctrl-0: Should contain UART mode pin ctrl
+
 Optional properties:
 
 - reset-gpios:	GPIO used to reset the device whose initial state keeps low,
-- 
2.17.1
