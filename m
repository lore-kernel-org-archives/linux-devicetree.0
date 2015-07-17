From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/6] mailbox: dt: Supply bindings for ST's Mailbox IP
Date: Fri, 17 Jul 2015 13:04:02 +0100
Message-ID: <1437134647-28298-2-git-send-email-lee.jones@linaro.org>
References: <1437134647-28298-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1437134647-28298-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, Lee Jones <lee.jones@linaro.org>, kernel@stlinux.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../devicetree/bindings/mailbox/sti-mailbox.txt    | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/sti-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
new file mode 100644
index 0000000..3390e3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
@@ -0,0 +1,53 @@
+ST Microelectronics Mailbox Driver
+
+Each ST Mailbox IP currently consists of 4 instances of 32 channels.  Messages
+are passed between Application and Remote processors using shared memory.
+
+Controller
+----------
+
+Required properties:
+- compatible		: Should be "st,stih407-mailbox"
+- reg			: Offset and length of the device's register set
+- mbox-name		: Name of the mailbox
+- #mbox-cells:		: Must be 3
+			  <&phandle instance channel direction>
+			    phandle   : Label name of controller
+			    instance  : Instance number
+			    channel   : Channel number
+			    direction : Data flow direction; MBOX_TX or MBOX_RX
+
+Optional properties
+- interrupts		: Contains the IRQ line for a Rx mailbox
+			    [NB: The absence of this property denotes Tx only]
+
+Example:
+
+mailbox0: mailbox@0  {
+	compatible	= "st,stih407-mailbox";
+	reg		= <0x8f00000 0x1000>;
+	interrupts	= <GIC_SPI 1 IRQ_TYPE_NONE>;
+	#mbox-cells	= <3>;
+	mbox-name	= "a9";
+};
+
+Client
+------
+
+Required properties:
+- compatible		: Many (See the client docs)
+- reg			: Shared (between Application and Remote) memory address
+- mboxes		: Standard property to specify a Mailbox (See ./mailbox.txt)
+			  Cells must match 'mbox-cells' (See Controller docs above)
+
+Optional properties
+- mbox-names		: Name given to channels seen in the 'mboxes' property.
+
+Example:
+
+mailbox_test {
+	compatible	= "mailbox_test";
+	reg		= <0x[shared_memory_address], [shared_memory_size]>;
+	mboxes		= <&mailbox2 0 1 MBOX_TX>, <&mailbox0 2 1 MBOX_RX>;
+	mbox-names	= "tx",	"rx";
+};
-- 
1.9.1
