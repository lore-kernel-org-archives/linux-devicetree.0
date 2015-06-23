From: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: [PATCH 3/9] drivers: clk: st: Remove unused code
Date: Tue, 23 Jun 2015 16:09:21 +0200
Message-ID: <1435068567-30995-4-git-send-email-gabriel.fernandez@linaro.org>
References: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Pankaj Dev <pankaj.dev@st.com>, Olivier Bideau <olivier.bideau@st.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Fabian Frederick <fabf@skynet.be>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Remove this duplicated code due to a bad copy / paste.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
---
 drivers/clk/st/clkgen-fsyn.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index e6d7073..e7e6782 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -1082,10 +1082,6 @@ static const struct of_device_id quadfs_of_match[] = {
 		.compatible = "st,stih407-quadfs660-D",
 		.data = &st_fs660c32_D_407
 	},
-	{
-		.compatible = "st,stih407-quadfs660-D",
-		.data = (void *)&st_fs660c32_D_407
-	},
 	{}
 };
 
-- 
1.9.1
