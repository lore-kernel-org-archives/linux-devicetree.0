From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/2] dt-bindings: clock: Add AST2500 RMII RCLK definitions
Date: Thu, 10 Oct 2019 12:36:54 +1030
Message-ID: <20191010020655.3776-2-andrew@aj.id.au>
References: <20191010020655.3776-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191010020655.3776-1-andrew@aj.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-clk@vger.kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, joel@jms.id.au, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The AST2500 has an explicit gate for the RMII RCLK for each of the two
MACs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
v2: Drop "_GATE" from symbol names

 include/dt-bindings/clock/aspeed-clock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
index f43738607d77..9ff4f6e4558c 100644
--- a/include/dt-bindings/clock/aspeed-clock.h
+++ b/include/dt-bindings/clock/aspeed-clock.h
@@ -39,6 +39,8 @@
 #define ASPEED_CLK_BCLK			33
 #define ASPEED_CLK_MPLL			34
 #define ASPEED_CLK_24M			35
+#define ASPEED_CLK_MAC1RCLK		36
+#define ASPEED_CLK_MAC2RCLK		37
 
 #define ASPEED_RESET_XDMA		0
 #define ASPEED_RESET_MCTP		1
-- 
2.20.1
