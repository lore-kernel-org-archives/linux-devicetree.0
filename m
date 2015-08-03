From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC PATCH 1/3] dt-bindings: mailbox: Document Hisilicon mailbox driver
Date: Mon,  3 Aug 2015 09:13:08 +0800
Message-ID: <1438564390-28111-2-git-send-email-leo.yan@linaro.org>
References: <1438564390-28111-1-git-send-email-leo.yan@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438564390-28111-1-git-send-email-leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jian Zhang <zhangjian001-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Zhenwei Wang <Zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Haoju Mo <mohaoju-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, kongfei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Guangyue Zeng <zengguangyue-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document the new compatible for Hisilicon mailbox driver.

Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/mailbox/hisi-mailbox.txt   | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisi-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/hisi-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisi-mailbox.txt
new file mode 100644
index 0000000..898823d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/hisi-mailbox.txt
@@ -0,0 +1,57 @@
+Hisilicon Mailbox Driver
+========================
+
+The Hisilicon mailbox supports up to 32 channels. Each channel
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
