From: Philipp Puschmann <philipp.puschmann@emlix.com>
Subject: [PATCH v2,1/2] dt-bindings: usb: ci-hdrc-usb2: add property power-active-high
Date: Wed, 16 Jan 2019 11:51:02 +0100
Message-ID: <20190116105103.28842-1-philipp.puschmann@emlix.com>
References: <20190115123113.20577-1-philipp.puschmann@emlix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115123113.20577-1-philipp.puschmann@emlix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, Peter.Chen@nxp.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, philipp.puschmann@emlix.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Philipp Puschmann <philipp.puschmann@emlix.com>

---

V2: unchanged ...

---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
index adae82385dd6..8696e3eff6e7 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
@@ -93,6 +93,7 @@ i.mx specific properties
 - over-current-active-low: over current signal polarity is active low.
 - over-current-active-high: over current signal polarity is active high.
   It's recommended to specify the over current polarity.
+- power-active-high: power signal polarity is high active (only for imx6q/dl)
 - external-vbus-divider: enables off-chip resistor divider for Vbus
 
 Example:
-- 
2.20.1
