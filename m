From: Steve Lin <steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 3/3] dt-bindings: mailbox: Update doc with NSP PDC/mailbox support
Date: Thu, 23 Feb 2017 09:49:52 -0500
Message-ID: <1487861392-23039-4-git-send-email-steven.lin1@broadcom.com>
References: <1487861392-23039-1-git-send-email-steven.lin1@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487861392-23039-1-git-send-email-steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Update the DT bindings documentation to reflect the new NSP version
of PDC driver compatibility string.

Signed-off-by: Steve Lin <steven.lin1-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
index 411ccf4..0f3ee81 100644
--- a/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
+++ b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
@@ -1,9 +1,11 @@
 The PDC driver manages data transfer to and from various offload engines
 on some Broadcom SoCs. An SoC may have multiple PDC hardware blocks. There is
-one device tree entry per block.
+one device tree entry per block.  On some chips, the PDC functionality is
+handled by the FA2 (Northstar Plus).
 
 Required properties:
-- compatible : Should be "brcm,iproc-pdc-mbox".
+- compatible : Should be "brcm,iproc-pdc-mbox" or "brcm,iproc-fa2-mbox" for
+  FA2/Northstar Plus.
 - reg: Should contain PDC registers location and length.
 - interrupts: Should contain the IRQ line for the PDC.
 - #mbox-cells: 1
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
