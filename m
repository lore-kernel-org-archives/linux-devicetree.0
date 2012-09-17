From: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Subject: [PATCH v5 06/17] docs: Xen ARM DT bindings
Date: Mon, 17 Sep 2012 18:38:52 +0100
Message-ID: <1347903543-2135-6-git-send-email-stefano.stabellini@eu.citrix.com>
References: <alpine.DEB.2.02.1209171215490.29232@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1209171215490.29232-7Z66fg9igcxYtxbxJUhB2Dgeux46jI+i@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, xen-devel-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, tim-LM2mM/qkH7s@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a doc to describe the Xen ARM device tree bindings


Changes in v5:

- add a comment about the size of the grant table memory region;
- add a comment about the required presence of a GIC node;
- specify that the described properties are part of a top-level
"hypervisor" node;
- specify #address-cells and #size-cells for the example.


Changes in v4:

- "xen,xen" should be last as it is less specific;
- update reg property using 2 address-cells and 2 size-cells.


Signed-off-by: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
CC: David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
CC: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
CC: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/xen.txt |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/xen.txt

diff --git a/Documentation/devicetree/bindings/arm/xen.txt b/Documentation/devicetree/bindings/arm/xen.txt
new file mode 100644
index 0000000..0f7b9c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/xen.txt
@@ -0,0 +1,25 @@
+* Xen hypervisor device tree bindings
+
+Xen ARM virtual platforms shall have a top-level "hypervisor" node with
+the following properties:
+
+- compatible:
+	compatible = "xen,xen-<version>", "xen,xen";
+  where <version> is the version of the Xen ABI of the platform.
+
+- reg: specifies the base physical address and size of a region in
+  memory where the grant table should be mapped to, using an
+  HYPERVISOR_memory_op hypercall. The memory region is large enough to map
+  the whole grant table (it is larger or equal to gnttab_max_grant_frames()).
+
+- interrupts: the interrupt used by Xen to inject event notifications.
+  A GIC node is also required.
+
+
+Example (assuming #address-cells = <2> and #size-cells = <2>):
+
+hypervisor {
+	compatible = "xen,xen-4.3", "xen,xen";
+	reg = <0 0xb0000000 0 0x20000>;
+	interrupts = <1 15 0xf08>;
+};
-- 
1.7.2.5
