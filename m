From: Joe.C <srv_yingjoe.chen@mediatek.com>
Subject: [PATCH v3 2/7] arm: mediatek: add dts for 8127 Moose board
Date: Fri, 19 Sep 2014 11:04:14 +0800
Message-ID: <1411095859-18737-3-git-send-email-srv_yingjoe.chen@mediatek.com>
References: <1411095859-18737-1-git-send-email-srv_yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411095859-18737-1-git-send-email-srv_yingjoe.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, arm@kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Anders Berg <anders.berg@lsi.com>, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, yingjoe.chen@gmail.com, Ian Campbell <ijc+devicetree@hellion.org.uk>, hc.yen@mediatek.com, Linus Walleij <linus.walleij@linaro.org>, yh.chen@mediatek.com, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, nathan.chung@mediatek.com, Kumar Gala <galak@codeaurora.org>, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Joe.C" <yingjoe.chen@mediatek.com>

Moose is a tablet evalutation board based on MT8127 SoC.

Signed-off-by: Joe.C <yingjoe.chen@mediatek.com>
---
 arch/arm/boot/dts/mt8127-moose.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt8127-moose.dts

diff --git a/arch/arm/boot/dts/mt8127-moose.dts b/arch/arm/boot/dts/mt8127-moose.dts
new file mode 100644
index 0000000..602e2f0
--- /dev/null
+++ b/arch/arm/boot/dts/mt8127-moose.dts
@@ -0,0 +1,24 @@
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Joe.C <yingjoe.chen@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+#include "mt8127.dtsi"
+
+/ {
+	model = "mediatek,mt8127-moose", "mediatek,mt8127";
+
+	memory {
+		reg = <0 0x80000000 0 0x40000000>;
+	};
+};
-- 
1.8.1.1.dirty
