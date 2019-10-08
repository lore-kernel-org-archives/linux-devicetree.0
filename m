From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 6/7] pinctrl: aspeed-g6: Fix UART13 group pinmux
Date: Tue,  8 Oct 2019 15:11:52 +1030
Message-ID: <20191008044153.12734-7-andrew@aj.id.au>
References: <20191008044153.12734-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191008044153.12734-1-andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Johnny Huang <johnny_huang@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, ryanchen.aspeed@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Johnny Huang <johnny_huang@aspeedtech.com>

When UART13G1 is set the pinmux configuration in SCU4B8 for UART13G0
should be cleared.

Fixes: 58dc52ad00a0 ("pinctrl: aspeed: Add AST2600 pinmux support")
Signed-off-by: Johnny Huang <johnny_huang@aspeedtech.com>
[AJ: Tweak commit message]
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 68b066594461..dc17cf3d3549 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -1262,13 +1262,13 @@ GROUP_DECL(SPI1, AB11, AC11, AA11);
 #define AD11 206
 SIG_EXPR_LIST_DECL_SEMG(AD11, SPI1DQ2, QSPI1, SPI1, SIG_DESC_SET(SCU438, 14));
 SIG_EXPR_LIST_DECL_SEMG(AD11, TXD13, UART13G1, UART13,
-			SIG_DESC_SET(SCU438, 14));
+			SIG_DESC_CLEAR(SCU4B8, 2), SIG_DESC_SET(SCU4D8, 14));
 PIN_DECL_2(AD11, GPIOZ6, SPI1DQ2, TXD13);
 
 #define AF10 207
 SIG_EXPR_LIST_DECL_SEMG(AF10, SPI1DQ3, QSPI1, SPI1, SIG_DESC_SET(SCU438, 15));
 SIG_EXPR_LIST_DECL_SEMG(AF10, RXD13, UART13G1, UART13,
-			SIG_DESC_SET(SCU438, 15));
+			SIG_DESC_CLEAR(SCU4B8, 3), SIG_DESC_SET(SCU4D8, 15));
 PIN_DECL_2(AF10, GPIOZ7, SPI1DQ3, RXD13);
 
 GROUP_DECL(QSPI1, AB11, AC11, AA11, AD11, AF10);
-- 
2.20.1
