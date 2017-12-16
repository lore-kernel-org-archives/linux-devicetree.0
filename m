From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 1/5] [media] rc: update sunxi-ir driver to get
 base frequency from devicetree
Date: Sat, 16 Dec 2017 03:49:10 +0100
Message-ID: <20171216024914.7550-2-embed3d@gmail.com>
References: <20171216024914.7550-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBL4T2LIQKGQERH4BZBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171216024914.7550-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch updates the sunxi-ir driver to set the ir base clock from
devicetree.

This is neccessary since there are different ir recievers on the
market, that operate with different frequencys. So this value needs to
be set depending on the attached receiver.

Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/media/rc/sunxi-cir.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 97f367b446c4..55b53d6463e9 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -72,12 +72,6 @@
 /* CIR_REG register idle threshold */
 #define REG_CIR_ITHR(val)    (((val) << 8) & (GENMASK(15, 8)))
 
-/* Required frequency for IR0 or IR1 clock in CIR mode */
-#define SUNXI_IR_BASE_CLK     8000000
-/* Frequency after IR internal divider  */
-#define SUNXI_IR_CLK          (SUNXI_IR_BASE_CLK / 64)
-/* Sample period in ns */
-#define SUNXI_IR_SAMPLE       (1000000000ul / SUNXI_IR_CLK)
 /* Noise threshold in samples  */
 #define SUNXI_IR_RXNOISE      1
 /* Idle Threshold in samples */
@@ -122,7 +116,7 @@ static irqreturn_t sunxi_ir_irq(int irqno, void *dev_id)
 			/* for each bit in fifo */
 			dt = readb(ir->base + SUNXI_IR_RXFIFO_REG);
 			rawir.pulse = (dt & 0x80) != 0;
-			rawir.duration = ((dt & 0x7f) + 1) * SUNXI_IR_SAMPLE;
+			rawir.duration = ((dt & 0x7f) + 1) * ir->rc->rx_resolution;
 			ir_raw_event_store_with_filter(ir->rc, &rawir);
 		}
 	}
@@ -148,6 +142,7 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	struct device_node *dn = dev->of_node;
 	struct resource *res;
 	struct sunxi_ir *ir;
+	u32 b_clk_freq;
 
 	ir = devm_kzalloc(dev, sizeof(struct sunxi_ir), GFP_KERNEL);
 	if (!ir)
@@ -172,6 +167,12 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 		return PTR_ERR(ir->clk);
 	}
 
+	/* Required frequency for IR0 or IR1 clock in CIR mode */
+	if (of_property_read_u32(dn, "base-clk-frequency", &b_clk_freq)) {
+		dev_err(dev, "failed to get ir base clock frequency.\n");
+		return -ENODATA;
+	}
+
 	/* Reset (optional) */
 	ir->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(ir->rst))
@@ -180,7 +181,7 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_set_rate(ir->clk, SUNXI_IR_BASE_CLK);
+	ret = clk_set_rate(ir->clk, b_clk_freq);
 	if (ret) {
 		dev_err(dev, "set ir base clock failed!\n");
 		goto exit_reset_assert;
@@ -225,7 +226,8 @@ static int sunxi_ir_probe(struct platform_device *pdev)
 	ir->rc->map_name = ir->map_name ?: RC_MAP_EMPTY;
 	ir->rc->dev.parent = dev;
 	ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
-	ir->rc->rx_resolution = SUNXI_IR_SAMPLE;
+	/* Frequency after IR internal divider with sample period in ns */
+	ir->rc->rx_resolution = (1000000000ul / (b_clk_freq / 64));
 	ir->rc->timeout = MS_TO_NS(SUNXI_IR_TIMEOUT);
 	ir->rc->driver_name = SUNXI_IR_DEV;
 
-- 
2.11.0
