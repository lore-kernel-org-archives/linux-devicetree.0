From: <sean.wang@mediatek.com>
Subject: [PATCH v1 2/4] dt-bindings: net: bluetooth: add clock property to UART-based device
Date: Sun, 2 Jun 2019 09:04:15 +0800
Message-ID: <1559437457-26766-3-git-send-email-sean.wang@mediatek.com>
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

Some board requires explicitily control external osscilator via GPIO.
So, add a clock property for an external oscillator for the device.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 Documentation/devicetree/bindings/net/mediatek-bluetooth.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
index 14f23b354a6d..112011c51d5e 100644
--- a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
@@ -73,6 +73,10 @@ Optional properties:
 - reset-gpios:	GPIO used to reset the device whose initial state keeps low,
 		if the GPIO is missing, then board-level design should be
 		guaranteed.
+- clocks:	Should be the clock specifiers corresponding to the entry in
+		clock-names property. If the clock is missing, then board-level
+		design should be guaranteed.
+- clock-names:	Should contain "osc" entry for the external oscillator.
 - current-speed:  Current baud rate of the device whose defaults to 921600
 
 Example:
-- 
2.17.1
