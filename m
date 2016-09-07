From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 6/8] dt-bindings: Add support for Amlogic GXBB SCPI Interface
Date: Wed,  7 Sep 2016 17:34:35 +0200
Message-ID: <1473262477-18045-7-git-send-email-narmstrong@baylibre.com>
References: <1473262477-18045-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473262477-18045-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/arm,scpi.txt | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,scpi.txt b/Documentation/devicetree/bindings/arm/arm,scpi.txt
index faa4b44..04bc171 100644
--- a/Documentation/devicetree/bindings/arm/arm,scpi.txt
+++ b/Documentation/devicetree/bindings/arm/arm,scpi.txt
@@ -7,7 +7,7 @@ by Linux to initiate various system control and power operations.
 
 Required properties:
 
-- compatible : should be "arm,scpi"
+- compatible : should be "arm,scpi" or "amlogic,meson-gxbb-scpi"
 - mboxes: List of phandle and mailbox channel specifiers
 	  All the channels reserved by remote SCP firmware for use by
 	  SCPI message protocol should be specified in any order
@@ -60,7 +60,8 @@ A small area of SRAM is reserved for SCPI communication between application
 processors and SCP.
 
 Required properties:
-- compatible : should be "arm,juno-sram-ns" for Non-secure SRAM on Juno
+- compatible : should be "arm,juno-sram-ns" for Non-secure SRAM on Juno,
+		or "amlogic,meson-gxbb-sram" for Amlogic GXBB SoC.
 
 The rest of the properties should follow the generic mmio-sram description
 found in ../../sram/sram.txt
@@ -70,7 +71,8 @@ Each sub-node represents the reserved area for SCPI.
 Required sub-node properties:
 - reg : The base offset and size of the reserved area with the SRAM
 - compatible : should be "arm,juno-scp-shmem" for Non-secure SRAM based
-	       shared memory on Juno platforms
+	       shared memory on Juno platforms or
+	       "amlogic,meson-gxbb-scp-shmem" for Amlogic GXBB SoC.
 
 Sensor bindings for the sensors based on SCPI Message Protocol
 --------------------------------------------------------------
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
