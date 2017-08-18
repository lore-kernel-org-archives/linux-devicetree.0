From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Subject: [PATCH v4 6/8] Documentation: Add device tree binding for Goldfish FB driver
Date: Fri, 18 Aug 2017 15:08:58 +0200
Message-ID: <1503061833-26563-7-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1503061833-26563-1-git-send-email-aleksandar.markovic@rt-rk.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503061833-26563-1-git-send-email-aleksandar.markovic@rt-rk.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Aleksandar Markovic <aleksandar.markovic@imgtec.com>, Miodrag Dinic <miodrag.dinic@imgtec.com>, Goran Ferenc <goran.ferenc@imgtec.com>, Bo Hu <bohu@google.com>, David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org, Douglas Leung <douglas.leung@imgtec.com>, dri-devel@lists.freedesktop.org, James Hogan <james.hogan@imgtec.com>, Jin Qian <jinqian@google.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Paul Burton <paul.burton@imgtec.com>, Petar Jovanovic <petar.jovanovic@imgtec.com>, Raghu Gandham <raghu.gandham@imgtec.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Add documentation for DT binding of Goldfish FB driver. The compatible
string used by OS for binding the driver is "google,goldfish-fb".

Signed-off-by: Miodrag Dinic <miodrag.dinic@imgtec.com>
Signed-off-by: Goran Ferenc <goran.ferenc@imgtec.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 .../devicetree/bindings/display/google,goldfish-fb.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt

diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt b/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
new file mode 100644
index 0000000..9ce0615
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
@@ -0,0 +1,18 @@
+Android Goldfish framebuffer
+
+Android Goldfish framebuffer device used by Android emulator.
+
+Required properties:
+
+- compatible : should contain "google,goldfish-fb"
+- reg        : <registers mapping>
+- interrupts : <interrupt mapping>
+
+Example:
+
+	goldfish_fb@1f008000 {
+		compatible = "google,goldfish-fb";
+		interrupts = <0x10>;
+		reg = <0x1f008000 0x0 0x100>;
+		compatible = "google,goldfish-fb";
+	};
-- 
2.7.4
