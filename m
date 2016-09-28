From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH v19 03/12] add bindings document for altera freeze bridge
Date: Wed, 28 Sep 2016 13:21:51 -0500
Message-ID: <20160928182200.15800-4-atull@opensource.altera.com>
References: <20160928182200.15800-1-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160928182200.15800-1-atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Walter Goossens <waltergoossens-CmkmPbn3yAE@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Cyril Chemparathy <cyril.chemparathy-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Josh Cartwright <joshc-acOepvfBmUk@public.gmane.org>, Matthew Gerlach <mgerlach-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add bindings document for the Altera Freeze Bridge.  A Freeze
Bridge is used to gate traffic to/from a region of a FPGA
such that that region can be reprogrammed.  The Freeze Bridge
exist in FPGA fabric that is not currently being reconfigured.

Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Signed-off-by: Matthew Gerlach <mgerlach-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
---
v19: Added in v19 of patchset, uses fpga image info struct
---
 .../bindings/fpga/altera-freeze-bridge.txt         | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-freeze-bridge.txt

diff --git a/Documentation/devicetree/bindings/fpga/altera-freeze-bridge.txt b/Documentation/devicetree/bindings/fpga/altera-freeze-bridge.txt
new file mode 100644
index 0000000..97ecc11
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-freeze-bridge.txt
@@ -0,0 +1,23 @@
+Altera Freeze Bridge Controller Driver
+
+The Altera Freeze Bridge Controller manages one or more freeze bridges.
+The controller can freeze/disable the bridges which prevents signal
+changes from passing through the bridge.  The controller can also
+unfreeze/enable the bridges which allows traffic to pass through the
+bridge normally.
+
+Required properties:
+- compatible		: Should contain "altr,freeze-bridge-controller"
+- regs			: base address and size for freeze bridge module
+
+Optional properties:
+- bridge-enable		: 0 if driver should disable bridge at startup
+			  1 if driver should enable bridge at startup
+			  Default is to leave bridge in current state.
+
+Example:
+	freeze_controller@100000450 {
+		compatible = "altr,freeze-bridge-controller";
+		regs = <0x1000 0x10>;
+		bridge-enable = <0>;
+	};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
