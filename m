From: Tony Xie <tony.xie@rock-chips.com>
Subject: [PATCH v6 1/6] regmap: add a new macro:REGMAP_IRQ_REG_LINE(_id, _reg_bits)
Date: Tue, 30 Oct 2018 18:07:56 +0800
Message-ID: <1540894081-31270-2-git-send-email-tony.xie@rock-chips.com>
References: <1540894081-31270-1-git-send-email-tony.xie@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540894081-31270-1-git-send-email-tony.xie@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: broonie@kernel.org, lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, chenjh@rock-chips.com, xsf@rock-chips.com, zhangqing@rock-chips.com, huangtao@rock-chips.com, tony.xie@rock-chips.com
List-Id: devicetree@vger.kernel.org

if there are lots of irqs for a device and the register addresses for these
irqs is continuous, we can use this macro to initialize regmap_irq value.

Signed-off-by: Tony Xie <tony.xie@rock-chips.com>
---
 include/linux/regmap.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 4f38068..a468b81 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1047,6 +1047,12 @@ struct regmap_irq {
 #define REGMAP_IRQ_REG(_irq, _off, _mask)		\
 	[_irq] = { .reg_offset = (_off), .mask = (_mask) }
 
+#define REGMAP_IRQ_REG_LINE(_id, _reg_bits) \
+	[_id] = {				\
+		.mask = BIT((_id) % (_reg_bits)),	\
+		.reg_offset = (_id) / (_reg_bits),	\
+	}
+
 /**
  * struct regmap_irq_chip - Description of a generic regmap irq_chip.
  *
-- 
1.9.1
