From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: mailbox: Document Hi6220 mailbox driver
Date: Thu, 20 Aug 2015 10:53:57 +0800
Message-ID: <1440039239-8772-2-git-send-email-leo.yan@linaro.org>
References: <1440039239-8772-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440039239-8772-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, galak@codeaurora.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bintian Wang <bintian.wang@huawei.com>, haojian.zhuang@linaro.org, Yiping Xu <xuyiping@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, guodong.xu@linaro.org, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, kongfei@hisilicon.com, Guangyue Zeng <zengguangyue@hisilicon.com>
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Document the new compatible for Hisilicon Hi6220 mailbox driver.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../bindings/mailbox/hisilicon,hi6220-mailbox.txt  | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
new file mode 100644
index 0000000..3dfb0b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
@@ -0,0 +1,57 @@
+Hisilicon Hi6220 Mailbox Driver
+===============================
+
+Hisilicon Hi6220 mailbox supports up to 32 channels. Each channel
+is unidirectional with a maximum message size of 8 words. I/O is
+performed using register access (there is no DMA) and the cell
+raises an interrupt when messages are received.
+
+Mailbox Device Node:
+====================
+
+Required properties:
+--------------------
+- compatible:		Shall be "hisilicon,hi6220-mbox"
+- reg:			Contains the mailbox register address range (base
+			address and length); the first item is for IPC
+			registers, the second item is shared buffer for
+			slots.
+- #mbox-cells		Common mailbox binding property to identify the number
+			of cells required for the mailbox specifier. Should be 1.
+- interrupts:		Contains the interrupt information for the mailbox
+			device. The format is dependent on which interrupt
+			controller the SoCs use.
+
+Example:
+--------
+
+	mailbox: mailbox@F7510000 {
+		#mbox-cells = <1>;
+		compatible = "hisilicon,hi6220-mbox";
+		reg = <0x0 0xF7510000 0x0 0x1000>, /* IPC_S */
+		      <0x0 0x06DFF800 0x0 0x0800>; /* Mailbox */
+		interrupt-parent = <&gic>;
+		interrupts = <0 94 4>;
+	};
+
+
+Mailbox client
+===============
+
+"mboxes" and the optional "mbox-names" (please see
+Documentation/devicetree/bindings/mailbox/mailbox.txt for details). Each value
+of the mboxes property should contain a phandle to the mailbox controller
+device node and second argument is the channel index. It must be 0 (hardware
+support only one channel). The equivalent "mbox-names" property value can be
+used to give a name to the communication channel to be used by the client user.
+
+Example:
+--------
+
+	stub_clock: stub_clock {
+		compatible = "hisilicon,hi6220-stub-clk";
+		hisilicon,hi6220-clk-sram = <&sram>;
+		#clock-cells = <1>;
+		mbox-names = "mbox-tx";
+		mboxes = <&mailbox 1>;
+	};
-- 
1.9.1
