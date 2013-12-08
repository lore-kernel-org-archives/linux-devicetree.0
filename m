From: Ben Gamari <bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] dt: Describe modalias resolution in i2c/trivial-devices.txt
Date: Sun,  8 Dec 2013 16:02:18 -0500
Message-ID: <1386536538-14861-3-git-send-email-bgamari.foss@gmail.com>
References: <1386536538-14861-1-git-send-email-bgamari.foss@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386536538-14861-1-git-send-email-bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
Cc: Ben Gamari <bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

To someone with little device-tree experience these details aren't at
all obvious. Make the fact that the manufacturer prefix is dropped
explicit.

Signed-off-by: Ben Gamari <bgamari.foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index c475c3a..59bbb07 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -1,6 +1,9 @@
 This is a list of trivial i2c devices that have simple device tree
 bindings, consisting only of a compatible field, an address and
-possibly an interrupt line.
+possibly an interrupt line. The compatible field is used by lookup
+the modalias for the driver which will handle the device. A
+manufacturer prefix (separated by a comma) will be stripped off during
+this lookup.
 
 If a device needs more specific bindings, such as properties to
 describe some aspect of it, there needs to be a specific binding
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
