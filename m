From: Kaihua Zhong <zhongkaihua@huawei.com>
Subject: [PATCH v2 1/3] dt-bindings: mailbox: Introduce Hi3660 controller
 binding
Date: Fri, 27 Oct 2017 14:15:02 +0800
Message-ID: <1509084904-2505-2-git-send-email-zhongkaihua@huawei.com>
References: <1509084904-2505-1-git-send-email-zhongkaihua@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1509084904-2505-1-git-send-email-zhongkaihua@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, jassisinghbrar@gmail.com
Cc: xuezhiliang@hisilicon.com, devicetree@vger.kernel.org, guodong.xu@linaro.org, suzhuangluan@hisilicon.com, linux-kernel@vger.kernel.org, zhongkaihua@huawei.com, haojian.zhuang@linaro.org, kevin.wangtao@hisilicon.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Leo Yan <leo.yan@linaro.org>

Introduce a binding for the Hi3660 mailbox controller, the mailbox is
used within application processor (AP), communication processor (CP),
HIFI and MCU, etc.

Cc: John Stultz <john.stultz@linaro.org>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Niranjan Yadla <nyadla@cadence.com>
Cc: Raj Pawate <pawateb@cadence.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../bindings/mailbox/hisilicon,hi3660-mailbox.txt  | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
new file mode 100644
index 0000000..8a8d7e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
@@ -0,0 +1,52 @@
+Hisilicon Hi3660 Mailbox Driver
+
+Hisilicon Hi3660 mailbox controller supports up to 32 channels.  Messages
+are passed between processors, including application & communication
+processors, MCU, HIFI, etc.  Each channel is unidirectional and accessed
+by using MMIO registers; it supports maximum to 8 words message.
+
+Controller
+----------
+
+Required properties:
+- compatible:		: Shall be "hisilicon,hi3660-mbox"
+- reg:			: Offset and length of the device's register set
+- #mbox-cells:		: Must be 3
+			  <&phandle channel dst_irq ack_irq>
+			    phandle	: Label name of controller
+			    channel	: Channel number
+			    dst_irq	: Remote interrupt vector
+			    ack_irq	: Local interrupt vector
+
+- interrupts:		: Contains the two IRQ lines for mailbox.
+
+Example:
+
+mailbox: mailbox@e896b000 {
+	compatible = "hisilicon,hi3660-mbox";
+	reg = <0x0 0xe896b000 0x0 0x1000>;
+	interrupts = <0x0 0xc0 0x4>,
+		     <0x0 0xc1 0x4>;
+	#mbox-cells = <3>;
+};
+
+Client
+------
+
+Required properties:
+- compatible		: See the client docs
+- mboxes		: Standard property to specify a Mailbox (See ./mailbox.txt)
+			  Cells must match 'mbox-cells' (See Controller docs above)
+
+Optional properties
+- mbox-names		: Name given to channels seen in the 'mboxes' property.
+
+Example:
+
+stub_clock: stub_clock {
+	compatible = "hisilicon,hi3660-stub-clk";
+	reg = <0x0 0xe896b500 0x0 0x0100>;
+	#clock-cells = <1>;
+	mbox-names = "mbox-tx";
+	mboxes = <&mailbox 13 3 0>;
+};
-- 
1.9.1
