From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH 2/4] ARM: dove: Add clock-names to CuBox Si5351 clk generator
Date: Thu, 30 Apr 2015 19:45:52 +0200
Message-ID: <1430415954-29517-3-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Jean-Francois Moine <moinejf@free.fr>, Michael Welling <mwelling@ieee.org>, Russell King <rmk+linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Si5351 clock generator on CuBox uses XTAL as clock reference, name the
clock phandle accordingly.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
Cc: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Jean-Francois Moine <moinejf@free.fr>
Cc: Michael Welling <mwelling@ieee.org>
Cc: Russell King <rmk+linux@arm.linux.org.uk>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@free-electrons.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/dove-cubox.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/dove-cubox.dts b/arch/arm/boot/dts/dove-cubox.dts
index aae7efc09b0b..e6fa251e17b9 100644
--- a/arch/arm/boot/dts/dove-cubox.dts
+++ b/arch/arm/boot/dts/dove-cubox.dts
@@ -87,6 +87,7 @@
 
 		/* connect xtal input to 25MHz reference */
 		clocks = <&ref25>;
+		clock-names = "xtal";
 
 		/* connect xtal input as source of pll0 and pll1 */
 		silabs,pll-source = <0 0>, <1 0>;
-- 
2.1.0
