From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v5 7/8] Documentation: bindings: Add support for Amlogic GXBB SCPI protocol
Date: Wed,  2 Nov 2016 22:52:10 -0600
Message-ID: <1478148731-11712-8-git-send-email-sudeep.holla@arm.com>
References: <1478148731-11712-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478148731-11712-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
(decoupled from the generic scpi binding)
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 .../devicetree/bindings/arm/amlogic,scpi.txt         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic,scpi.txt

diff --git a/Documentation/devicetree/bindings/arm/amlogic,scpi.txt b/Documentation/devicetree/bindings/arm/amlogic,scpi.txt
new file mode 100644
index 000000000000..7b9a861e9306
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic,scpi.txt
@@ -0,0 +1,20 @@
+System Control and Power Interface (SCPI) Message Protocol
+(in addition to the standard binding in [0])
+----------------------------------------------------------
+Required properties
+
+- compatible : should be "amlogic,meson-gxbb-scpi"
+
+AMLOGIC SRAM and Shared Memory for SCPI
+------------------------------------
+
+Required properties:
+- compatible : should be "amlogic,meson-gxbb-sram"
+
+Each sub-node represents the reserved area for SCPI.
+
+Required sub-node properties:
+- compatible : should be "amlogic,meson-gxbb-scp-shmem" for SRAM based shared
+		memory on Amlogic GXBB SoC.
+
+[0] Documentation/devicetree/bindings/arm/arm,scpi.txt
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
