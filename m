From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH v3 3/9] pinctrl: avoid PLAT_ORION dependency
Date: Mon, 12 Jun 2017 17:34:54 +0200
Message-ID: <58b227242d015c9a9db62bfd331be351037b1054.1497281623.git-series.gregory.clement@free-electrons.com>
References: <cover.d003a5e862e6d732d901a61d1765a349c9a89eef.1497281623.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.d003a5e862e6d732d901a61d1765a349c9a89eef.1497281623.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.d003a5e862e6d732d901a61d1765a349c9a89eef.1497281623.git-series.gregory.clement@free-electrons.com>
References: <cover.d003a5e862e6d732d901a61d1765a349c9a89eef.1497281623.git-series.gregory.clement@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Neta Zur Hershkovits <neta@marvell.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Shadi Ammouri <shadi@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Russell King <rmk+kernel@armlinux.org.uk>

Armada 8040 also needs orion pinctrl, and as these symbols are only
selected, there's no need to make them depend on PLAT_ORION.

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 drivers/pinctrl/mvebu/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pinctrl/mvebu/Kconfig b/drivers/pinctrl/mvebu/Kconfig
index 5bade32d3089..8cb444b60ae9 100644
--- a/drivers/pinctrl/mvebu/Kconfig
+++ b/drivers/pinctrl/mvebu/Kconfig
@@ -1,5 +1,3 @@
-if PLAT_ORION
-
 config PINCTRL_MVEBU
 	bool
 	select PINMUX
@@ -38,8 +36,6 @@ config PINCTRL_ORION
 	bool
 	select PINCTRL_MVEBU
 
-endif
-
 config PINCTRL_ARMADA_37XX
        bool
        select GENERIC_PINCONF
-- 
git-series 0.9.1
