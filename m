From: Steve Lin <steven.lin1@broadcom.com>
Subject: [PATCH 2/2] ARM: dts: NSP: Add mailbox (PDC) to NSP
Date: Wed, 22 Feb 2017 15:42:26 -0500
Message-ID: <1487796146-14690-3-git-send-email-steven.lin1@broadcom.com>
References: <1487796146-14690-1-git-send-email-steven.lin1@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487796146-14690-1-git-send-email-steven.lin1@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jassisinghbrar@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, ray.jui@broadcom.com, scott.branden@broadcom.com, jon.mason@broadcom.com, linux@armlinux.org.uk, rob.rice@broadcom.com
Cc: devicetree@vger.kernel.org, Steve Lin <steven.lin1@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Adds mailbox / PDC to NSP device tree.  Needs new compatibility string
to differentiate from NS2 version.

Signed-off-by: Steve Lin <steven.lin1@broadcom.com>
---
 .../devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt          | 6 ++++--
 arch/arm/boot/dts/bcm-nsp.dtsi                                   | 9 +++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

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
diff --git a/arch/arm/boot/dts/bcm-nsp.dtsi b/arch/arm/boot/dts/bcm-nsp.dtsi
index 15f07f9..8b56d74 100644
--- a/arch/arm/boot/dts/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/bcm-nsp.dtsi
@@ -227,6 +227,15 @@
 			status = "disabled";
 		};
 
+		mailbox: mailbox@25000 {
+			compatible = "brcm,iproc-fa2-mbox";
+			reg = <0x25000 0x445>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+			brcm,rx-status-len = <32>;
+			brcm,use-bcm-hdr;
+		};
+
 		nand: nand@26000 {
 			compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1";
 			reg = <0x026000 0x600>,
-- 
2.1.0
