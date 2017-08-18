From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Subject: [PATCH v4 3/8] Documentation: Add device tree binding for Goldfish PIC driver
Date: Fri, 18 Aug 2017 15:08:55 +0200
Message-ID: <1503061833-26563-4-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1503061833-26563-1-git-send-email-aleksandar.markovic@rt-rk.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503061833-26563-1-git-send-email-aleksandar.markovic@rt-rk.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Aleksandar Markovic <aleksandar.markovic@imgtec.com>, Miodrag Dinic <miodrag.dinic@imgtec.com>, Goran Ferenc <goran.ferenc@imgtec.com>, Bo Hu <bohu@google.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Douglas Leung <douglas.leung@imgtec.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Hogan <james.hogan@imgtec.com>, Jason Cooper <jason@lakedaemon.net>, Jin Qian <jinqian@google.com>, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Burton <paul.burton@imgtec.com>, Petar Jovanovic <petar.jovanovic@imgtec.com>, Raghu Gandham <raghu.gandham@imgtec.com>, Randy Dunlap <rdunlap@infradead.org>
List-Id: devicetree@vger.kernel.org

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Add documentation for DT binding of Goldfish PIC driver. The compatible
string used by OS for binding the driver is "google,goldfish-pic".

Signed-off-by: Miodrag Dinic <miodrag.dinic@imgtec.com>
Signed-off-by: Goran Ferenc <goran.ferenc@imgtec.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 .../interrupt-controller/google,goldfish-pic.txt       | 18 ++++++++++++++++++
 MAINTAINERS                                            |  5 +++++
 2 files changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt b/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
new file mode 100644
index 0000000..f198762
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
@@ -0,0 +1,18 @@
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
+Example:
+
+        goldfish_pic@9020000 {
+                compatible = "google,goldfish-pic";
+                reg = <0x9020000 0x1000>;
+                interrupts = <0x3>;
+        };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3d105be..013da1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -840,6 +840,11 @@ S:	Supported
 F:	drivers/android/
 F:	drivers/staging/android/
 
+ANDROID GOLDFISH PIC DRIVER
+M:	Miodrag Dinic <miodrag.dinic@imgtec.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.txt
+
 ANDROID GOLDFISH RTC DRIVER
 M:	Miodrag Dinic <miodrag.dinic@imgtec.com>
 S:	Supported
-- 
2.7.4
