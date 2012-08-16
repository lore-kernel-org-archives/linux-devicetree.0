From: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
Subject: [PATCH v3 06/25] docs: Xen ARM DT bindings
Date: Thu, 16 Aug 2012 16:35:58 +0100
Message-ID: <1345131377-14713-6-git-send-email-stefano.stabellini@eu.citrix.com>
References: <alpine.DEB.2.02.1208161618550.4850@kaball.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1208161618550.4850-7Z66fg9igcxYtxbxJUhB2Dgeux46jI+i@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: xen-devel-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Ian.Campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, tim-LM2mM/qkH7s@public.gmane.org, David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a doc to describe the Xen ARM device tree bindings

Signed-off-by: Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>
CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
CC: David Vrabel <david.vrabel-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/xen.txt |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/xen.txt

diff --git a/Documentation/devicetree/bindings/arm/xen.txt b/Documentation/devicetree/bindings/arm/xen.txt
new file mode 100644
index 0000000..ec6d884
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/xen.txt
@@ -0,0 +1,22 @@
+* Xen hypervisor device tree bindings
+
+Xen ARM virtual platforms shall have the following properties:
+
+- compatible:
+	compatible = "xen,xen", "xen,xen-<version>";
+  where <version> is the version of the Xen ABI of the platform.
+
+- reg: specifies the base physical address and size of a region in
+  memory where the grant table should be mapped to, using an
+  HYPERVISOR_memory_op hypercall. 
+
+- interrupts: the interrupt used by Xen to inject event notifications.
+
+
+Example:
+
+hypervisor {
+	compatible = "xen,xen", "xen,xen-4.3";
+	reg = <0xb0000000 0x20000>;
+	interrupts = <1 15 0xf08>;
+};
-- 
1.7.2.5
