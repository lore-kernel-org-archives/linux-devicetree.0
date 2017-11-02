From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Subject: [PATCH v7 3/5] Documentation: Add device tree binding for Goldfish FB driver
Date: Thu,  2 Nov 2017 17:21:22 +0100
Message-ID: <1509639716-4787-4-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1509639716-4787-1-git-send-email-aleksandar.markovic@rt-rk.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509639716-4787-1-git-send-email-aleksandar.markovic@rt-rk.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Aleksandar Markovic <aleksandar.markovic@mips.com>, Miodrag Dinic <miodrag.dinic@mips.com>, Goran Ferenc <goran.ferenc@mips.com>, David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org, Douglas Leung <douglas.leung@mips.com>, dri-devel@lists.freedesktop.org, James Hogan <james.hogan@mips.com>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Paul Burton <paul.burton@mips.com>, Petar Jovanovic <petar.jovanovic@mips.com>, Raghu Gandham <raghu.gandham@mips.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Aleksandar Markovic <aleksandar.markovic@mips.com>

Add documentation for DT binding of Goldfish FB driver. The compatible
string used by OS for binding the driver is "google,goldfish-fb".

Signed-off-by: Miodrag Dinic <miodrag.dinic@mips.com>
Signed-off-by: Goran Ferenc <goran.ferenc@mips.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@mips.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/google,goldfish-fb.txt  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/google,goldfish-fb.txt

diff --git a/Documentation/devicetree/bindings/display/google,goldfish-fb.txt b/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
new file mode 100644
index 0000000..751fa9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/google,goldfish-fb.txt
@@ -0,0 +1,17 @@
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
+	display-controller@1f008000 {
+		compatible = "google,goldfish-fb";
+		interrupts = <0x10>;
+		reg = <0x1f008000 0x100>;
+	};
-- 
2.7.4
