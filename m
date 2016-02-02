From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v6 1/4] dt-bindings: mailbox: Document Hi6220 mailbox driver
Date: Tue,  2 Feb 2016 18:09:39 +0800
Message-ID: <1454407782-24674-2-git-send-email-leo.yan@linaro.org>
References: <1454407782-24674-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454407782-24674-1-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document DT binding for Hisilicon Hi6220 mailbox driver.

Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/mailbox/hisilicon,hi6220-mailbox.txt  | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
new file mode 100644
index 0000000..8508c8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi6220-mailbox.txt
@@ -0,0 +1,74 @@
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
+- #mbox-cells:		Common mailbox binding property to identify the number
+			of cells required for the mailbox specifier. Must be 3.
+			<&phandle slot_id dst_irq ack_irq>
+			  phandle: Label name of mailbox controller
+			  slot_id: Slot id used either for TX or RX
+			  dst_irq: IRQ identifier index number which used by MCU
+			  ack_irq: IRQ identifier index number with generating a
+			           TX/RX interrupt to application processor,
+				   mailbox driver uses it to acknowledge interrupt
+- interrupts:		Contains the interrupt information for the mailbox
+			device. The format is dependent on which interrupt
+			controller the SoCs use.
+
+Optional Properties:
+--------------------
+- hi6220,mbox-tx-noirq: Property of MCU firmware's feature, so mailbox driver
+			use this flag to ask MCU to enable "automatic idle
+			flag" mode or IRQ generated mode to acknowledge a TX
+			completion.
+
+Example:
+--------
+
+	mailbox: mailbox@F7510000 {
+		compatible = "hisilicon,hi6220-mbox";
+		reg = <0x0 0xF7510000 0x0 0x1000>, /* IPC_S */
+		      <0x0 0x06DFF800 0x0 0x0800>; /* Mailbox */
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		#mbox-cells = <3>;
+	};
+
+
+Mailbox client
+===============
+
+Required properties:
+--------------------
+- compatible:		Many (See the client docs).
+- mboxes:		Standard property to specify a Mailbox (See ./mailbox.txt)
+			Cells must match 'mbox-cells' (See Mailbox Device Node above).
+
+Optional Properties:
+--------------------
+- mbox-names:		Name given to channels seen in the 'mboxes' property.
+
+Example:
+--------
+
+	stub_clock: stub_clock {
+		compatible = "hisilicon,hi6220-stub-clk";
+		hisilicon,hi6220-clk-sram = <&sram>;
+		#clock-cells = <1>;
+		mbox-names = "mbox-tx", "mbox-rx";
+		mboxes = <&mailbox 1 0 11>, <&mailbox 0 1 10>;
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
