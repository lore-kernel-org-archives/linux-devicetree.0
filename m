From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 12/13] clk: mvebu: add support for 1866MHz variants
Date: Sun, 21 May 2017 14:49:01 +0200
Message-ID: <20170521124903.11050-13-ralph.sennhauser@gmail.com>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Gregory Clement <gregory.clement@free-electrons.com>, Imre Kaloz <kaloz@openwrt.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ralph Sennhauser <ralph.sennhauser@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Linksys WRT3200ACM CPU is clocked at 1866MHz. Add 1866MHz to
the list of supported CPU frequencies.

Noticed by the following warning:
[    0.000000] Selected CPU frequency (16) unsupported

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---
 drivers/clk/mvebu/armada-38x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/armada-38x.c b/drivers/clk/mvebu/armada-38x.c
index 8bccf4e..6a92eb6 100644
--- a/drivers/clk/mvebu/armada-38x.c
+++ b/drivers/clk/mvebu/armada-38x.c
@@ -49,7 +49,8 @@ static const u32 armada_38x_cpu_frequencies[] __initconst = {
 	0, 0, 0, 0,
 	1066 * 1000 * 1000, 0, 0, 0,
 	1332 * 1000 * 1000, 0, 0, 0,
-	1600 * 1000 * 1000,
+	1600 * 1000 * 1000, 0, 0, 0,
+	1866 * 1000 * 1000
 };
 
 static u32 __init armada_38x_get_cpu_freq(void __iomem *sar)
-- 
2.10.2
