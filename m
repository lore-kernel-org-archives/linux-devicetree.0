From: <gabriel.fernandez@st.com>
Subject: [PATCH 5/6] clk: stm32mp1: set stgen_k clock as critical
Date: Fri, 6 Apr 2018 08:39:32 +0200
Message-ID: <1522996773-24129-6-git-send-email-gabriel.fernandez@st.com>
References: <1522996773-24129-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1522996773-24129-1-git-send-email-gabriel.fernandez@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sboyd@kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Gabriel Fernandez <gabriel.fernandez@st.com>
Cc: devicetree@vger.kernel.org, benjamin GAIGNARD <benjamin.gaignard@st.com>, Loic PALLARDY <loic.pallardy@st.com>, olivier.bideau@st.com, linux-kernel@vger.kernel.org, gabriel.fernandez.st@gmail.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

stgen_k should be declared as critical to avoid blocking console
when ck_hsi is not used.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 drivers/clk/clk-stm32mp1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index e32fc23..b7b5361 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -1913,8 +1913,7 @@ enum {
 	KCLK(RNG1_K, "rng1_k", rng_src, 0, G_RNG1, M_RNG1),
 	KCLK(RNG2_K, "rng2_k", rng_src, 0, G_RNG2, M_RNG2),
 	KCLK(USBPHY_K, "usbphy_k", usbphy_src, 0, G_USBPHY, M_USBPHY),
-	KCLK(STGEN_K, "stgen_k",  stgen_src, CLK_IGNORE_UNUSED,
-	     G_STGEN, M_STGEN),
+	KCLK(STGEN_K, "stgen_k", stgen_src, CLK_IS_CRITICAL, G_STGEN, M_STGEN),
 	KCLK(SPDIF_K, "spdif_k", spdif_src, 0, G_SPDIF, M_SPDIF),
 	KCLK(SPI1_K, "spi1_k", spi123_src, 0, G_SPI1, M_SPI1),
 	KCLK(SPI2_K, "spi2_k", spi123_src, 0, G_SPI2, M_SPI23),
-- 
1.9.1
