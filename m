From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v4 1/5] clk: unconditionally recurse into clk/mvebu/
Date: Sun, 27 Mar 2016 11:26:13 +0200
Message-ID: <1459070777-18049-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1459070777-18049-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1459070777-18049-1-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

The drivers/clk/mvebu directory is only being built when
CONFIG_PLAT_ORION=y. As we are going to support additional mvebu
platforms in drivers/clk/mvebu, which don't have CONFIG_PLAT_ORION=y,
we need to recurse into this directory regardless of the value of
CONFIG_PLAT_ORION.

Since all files in drivers/clk/mvebu/ are already conditionally
compiled depending on various Kconfig options, we can recurse
unconditionally into drivers/clk/mvebu without any other change.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/clk/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 46869d69..f9ad66e 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -61,7 +61,7 @@ obj-$(CONFIG_ARCH_MEDIATEK)		+= mediatek/
 ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_ARCH_MMP)			+= mmp/
 endif
-obj-$(CONFIG_PLAT_ORION)		+= mvebu/
+obj-y					+= mvebu/
 obj-$(CONFIG_ARCH_MESON)		+= meson/
 obj-$(CONFIG_ARCH_MXS)			+= mxs/
 obj-$(CONFIG_MACH_PISTACHIO)		+= pistachio/
-- 
2.6.4

