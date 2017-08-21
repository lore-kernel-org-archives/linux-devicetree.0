From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v9 RESEND 8/9] mfd: rk808: Add RK805 pinctrl support
Date: Mon, 21 Aug 2017 03:28:41 +0200
Message-ID: <20170821012842.17875-9-heiko@sntech.de>
References: <20170821012842.17875-1-heiko@sntech.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170821012842.17875-1-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: chenjh@rock-chips.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

From: Joseph Chen <chenjh@rock-chips.com>

Signed-off-by: Joseph Chen <chenjh@rock-chips.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/mfd/rk808.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index 18329c8b4fe7..c803d2d5dfb7 100644
--- a/drivers/mfd/rk808.c
+++ b/drivers/mfd/rk808.c
@@ -97,6 +97,7 @@ static struct resource rtc_resources[] = {
 static const struct mfd_cell rk805s[] = {
 	{ .name = "rk808-clkout", },
 	{ .name = "rk808-regulator", },
+	{ .name = "rk805-pinctrl", },
 	{
 		.name = "rk808-rtc",
 		.num_resources = ARRAY_SIZE(rtc_resources),
-- 
2.14.1
