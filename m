From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v2 3/5] clk: Change bcm clocks build dependency
Date: Mon, 5 Jan 2015 15:21:14 -0800
Message-ID: <1420500076-18302-4-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
 <1420500076-18302-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420500076-18302-1-git-send-email-rjui@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Matt Porter <mporter@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The clock code under drivers/clk/bcm now contains code for both the
Broadcom mobile SoCs and the iProc SoCs. Change the the makefile
dependency to be under config flag CONFIG_ARCH_BCM that's enabled for
both families of SoCs

Signed-off-by: Ray Jui <rjui@broadcom.com>
---
 drivers/clk/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index d5fba5b..eff0213 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -41,7 +41,7 @@ obj-$(CONFIG_ARCH_VT8500)		+= clk-vt8500.o
 obj-$(CONFIG_COMMON_CLK_WM831X)		+= clk-wm831x.o
 obj-$(CONFIG_COMMON_CLK_XGENE)		+= clk-xgene.o
 obj-$(CONFIG_COMMON_CLK_AT91)		+= at91/
-obj-$(CONFIG_ARCH_BCM_MOBILE)		+= bcm/
+obj-$(CONFIG_ARCH_BCM)			+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
 obj-$(CONFIG_ARCH_HI3xxx)		+= hisilicon/
 obj-$(CONFIG_ARCH_HIP04)		+= hisilicon/
-- 
1.7.9.5
