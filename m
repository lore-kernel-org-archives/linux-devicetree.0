From: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] arm64: dts: rename ns2.txt to brcm,ns2.txt
Date: Fri,  7 Oct 2016 14:29:12 -0700
Message-ID: <1475875752-13829-1-git-send-email-scott.branden@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rename ns2.txt to brcm,ns2.txt to match naming convention followed
by rest of Broadcom binding documentation.

Signed-off-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,ns2.txt | 9 +++++++++
 Documentation/devicetree/bindings/arm/bcm/ns2.txt      | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,ns2.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/bcm/ns2.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.txt
new file mode 100644
index 0000000..35f056f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,ns2.txt
@@ -0,0 +1,9 @@
+Broadcom North Star 2 (NS2) device tree bindings
+------------------------------------------------
+
+Boards with NS2 shall have the following properties:
+
+Required root node property:
+
+NS2 SVK board
+compatible = "brcm,ns2-svk", "brcm,ns2";
diff --git a/Documentation/devicetree/bindings/arm/bcm/ns2.txt b/Documentation/devicetree/bindings/arm/bcm/ns2.txt
deleted file mode 100644
index 35f056f..0000000
--- a/Documentation/devicetree/bindings/arm/bcm/ns2.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-Broadcom North Star 2 (NS2) device tree bindings
-------------------------------------------------
-
-Boards with NS2 shall have the following properties:
-
-Required root node property:
-
-NS2 SVK board
-compatible = "brcm,ns2-svk", "brcm,ns2";
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
