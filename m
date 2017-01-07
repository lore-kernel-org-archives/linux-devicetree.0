From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH v1 2/3] MAINTAINERS: add zx2967 thermal drivers to ARM ZTE architecture
Date: Sat,  7 Jan 2017 13:38:07 +0800
Message-ID: <1483767488-19778-2-git-send-email-baoyou.xie@linaro.org>
References: <1483767488-19778-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1483767488-19778-1-git-send-email-baoyou.xie@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jun.nie@linaro.org, gregkh@linuxfoundation.org, davem@davemloft.net, geert+renesas@glider.be, akpm@linux-foundation.org, mchehab@kernel.org, linux@roeck-us.net
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
List-Id: devicetree@vger.kernel.org

Add the zx2967 thermal drivers as maintained by ARM ZTE
architecture maintainers, as they're parts of the core IP.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 64f04df..2593296 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1981,6 +1981,7 @@ S:	Maintained
 F:	arch/arm/mach-zx/
 F:	drivers/clk/zte/
 F:	drivers/soc/zte/
+F:	drivers/thermal/zx*
 F:	Documentation/devicetree/bindings/arm/zte.txt
 F:	Documentation/devicetree/bindings/clock/zx296702-clk.txt
 F:	Documentation/devicetree/bindings/soc/zte/
-- 
2.7.4

