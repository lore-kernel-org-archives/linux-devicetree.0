From: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 1/6] dt-bindings: misc: Add Aspeed XDMA engine binding documentation
Date: Mon,  4 Mar 2019 15:36:55 -0600
Message-ID: <1551735420-16202-2-git-send-email-eajames@linux.ibm.com>
References: <1551735420-16202-1-git-send-email-eajames@linux.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551735420-16202-1-git-send-email-eajames@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org, jk@ozlabs.org, openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>
List-Id: devicetree@vger.kernel.org

Document the bindings.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 .../devicetree/bindings/misc/aspeed,xdma.txt       | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/aspeed,xdma.txt

diff --git a/Documentation/devicetree/bindings/misc/aspeed,xdma.txt b/Documentation/devicetree/bindings/misc/aspeed,xdma.txt
new file mode 100644
index 0000000..85e82ea
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/aspeed,xdma.txt
@@ -0,0 +1,23 @@
+* Device tree bindings for the Aspeed XDMA engine
+
+The XDMA Engine embedded in the AST2500 SOC can perform automatic DMA
+operations over PCI between the AST2500 (acting as a BMC) and a host processor.
+
+Required properties:
+
+ - compatible		"aspeed,ast2500-xdma"
+ - reg			contains the offset and length of the memory region
+			assigned to the XDMA registers
+ - resets		reset specifier for the syscon reset associated with
+			the XDMA engine
+ - interrupts		the interrupt associated with the XDMA engine on this
+			platform
+
+Example:
+
+    xdma@1e6e7000 {
+        compatible = "aspeed,ast2500-xdma";
+        reg = <0x1e6e7000 0x100>;
+        resets = <&syscon ASPEED_RESET_XDMA>;
+        interrupts = <6>;
+    };
-- 
1.8.3.1
