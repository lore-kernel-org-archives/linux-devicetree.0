From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 02/28] dt-bindings: ascii-lcd: Document a binding for simple ASCII LCDs
Date: Mon, 30 Nov 2015 16:21:27 +0000
Message-ID: <1448900513-20856-3-git-send-email-paul.burton@imgtec.com>
References: <1448900513-20856-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448900513-20856-1-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add documentation for a devicetree binding for simple memory-mapped
ASCII LCD displays, such as those found on the Imagination Technologies
Boston & Malta development boards.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
---

 Documentation/devicetree/bindings/ascii-lcd.txt | 10 ++++++++++
 MAINTAINERS                                     |  5 +++++
 2 files changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ascii-lcd.txt

diff --git a/Documentation/devicetree/bindings/ascii-lcd.txt b/Documentation/devicetree/bindings/ascii-lcd.txt
new file mode 100644
index 0000000..40ae536
--- /dev/null
+++ b/Documentation/devicetree/bindings/ascii-lcd.txt
@@ -0,0 +1,10 @@
+Binding for simple memory-mapped ASCII LCD displays
+
+Required properties:
+- compatible : should be one of:
+    "img,boston-lcd"
+    "mti,malta-lcd"
+- reg : memory region locating the device registers
+
+The layout of the registers & properties of the display are determined
+from the compatible string, making this binding somewhat trivial.
diff --git a/MAINTAINERS b/MAINTAINERS
index cba790b..1e2b74b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1782,6 +1782,11 @@ S:	Maintained
 F:	Documentation/hwmon/asc7621
 F:	drivers/hwmon/asc7621.c
 
+ASCII LCD DRIVER
+M:	Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/ascii-lcd.txt
+
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 L:	acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
