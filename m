From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 5/6] pinctrl: aspeed: Add SIG_DESC_CLEAR() helper
Date: Mon, 29 Jul 2019 15:26:03 +0930
Message-ID: <20190729055604.13239-6-andrew@aj.id.au>
References: <20190729055604.13239-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729055604.13239-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, ryanchen.aspeed@gmail.com, johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The complement of SIG_DESC_SET().

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinmux-aspeed.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/aspeed/pinmux-aspeed.h b/drivers/pinctrl/aspeed/pinmux-aspeed.h
index 474820df6263..c59e936a7dde 100644
--- a/drivers/pinctrl/aspeed/pinmux-aspeed.h
+++ b/drivers/pinctrl/aspeed/pinmux-aspeed.h
@@ -508,6 +508,7 @@ struct aspeed_pin_desc {
  * @idx: The bit index in the register
  */
 #define SIG_DESC_SET(reg, idx) SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, 1)
+#define SIG_DESC_CLEAR(reg, idx) SIG_DESC_IP_BIT(ASPEED_IP_SCU, reg, idx, 0)
 
 #define SIG_DESC_LIST_SYM(sig, group) sig_descs_ ## sig ## _ ## group
 #define SIG_DESC_LIST_DECL(sig, group, ...) \
-- 
2.20.1
