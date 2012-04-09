From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 1/4] clk: select CLKDEV_LOOKUP for COMMON_CLK
Date: Mon,  9 Apr 2012 15:24:58 -0500
Message-ID: <1334003101-17274-2-git-send-email-robherring2@gmail.com>
References: <1334003101-17274-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1334003101-17274-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Mike Turquette <mturquette@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Sascha Hauer <kernel@pengutronix.de>, shawn.guo@linaro.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Using the common clock infrastructure without the common clkdev code makes
little sense, so select CLKDEV_LOOKUP for COMMON_CLK.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
---
 drivers/clk/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 165e1fe..f05a60d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -12,6 +12,7 @@ config HAVE_MACH_CLKDEV
 config COMMON_CLK
 	bool
 	select HAVE_CLK_PREPARE
+	select CLKDEV_LOOKUP
 	---help---
 	  The common clock framework is a single definition of struct
 	  clk, useful across many platforms, as well as an
-- 
1.7.5.4
