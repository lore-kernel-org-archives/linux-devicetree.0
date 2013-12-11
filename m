From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH 2/5] dt/bindings: Remove references to linux,phandle properties
Date: Wed, 11 Dec 2013 11:15:52 +0000
Message-ID: <1386760555-22732-3-git-send-email-grant.likely@linaro.org>
References: <1386760555-22732-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1386760555-22732-1-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The linux,phandle property is essentially an internal structural element
of the DT data structure. The dtc toolchain takes care of maintaining it
at compile time. It does not need to appear as part of the binding
documentation. This patch removes it so that users don't think they need
to add a phandle property manually.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
 Documentation/devicetree/bindings/net/phy.txt                      | 3 ---
 Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/pincfg.txt | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/phy.txt b/Documentation/devicetree/bindings/net/phy.txt
index 506db4ba3e8a..85de6107b98f 100644
--- a/Documentation/devicetree/bindings/net/phy.txt
+++ b/Documentation/devicetree/bindings/net/phy.txt
@@ -10,8 +10,6 @@ Required properties:
  - interrupt-parent : the phandle for the interrupt controller that
    services interrupts for this device.
  - reg : The ID number for the phy, usually a small integer
- - linux,phandle :  phandle for this node; likely referenced by an
-   ethernet controller node.
 
 Optional Properties:
 
@@ -26,7 +24,6 @@ Example:
 
 ethernet-phy@0 {
 	compatible = "ethernet-phy-ieee802.3-c22";
-	linux,phandle = <2452000>;
 	interrupt-parent = <40000>;
 	interrupts = <35 1>;
 	reg = <0>;
diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/pincfg.txt b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/pincfg.txt
index c5b43061db3a..ec6ee2e864a2 100644
--- a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/pincfg.txt
+++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/qe/pincfg.txt
@@ -1,8 +1,6 @@
 * Pin configuration nodes
 
 Required properties:
-- linux,phandle : phandle of this node; likely referenced by a QE
-  device.
 - pio-map : array of pin configurations.  Each pin is defined by 6
   integers.  The six numbers are respectively: port, pin, dir,
   open_drain, assignment, has_irq.
@@ -29,7 +27,6 @@ Required properties:
 
 Example:
      ucc_pin@01 {
-	linux,phandle = <140001>;
 	pio-map = <
 	/* port  pin  dir  open_drain  assignment  has_irq */
 		0  3  1  0  1  0 	/* TxD0 */
-- 
1.8.3.2
