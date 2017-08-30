From: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Subject: [patch v2 2/2] dt-bindings: hwmon: add binding documentation for max6621 device
Date: Wed, 30 Aug 2017 21:55:57 +0000
Message-ID: <1504130157-108257-3-git-send-email-vadimp@mellanox.com>
References: <1504130157-108257-1-git-send-email-vadimp@mellanox.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504130157-108257-1-git-send-email-vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiri-rHqAuBHg3fBzbRFIqnYvSA@public.gmane.org, Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add binding document for Maxim MAX6621 temperature sensor device.

Signed-off-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/hwmon/max6621.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/max6621.txt

diff --git a/Documentation/devicetree/bindings/hwmon/max6621.txt b/Documentation/devicetree/bindings/hwmon/max6621.txt
new file mode 100644
index 0000000..c1f7e95
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/max6621.txt
@@ -0,0 +1,14 @@
+MAX6621 temperature sensor
+-------------------------
+
+This device supports I2C only.
+
+Requires node properties:
+- compatible : "maxim,max6621"
+- reg : the I2C address of the device.
+
+Example:
+	max6621@2b {
+		compatible = "maxim,max6621";
+		reg = <0x2b>;
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
