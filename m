From: <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH] doc: add bindings document for altera fpga manager
Date: Fri, 9 Jan 2015 13:00:53 -0600
Message-ID: <1420830053-21299-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

New bindings document for Altera fpga manager.

Signed-off-by: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v5 : Move bindings to drivers/staging/fpga/Documentation/bindings

v6 : No change in this patch for v6 of the patch set

v7 : No change in this patch for v7 of the patch set

v8 : Make compatible string and name of bindings doc more chip
     specific

v9 : Move bindings document from drivers/staging to Documentation
---
 .../bindings/fpga/altera-socfpga-fpga-mgr.txt      |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt

diff --git a/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
new file mode 100644
index 0000000..9b027a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
@@ -0,0 +1,17 @@
+Altera SOCFPGA FPGA Manager
+
+Required properties:
+- compatible : should contain "altr,socfpga-fpga-mgr"
+- reg        : base address and size for memory mapped io.
+               - The first index is for FPGA manager register access.
+               - The second index is for writing FPGA configuration data.
+- interrupts : interrupt for the FPGA Manager device.
+
+Example:
+
+	hps_0_fpgamgr: fpgamgr@0xff706000 {
+		compatible = "altr,socfpga-fpga-mgr";
+		reg = <0xFF706000 0x1000
+		       0xFFB90000 0x1000>;
+		interrupts = <0 175 4>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
