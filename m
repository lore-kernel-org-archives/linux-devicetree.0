From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH 3/3] clk: berlin: bg2q: remove non-exist "smemc" gate clock
Date: Wed, 31 Dec 2014 16:57:52 +0800
Message-ID: <1420016272-6789-4-git-send-email-jszhang@marvell.com>
References: <1420016272-6789-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <1420016272-6789-1-git-send-email-jszhang@marvell.com>
Sender: stable-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, mturquette@linaro.org, sboyd@codeaurora.org, alexandre.belloni@free-electrons.com, antoine.tenart@free-electrons.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>
List-Id: devicetree@vger.kernel.org

The "smemc" clock is removed on BG2Q SoCs. In fact, bit19 of clkenable
register is for nfc. Current code use bit19 for non-exist "smemc"
incorrectly, this prevents eMMC from working due to the sdhci's
"core" clk is still gated.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
Cc: stable@vger.kernel.org # 3.16+
---
 drivers/clk/berlin/bg2q.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/berlin/bg2q.c b/drivers/clk/berlin/bg2q.c
index 21784e4..440ef81 100644
--- a/drivers/clk/berlin/bg2q.c
+++ b/drivers/clk/berlin/bg2q.c
@@ -285,7 +285,6 @@ static const struct berlin2_gate_data bg2q_gates[] __initconst = {
 	{ "pbridge",	"perif",	15, CLK_IGNORE_UNUSED },
 	{ "sdio",	"perif",	16, CLK_IGNORE_UNUSED },
 	{ "nfc",	"perif",	18 },
-	{ "smemc",	"perif",	19 },
 	{ "pcie",	"perif",	22 },
 };
 
-- 
2.1.4
