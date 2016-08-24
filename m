From: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Subject: [PATCH 2/2] hwmon: (max6650) Add initial rpm target devicetree documentation
Date: Wed, 24 Aug 2016 10:13:27 +0200
Message-ID: <1472026407-3448-2-git-send-email-mike.looijmans@topic.nl>
References: <1472026407-3448-1-git-send-email-mike.looijmans@topic.nl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472026407-3448-1-git-send-email-mike.looijmans-Oq418RWZeHk@public.gmane.org>
In-Reply-To: <5f14ba10-60dd-0e0a-dcd0-f8bbbed33510-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add devicetree property for early initialization of the fan controller
to prevent overheating, for example when resetting the board while the
fan was completely turned off.

Signed-off-by: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
---
 Documentation/devicetree/bindings/hwmon/max6650.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/max6650.txt b/Documentation/devicetree/bindings/hwmon/max6650.txt
index d6c10e3..f6bd87d 100644
--- a/Documentation/devicetree/bindings/hwmon/max6650.txt
+++ b/Documentation/devicetree/bindings/hwmon/max6650.txt
@@ -13,6 +13,10 @@ Optional properties, default is to retain the chip's current setting:
 - maxim,fan-prescale  : Pre-scaling value, as per datasheet [1]. Lower values
 			allow more fine-grained control of slower fans.
 			Valid: 1, 2, 4, 8, 16.
+- maxim,fan-target-rpm: Initial requested fan rotation speed. If specified, the
+			driver selects closed-loop mode and the requested speed.
+			This ensures the fan is already running before userspace
+			takes over.
 
 Example:
 	fan-max6650: max6650@1b {
@@ -20,4 +24,5 @@ Example:
 		compatible = "maxim,max6650";
 		maxim,fan-microvolt = <12000000>;
 		maxim,fan-prescale = <4>;
+		maxim,fan-target-rpm = <1200>;
 	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
