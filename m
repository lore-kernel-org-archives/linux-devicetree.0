From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH 2/3] Documentation: rng: Add X-Gene SoC RNG driver documentation
Date: Fri, 22 Aug 2014 16:26:39 -0700
Message-ID: <1408750000-28453-3-git-send-email-fkan@apm.com>
References: <1408750000-28453-1-git-send-email-fkan@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408750000-28453-1-git-send-email-fkan-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patches-qTEPVZfXA3Y@public.gmane.org, mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org, herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Cc: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add X-Gene SoC RNG driver documentation.

Signed-off-by: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
---
 Documentation/devicetree/bindings/rng/apm,rng.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/apm,rng.txt

diff --git a/Documentation/devicetree/bindings/rng/apm,rng.txt b/Documentation/devicetree/bindings/rng/apm,rng.txt
new file mode 100644
index 0000000..4dde4b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/apm,rng.txt
@@ -0,0 +1,17 @@
+APM X-Gene SoC random number generator.
+
+Required properties:
+
+- compatible  : should be "apm,xgene-rng"
+- reg         : specifies base physical address and size of the registers map
+- clocks      : phandle to clock-controller plus clock-specifier pair
+- interrupts  : specify the fault interrupt for the RNG device
+
+Example:
+
+	rng: rng@10520000 {
+		compatible = "apm,xgene-rng";
+		reg = <0x0 0x10520000 0x0 0x100>;
+		interrupts =   <0x0 0x41 0x4>;
+		clocks = <&rngpkaclk 0>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
