From: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v1 1/3] dt-bindings: rockchip-mailbox: Add mailbox controller document on Rockchip SoCs
Date: Tue, 27 Oct 2015 15:31:44 +0800
Message-ID: <1445931106-683-2-git-send-email-wxt@rock-chips.com>
References: <1445931106-683-1-git-send-email-wxt@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445931106-683-1-git-send-email-wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This add the necessary binding documentation for mailbox
found on RK3368 SoC.

Signed-off-by: Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v1:
- PATCH[1/3] doc:
- As the Rob Herring comments, s/share/shared/ and specify the value of #mbox-cells.
- Move the shared memory in mailbox, let's move the property the client
  driver in the future.

 .../bindings/mailbox/rockchip-mailbox.txt          | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt

diff --git a/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt b/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt
new file mode 100644
index 0000000..b6bb84a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/rockchip-mailbox.txt
@@ -0,0 +1,32 @@
+Rockchip mailbox
+
+The Rockchip mailbox is used by the Rockchip CPU cores to communicate
+requests to MCU processor.
+
+Refer to ./mailbox.txt for generic information about mailbox device-tree
+bindings.
+
+Required properties:
+
+ - compatible: should be one of the following.
+   - "rockchip,rk3368-mbox" for rk3368
+ - reg: physical base address of the controller and length of memory mapped
+	region.
+ - interrupts: The interrupt number to the cpu. The interrupt specifier format
+	depends on the interrupt controller.
+ - #mbox-cells: Common mailbox binding property to identify the number
+	of cells required for the mailbox specifier. Should be 1
+
+Example:
+--------
+
+/* RK3368 */
+mbox: mbox@ff6b0000 {
+	compatible = "rockchip,rk3368-mailbox";
+	reg = <0x0 0xff6b0000 0x0 0x1000>,
+	interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+	#mbox-cells = <1>;
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
