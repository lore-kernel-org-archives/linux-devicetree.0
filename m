From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Subject: [PATCH v4 2/4] dt-bindings: connector: Add vbus-supply property
Date: Thu,  7 Feb 2019 12:17:32 +0100
Message-ID: <20190207111734.24171-3-jorge.ramirez-ortiz@linaro.org>
References: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jorge.ramirez-ortiz@linaro.org, robh@kernel.org, bjorn.andersson@linaro.org
Cc: swboyd@chromium.org, andy.gross@linaro.org, shawn.guo@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
List-Id: devicetree@vger.kernel.org

Some phys might need to control their VBUS regulators while not being
supplied by them. If such support is required, use the vbus-supply
property in the connector to retrieve the regulator.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 Documentation/devicetree/bindings/connector/usb-connector.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
index a9a2f2fc44f2..2ad22dd6dc39 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.txt
+++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
@@ -16,6 +16,10 @@ Optional properties:
   non-fullsize connectors: "mini", "micro".
 - self-powered: Set this property if the usb device that has its own power
   source.
+- vbus-supply:
+    Value type: <phandle>
+    Definition: phandle to the regulator VBUS supply node. Set this property if
+		 the connector is supplied by VBUS.
 
 Optional properties for usb-c-connector:
 - power-role: should be one of "source", "sink" or "dual"(DRP) if typec
-- 
2.20.1
