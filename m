From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCHv2 1/2] dts: Adding docs for Xilinx LogiCORE IP mailbox driver.
Date: Wed, 27 May 2015 11:35:44 -0700
Message-ID: <1432751745-17473-2-git-send-email-moritz.fischer@ettus.com>
References: <1432751745-17473-1-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1432751745-17473-1-git-send-email-moritz.fischer@ettus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jassisinghbrar@gmail.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>, arnd@arndb.de, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, gregkh@linuxfoundation.org, mchehab@osg.samsung.com, linux-kernel@vger.kernel.org, michal.simek@xilinx.com, jingoohan1@gmail.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, galak@codeaurora.org, joe@perches.com, akpm@linux-foundation.org, soren.brinkmann@xilinx.com
List-Id: devicetree@vger.kernel.org

Changes from v1:
- Added common clock framework support

Changes from v0:
- Fixed example bindings

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 .../bindings/mailbox/xilinx-mailbox.txt         | 44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
new file mode 100644
index 0000000..50d0e5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/xilinx-mailbox.txt
@@ -0,0 +1,44 @@
+Xilinx Mailbox Driver
+=====================
+
+Required properties:
+- compatible       : "xlnx,mailbox-2.1".
+- reg              :  physical base address of the mailbox and length of
+                      memory mapped region.
+- #mbox-cells      :  Common mailbox binding property to identify the number
+                      of cells required for the mailbox specifier. Should be 1.
+- clocks           :  phandle to clock provider
+- clock-names      :  must be 'mbox'
+
+Optional properties:
+- interrupt-parent : interrupt source phandle.
+- interrupts       : interrupt number. The interrupt specifier format
+                     depends on the interrupt controller parent.
+
+Example:
+	mbox: mailbox@40400000 {
+		compatible = "xlnx,axi-mailbox-2.1";
+		reg = <0x40400000 0x3c>;
+		interrupt-parent = <&intc>;
+		interrupts = <5>;
+		#mbox-cells = <1>;
+		clocks = <&clkc 15>;
+		clock-names = "mbox";
+	};
+
+Mailbox client
+===============
+"mboxes" and the optional "mbox-names" (please see
+Documentation/devicetree/bindings/mailbox/mailbox.txt for details). Each value
+of the mboxes property should contain a phandle to the mailbox controller
+device node and second argument is the channel index. It must be 0 (hardware
+support only one channel). The equivalent "mbox-names" property value can be
+used to give a name to the communication channel to be used by the client user.
+
+Example:
+	mclient0: mclient0@400 {
+		compatible = "client-1.0";
+		reg = <0x400 0x10>;
+		mbox-names = "mbox";
+		mboxes = <&mbox 0>;
+	};
-- 
2.4.1
