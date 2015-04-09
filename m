From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v7 1/9] mfd: dt-bindings: Provide human readable defines for
 LPC mode choosing
Date: Thu,  9 Apr 2015 15:47:26 +0100
Message-ID: <1428590854-14095-2-git-send-email-lee.jones@linaro.org>
References: <1428590854-14095-1-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1428590854-14095-1-git-send-email-lee.jones@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, a.zummo@towertech.it, david.paris@st.com, wim@iguana.be, lee.jones@linaro.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

ST's Low Power Controller can currently operate in two supported modes;
Watchdog and Real Time Clock.  These defines will aid engineers to easily
identify the selected mode.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 include/dt-bindings/mfd/st-lpc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 include/dt-bindings/mfd/st-lpc.h

diff --git a/include/dt-bindings/mfd/st-lpc.h b/include/dt-bindings/mfd/st-lpc.h
new file mode 100644
index 0000000..e3e6c75
--- /dev/null
+++ b/include/dt-bindings/mfd/st-lpc.h
@@ -0,0 +1,15 @@
+/*
+ * This header provides shared DT/Driver defines for ST's LPC device
+ *
+ * Copyright (C) 2014 STMicroelectronics -- All Rights Reserved
+ *
+ * Author: Lee Jones <lee.jones@linaro.org> for STMicroelectronics
+ */
+
+#ifndef __DT_BINDINGS_ST_LPC_H__
+#define __DT_BINDINGS_ST_LPC_H__
+
+#define ST_LPC_MODE_RTC		0
+#define ST_LPC_MODE_WDT		1
+
+#endif /* __DT_BINDINGS_ST_LPC_H__ */
-- 
1.9.1
