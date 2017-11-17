From: Xu YiPing <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v3 1/3] dt-bindings: mailbox: Introduce Hi3660 controller binding
Date: Fri, 17 Nov 2017 17:24:30 +0800
Message-ID: <1510910672-1409-2-git-send-email-xuyiping@hisilicon.com>
References: <1510910672-1409-1-git-send-email-xuyiping@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510910672-1409-1-git-send-email-xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuezhiliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.wangtao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Introduce a binding for the Hi3660 mailbox controller, the mailbox is
used within application processor (AP), communication processor (CP),
HIFI and MCU, etc.

Signed-off-by: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../bindings/mailbox/hisilicon,hi3660-mailbox.txt  | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
new file mode 100644
index 0000000..3e5b453
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/hisilicon,hi3660-mailbox.txt
@@ -0,0 +1,51 @@
+Hisilicon Hi3660 Mailbox Controller
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
+stub_clock: stub_clock@e896b500 {
+	compatible = "hisilicon,hi3660-stub-clk";
+	reg = <0x0 0xe896b500 0x0 0x0100>;
+	#clock-cells = <1>;
+	mboxes = <&mailbox 13 3 0>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
