From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH v7 2/5] MAINTAINERS: add zx2967 SoC drivers to ARM ZTE
 architecture
Date: Fri,  6 Jan 2017 17:16:01 +0800
Message-ID: <1483694164-7668-2-git-send-email-baoyou.xie@linaro.org>
References: <1483694164-7668-1-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1483694164-7668-1-git-send-email-baoyou.xie@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jun.nie@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, davem@davemloft.net, geert+renesas@glider.be, akpm@linux-foundation.org, mchehab@kernel.org, krzk@kernel.org, arnd@arndb.de, claudiu.manoil@nxp.com, amitdanielk@gmail.com, pankaj.dubey@samsung.com, yangbo.lu@nxp.com, scott.branden@broadcom.com, simon.horman@netronome.com
Cc: devicetree@vger.kernel.org, Baoyou Xie <baoyou.xie@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add the ZTE SoC drivers as maintained by ARM ZTE
architecture maintainers, as they're parts of the core IP.

By the way, this patch adds the maintainer for ARM
ZTE architecture to Baoyou Xie.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ad199da..64f04df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1975,12 +1975,16 @@ F:	arch/arm/mach-pxa/include/mach/z2.h
 
 ARM/ZTE ARCHITECTURE
 M:	Jun Nie <jun.nie@linaro.org>
+M:	Baoyou Xie <baoyou.xie@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm/mach-zx/
 F:	drivers/clk/zte/
+F:	drivers/soc/zte/
 F:	Documentation/devicetree/bindings/arm/zte.txt
 F:	Documentation/devicetree/bindings/clock/zx296702-clk.txt
+F:	Documentation/devicetree/bindings/soc/zte/
+F:	include/dt-bindings/soc/zx*.h
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@xilinx.com>
-- 
2.7.4
