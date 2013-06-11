From: Zhangfei Gao <zhangfei.gao@linaro.org>
Subject: [PATCH 2/2] i2c: designware: add two optional property tx/rx-fifo-size
Date: Tue, 11 Jun 2013 10:30:20 +0800
Message-ID: <1370917820-24176-1-git-send-email-zhangfei.gao@linaro.org>
References: <51B687E5.307@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51B687E5.307@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wolfram Sang <wsa@the-dreams.de>, Dirk Brandewie <dirk.brandewie@gmail.com>, baruch@tkos.co.il
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

rx-fifo-size and tx-fifo-size will be updated if provided from dts

Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
CC: Baruch Siach <baruch@tkos.co.il>
---
 .../devicetree/bindings/i2c/i2c-designware.txt     |    7 +++++++
 drivers/i2c/busses/i2c-designware-platdrv.c        |    3 +++
 2 files changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
index e42a2ee..84717fe 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
@@ -6,6 +6,11 @@ Required properties :
  - reg : Offset and length of the register set for the device
  - interrupts : <IRQ> where IRQ is the interrupt number.
 
+Optional properties:
+
+ - rx-fifo-size : 1 cell, Rx fifo size
+ - tx-fifo-size : 1 cell, Tx fifo size
+
 Recommended properties :
 
  - clock-frequency : desired I2C bus clock frequency in Hz.
@@ -18,5 +23,7 @@ Example :
 		compatible = "snps,designware-i2c";
 		reg = <0xf0000 0x1000>;
 		interrupts = <11>;
+		rx-fifo-size = <16>;
+		tx-fifo-size = <16>;
 		clock-frequency = <400000>;
 	};
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 41659c0..6760cea 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -85,6 +85,7 @@ static int dw_i2c_probe(struct platform_device *pdev)
 	struct dw_i2c_dev *dev;
 	struct i2c_adapter *adap;
 	struct resource *mem;
+	struct device_node *np = pdev->dev.of_node;
 	int irq, r;
 
 	/* NOTE: driver uses the static register mapping */
@@ -140,6 +141,8 @@ static int dw_i2c_probe(struct platform_device *pdev)
 		dev->rx_fifo_depth = ((param1 >> 8)  & 0xff) + 1;
 		dev->adapter.nr = pdev->id;
 	}
+	of_property_read_u32(np, "rx-fifo-size", &dev->rx_fifo_depth);
+	of_property_read_u32(np, "tx-fifo-size", &dev->tx_fifo_depth);
 	r = i2c_dw_init(dev);
 	if (r)
 		return r;
-- 
1.7.9.5
