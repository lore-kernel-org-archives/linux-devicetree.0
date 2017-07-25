From: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v7 1/3] mtd: spi-nor: Bindings for Rockchip serial flash controller
Date: Tue, 25 Jul 2017 18:08:17 +0800
Message-ID: <1500977297-15053-1-git-send-email-andy.yan@rock-chips.com>
References: <1500977251-15001-1-git-send-email-andy.yan@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500977251-15001-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Add binding document for the Rockchip serial flash controller.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Acked-by: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../devicetree/bindings/mtd/rockchip-sfc.txt       | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip-sfc.txt

diff --git a/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt b/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
new file mode 100644
index 0000000..1e449b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
@@ -0,0 +1,31 @@
+Rockchip Serial Flash Controller
+
+Required properties:
+- compatible : Should be
+		"rockchip,rv1108-sfc", "rockchip,sfc" for ROCKCHIP RV1108.
+- address-cells : Should be 1.
+- size-cells : Should be 0.
+- clocks: Must contain two entries for each entry in clock-names.
+- clock-names: Shall be "sfc" for the transfer-clock, and "hsfc" for
+		the peripheral clock.
+- interrupts : Should contain the interrupt for the device.
+- reg: Physical base address of the controller and length of memory mapped.
+
+Optional properties:
+- rockchip,sfc-no-dma: Indicate the controller doesn't support DMA transfer.
+
+Example:
+nor_flash: sfc@301c0000 {
+	compatible = "rockchip,rv1108-sfc", "rockchip,sfc";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
+	clock-names = "sfc", "hsfc";
+	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+	reg = <0x301c0000 0x1000>;
+	spi-nor@0 {
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <12000000>;
+		reg = <0>;
+	};
+};
-- 
2.7.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
