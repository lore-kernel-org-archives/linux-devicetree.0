From: Philipp Puschmann <philipp.puschmann@emlix.com>
Subject: [PATCH v4 1/2] dt-bindings: usb: ci-hdrc-usb2: add property power-active-high
Date: Wed, 23 Jan 2019 15:31:02 +0100
Message-ID: <20190123143103.16891-1-philipp.puschmann@emlix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Peter.Chen@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Philipp Puschmann <philipp.puschmann@emlix.com>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

The i.MX USB controller may drive the usb power line directly, but the
polarity depends on the board. Reset state of the polarity is low-active so
add this property to allow it to be high-active.

Signed-off-by: Philipp Puschmann <philipp.puschmann@emlix.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Changes in v4: do not limit to i.MX6

 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index adae82385dd6..a254386a91ad 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -93,6 +93,7 @@ i.mx specific properties
 - over-current-active-low: over current signal polarity is active low.
 - over-current-active-high: over current signal polarity is active high.
   It's recommended to specify the over current polarity.
+- power-active-high: power signal polarity is active high
 - external-vbus-divider: enables off-chip resistor divider for Vbus
 
 Example:
-- 
2.20.1
