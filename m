From: Rob Rice <rob.rice@broadcom.com>
Subject: [PATCH RESEND 1/3] dt-bindings: add bindings documentation for PDC driver.
Date: Tue, 14 Jun 2016 10:02:43 -0400
Message-ID: <1465912965-35500-2-git-send-email-rob.rice@broadcom.com>
References: <1465912965-35500-1-git-send-email-rob.rice@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465912965-35500-1-git-send-email-rob.rice@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Anup Patel <anup.patel@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, rob.rice@broadcom.com, Rob Rice <rrice@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Rob Rice <rrice@broadcom.com>

Add the device tree binding documentation for the PDC hardware
in Broadcom iProc SoCs.

Signed-off-by: Rob Rice <rob.rice@broadcom.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Anup Patel <anup.patel@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 .../bindings/mailbox/brcm,iproc-pdc-mbox.txt       | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
new file mode 100644
index 0000000..411ccf4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
@@ -0,0 +1,23 @@
+The PDC driver manages data transfer to and from various offload engines
+on some Broadcom SoCs. An SoC may have multiple PDC hardware blocks. There is
+one device tree entry per block.
+
+Required properties:
+- compatible : Should be "brcm,iproc-pdc-mbox".
+- reg: Should contain PDC registers location and length.
+- interrupts: Should contain the IRQ line for the PDC.
+- #mbox-cells: 1
+- brcm,rx-status-len: Length of metadata preceding received frames, in bytes.
+
+Optional properties:
+- brcm,use-bcm-hdr:  present if a BCM header precedes each frame.
+
+Example:
+	pdc0: iproc-pdc0@0x612c0000 {
+		compatible = "brcm,iproc-pdc-mbox";
+		reg = <0 0x612c0000 0 0x445>;  /* PDC FS0 regs */
+		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <1>;   /* one cell per mailbox channel */
+		brcm,rx-status-len = <32>;
+		brcm,use-bcm-hdr;
+	};
-- 
2.1.0
