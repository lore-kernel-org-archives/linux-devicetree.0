From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/10] dt-bindings: create arm/nxp folder and move LPC32xx SoC description to it
Date: Fri, 20 Nov 2015 03:28:36 +0200
Message-ID: <1447982925-30138-2-git-send-email-vz@mleia.com>
References: <1447982925-30138-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447982925-30138-1-git-send-email-vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Create a separate folder for device tree bindings of NXP SoCs devices,
and move lpc32xx.txt to it.

Signed-off-by: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/lpc32xx.txt     | 8 --------
 Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/lpc32xx.txt
 create mode 100644 Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt

diff --git a/Documentation/devicetree/bindings/arm/lpc32xx.txt b/Documentation/devicetree/bindings/arm/lpc32xx.txt
deleted file mode 100644
index 56ec8dd..0000000
--- a/Documentation/devicetree/bindings/arm/lpc32xx.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-NXP LPC32xx Platforms Device Tree Bindings
-------------------------------------------
-
-Boards with the NXP LPC32xx SoC shall have the following properties:
-
-Required root node property:
-
-compatible: must be "nxp,lpc3220", "nxp,lpc3230", "nxp,lpc3240" or "nxp,lpc3250"
diff --git a/Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt
new file mode 100644
index 0000000..56ec8dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt
@@ -0,0 +1,8 @@
+NXP LPC32xx Platforms Device Tree Bindings
+------------------------------------------
+
+Boards with the NXP LPC32xx SoC shall have the following properties:
+
+Required root node property:
+
+compatible: must be "nxp,lpc3220", "nxp,lpc3230", "nxp,lpc3240" or "nxp,lpc3250"
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
