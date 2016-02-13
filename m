From: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/4] dt-bindings: Add documentation for Broadcom Vulcan
Date: Sun, 14 Feb 2016 00:16:33 +0530
Message-ID: <1455389195-31870-3-git-send-email-jchandra@broadcom.com>
References: <1455389195-31870-1-git-send-email-jchandra@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455389195-31870-1-git-send-email-jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update arm/cpus.txt to add brcm,vulcan CPU. Add documentation
for Broadcom vulcan boards in arm/bcm/brcm,vulcan.txt

Signed-off-by: Jayachandran C <jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,vulcan.txt | 9 +++++++++
 Documentation/devicetree/bindings/arm/cpus.txt            | 1 +
 2 files changed, 10 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,vulcan.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan.txt
new file mode 100644
index 0000000..dac9eb5
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,vulcan.txt
@@ -0,0 +1,9 @@
+Broadcom Vulcan device tree bindings
+------------------------------------
+
+Boards with Broadcom Vulcan shall have the following properties:
+
+Required root node property:
+
+Vulcan Evaluation Board
+compatible = "brcm,vulcan-eval", "brcm,vulcan";
diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index ae9be07..bc43ad7 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -167,6 +167,7 @@ nodes to be present and contain the properties described below.
 			    "arm,cortex-r5"
 			    "arm,cortex-r7"
 			    "brcm,brahma-b15"
+			    "brcm,vulcan"
 			    "cavium,thunder"
 			    "faraday,fa526"
 			    "intel,sa110"
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
