From: Aleksandar Markovic <aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v9 1/3] Documentation: Add device tree binding for Goldfish PIC driver
Date: Wed, 15 Nov 2017 14:42:18 +0100
Message-ID: <1510753368-16453-2-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1510753368-16453-1-git-send-email-aleksandar.markovic@rt-rk.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510753368-16453-1-git-send-email-aleksandar.markovic-FblTVreYubkAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Miodrag Dinic <miodrag.dinic-8NJIiSa5LzA@public.gmane.org>, Goran Ferenc <goran.ferenc-8NJIiSa5LzA@public.gmane.org>, Aleksandar Markovic <aleksandar.markovic-8NJIiSa5LzA@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Leung <douglas.leung-8NJIiSa5LzA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Paul Burton <paul.burton-8NJIiSa5LzA@public.gmane.org>, Petar Jovanovic <petar.jovanovic-8NJIiSa5LzA@public.gmane.org>, Raghu Gandham <raghu.gandham-8NJIiSa5LzA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Miodrag Dinic <miodrag.dinic-8NJIiSa5LzA@public.gmane.org>

Add documentation for DT binding of Goldfish PIC driver. The compatible
string used by OS for binding the driver is "google,goldfish-pic".

Signed-off-by: Miodrag Dinic <miodrag.dinic-8NJIiSa5LzA@public.gmane.org>
Signed-off-by: Goran Ferenc <goran.ferenc-8NJIiSa5LzA@public.gmane.org>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic-8NJIiSa5LzA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../interrupt-controller/google,goldfish-pic.txt   | 30 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
new file mode 100644
index 0000000..35f7527
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
@@ -0,0 +1,30 @@
+Android Goldfish PIC
+
+Android Goldfish programmable interrupt device used by Android
+emulator.
+
+Required properties:
+
+- compatible : should contain "google,goldfish-pic"
+- reg        : <registers mapping>
+- interrupts : <interrupt mapping>
+
+Example for mips when used in cascade mode:
+
+        cpuintc {
+                #interrupt-cells = <0x1>;
+                #address-cells = <0>;
+                interrupt-controller;
+                compatible = "mti,cpu-interrupt-controller";
+        };
+
+        interrupt-controller@1f000000 {
+                compatible = "google,goldfish-pic";
+                reg = <0x1f000000 0x1000>;
+
+                interrupt-controller;
+                #interrupt-cells = <0x1>;
+
+                interrupt-parent = <&cpuintc>;
+                interrupts = <0x2>;
+        };
diff --git a/MAINTAINERS b/MAINTAINERS
index 650aa0e..998e705 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -872,6 +872,11 @@ S:	Supported
 F:	drivers/android/
 F:	drivers/staging/android/
 
+ANDROID GOLDFISH PIC DRIVER
+M:	Miodrag Dinic <miodrag.dinic-8NJIiSa5LzA@public.gmane.org>
+S:	Supported
+F:	Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
+
 ANDROID GOLDFISH RTC DRIVER
 M:	Miodrag Dinic <miodrag.dinic-8NJIiSa5LzA@public.gmane.org>
 S:	Supported
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
