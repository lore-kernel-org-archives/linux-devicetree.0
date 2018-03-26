From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 08/11] clk: actions: Add fixed factor clock support
Date: Mon, 26 Mar 2018 23:09:02 +0530
Message-ID: <20180326173905.22313-9-manivannan.sadhasivam@linaro.org>
References: <20180326173905.22313-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180326173905.22313-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, afaerber@suse.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, devicetree@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org, daniel.thompson@linaro.org, amit.kucheria@linaro.org, viresh.kumar@linaro.org, hzhang@ucrobotics.com, bdong@ucrobotics.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, manivannanece23@gmail.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add support for Actions Semi fixed factor clock reusing the clk
ops from common clock driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/actions/owl-fixed-factor.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 drivers/clk/actions/owl-fixed-factor.h

diff --git a/drivers/clk/actions/owl-fixed-factor.h b/drivers/clk/actions/owl-fixed-factor.h
new file mode 100644
index 000000000000..cc9fe36c0964
--- /dev/null
+++ b/drivers/clk/actions/owl-fixed-factor.h
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// OWL fixed factor clock driver
+//
+// Copyright (c) 2014 Actions Semi Inc.
+// Author: David Liu <liuwei@actions-semi.com>
+//
+// Copyright (c) 2018 Linaro Ltd.
+// Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+#ifndef _OWL_FIXED_FACTOR_H_
+#define _OWL_FIXED_FACTOR_H_
+
+#include "owl-common.h"
+
+#define OWL_FIX_FACT(_struct, _name, _parent, _mul, _div, _flags)	\
+	struct clk_fixed_factor _struct = {				\
+		.mult		= _mul,					\
+		.div		= _div,					\
+		.hw.init	= CLK_HW_INIT(_name,			\
+					      _parent,			\
+					      &clk_fixed_factor_ops,	\
+					      _flags),			\
+	}
+
+extern const struct clk_ops clk_fixed_factor_ops;
+
+#endif /* _OWL_FIXED_FACTOR_H_ */
-- 
2.14.1
