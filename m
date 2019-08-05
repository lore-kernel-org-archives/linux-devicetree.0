Return-Path: <SRS0=xLqw=WB=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 5/8] clk: mvebu: ap806: be more explicit on what SaR is
Date: Mon,  5 Aug 2019 12:03:07 +0200
Message-Id: <20190805100310.29048-6-miquel.raynal@bootlin.com>
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Marcin Wojtas <mw@semihalf.com>, Stefan Chulski <stefanc@marvell.com>, Yan Markman <ymarkman@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

"SaR" means Sample at Reset. DIP switches can be changed on the board,
their states at reset time is available through a register read.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index 73ba8fd7860f..2cf874f01394 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -89,7 +89,7 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 		cpuclk_freq = 600;
 		break;
 	default:
-		dev_err(dev, "invalid SAR value\n");
+		dev_err(dev, "invalid Sample at Reset value\n");
 		return -EINVAL;
 	}
 
-- 
2.20.1
