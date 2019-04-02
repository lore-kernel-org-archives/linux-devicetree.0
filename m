From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v2 4/5] nvmem: sunxi-sid: add new reg_read func
Date: Tue,  2 Apr 2019 11:45:13 -0400
Message-ID: <20190402154514.11284-5-tiny.windzz@gmail.com>
References: <20190402154514.11284-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402154514.11284-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: devicetree@vger.kernel.org

Because there was an endianness issue. It seems that reg_read
function which the nvmem the driver currently exposes is wrong.
So add the new read function, the new function is used when the
native_endian flag is set.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/nvmem/sunxi_sid.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index 54620d72ddb9..5b8a42f686cd 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -37,6 +37,7 @@ struct sunxi_sid_cfg {
 	u32	value_offset;
 	u32	size;
 	bool	need_register_readout;
+	bool	native_endian;
 };
 
 struct sunxi_sid {
@@ -75,6 +76,31 @@ static int sunxi_sid_read(void *context, unsigned int offset,
 	return 0;
 }
 
+static u8 sunxi_sid_read_byte_native(const struct sunxi_sid *sid,
+			      const unsigned int offset)
+{
+	u32 sid_key;
+
+	sid_key = ioread32(sid->base + round_down(offset, 4));
+	sid_key >>= (offset % 4) * 8;
+
+	return sid_key;
+}
+
+static int sunxi_sid_read_native(void *context, unsigned int offset,
+			  void *val, size_t bytes)
+{
+	struct sunxi_sid *sid = context;
+	u8 *buf = val;
+
+	offset += sid->value_offset;
+
+	while (bytes--)
+		*buf++ = sunxi_sid_read_byte_native(sid, offset++);
+
+	return 0;
+}
+
 static int sun8i_sid_register_readout(const struct sunxi_sid *sid,
 				      const unsigned int offset,
 				      u32 *out)
@@ -169,9 +195,12 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 	econfig.dev = dev;
 	if (cfg->need_register_readout)
 		econfig.reg_read = sun8i_sid_read_by_reg;
+	else if (cfg->native_endian)
+		econfig.reg_read = sunxi_sid_read_native;
 	else
 		econfig.reg_read = sunxi_sid_read;
 	econfig.priv = sid;
+
 	nvmem = devm_nvmem_register(dev, &econfig);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
-- 
2.17.0
