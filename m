From: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] syscon: dt-bindings: Add binding document for iProc MHB block
Date: Wed,  6 Sep 2017 17:27:42 -0700
Message-ID: <1504744062-5941-3-git-send-email-ray.jui@broadcom.com>
References: <1504744062-5941-1-git-send-email-ray.jui@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504744062-5941-1-git-send-email-ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add binding document for Broadcom iProc's Multi-Host Bridge (MHB)
block

Signed-off-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reviewed-by: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/mfd/brcm,iproc-mhb.txt         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,iproc-mhb.txt

diff --git a/Documentation/devicetree/bindings/mfd/brcm,iproc-mhb.txt b/Documentation/devicetree/bindings/mfd/brcm,iproc-mhb.txt
new file mode 100644
index 0000000..4421e97
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,iproc-mhb.txt
@@ -0,0 +1,18 @@
+Broadcom iProc Multi Host Bridge (MHB)
+
+Certain Broadcom iProc SoCs have a multi host bridge (MHB) block that controls
+the connection and configuration of 1) internal PCIe serdes; 2) PCIe endpoint
+interface; 3) access to the Nitro (network processing) engine
+
+This node allows access to these MHB registers via syscon.
+
+Required properties:
+- compatible: should contain:
+		"brcm,sr-mhb", "syscon" for Stingray
+- reg: base address and range of the MHB registers
+
+Example:
+	mhb: syscon@60401000 {
+		compatible = "brcm,sr-mhb", "syscon";
+		reg = <0 0x60401000 0 0x38c>;
+	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
