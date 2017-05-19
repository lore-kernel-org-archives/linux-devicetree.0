From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 1/9] MAINTAINERS: extend mvebu SoC entry with pinctrl drivers
Date: Fri, 19 May 2017 18:04:43 +0200
Message-ID: <93e35a2e47c794d2a74657c56469a42147857f9a.1495209664.git-series.gregory.clement@free-electrons.com>
References: <cover.0dd8a92ae74fcec8d0470d0a7016035089e46eed.1495209664.git-series.gregory.clement@free-electrons.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.0dd8a92ae74fcec8d0470d0a7016035089e46eed.1495209664.git-series.gregory.clement@free-electrons.com>
In-Reply-To: <cover.0dd8a92ae74fcec8d0470d0a7016035089e46eed.1495209664.git-series.gregory.clement@free-electrons.com>
References: <cover.0dd8a92ae74fcec8d0470d0a7016035089e46eed.1495209664.git-series.gregory.clement@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>, Nadav Haklai <nadavh@marvell.com>, Kostya Porotchkin <kostap@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

There was no entry for the mvebu pinctrl drivers. As they are tightly
linked to the SoCs and there is a lot of common code to support the
various pinctrl of each SoCs, then add a new entry for the mvebu
maintainers.

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f7d568b8f133..42befcdec846 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1496,6 +1496,7 @@ F:	arch/arm/boot/dts/armada*
 F:	arch/arm/boot/dts/kirkwood*
 F:	arch/arm64/boot/dts/marvell/armada*
 F:	drivers/cpufreq/mvebu-cpufreq.c
+F:	drivers/pinctrl/mvebu/
 F:	arch/arm/configs/mvebu_*_defconfig
 
 ARM/Marvell Berlin SoC support
-- 
git-series 0.9.1
