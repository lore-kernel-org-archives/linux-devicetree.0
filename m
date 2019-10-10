From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/2] dt-bindings: clock: Add AST2600 RMII RCLK gate
 definitions
Date: Thu, 10 Oct 2019 12:37:24 +1030
Message-ID: <20191010020725.3990-2-andrew@aj.id.au>
References: <20191010020725.3990-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191010020725.3990-1-andrew@aj.id.au>
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

The AST2600 has an explicit gate for the RMII RCLK for each of the four
MACs.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 include/dt-bindings/clock/ast2600-clock.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 38074a5f7296..62b9520a00fd 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -83,6 +83,10 @@
 #define ASPEED_CLK_MAC12		64
 #define ASPEED_CLK_MAC34		65
 #define ASPEED_CLK_USBPHY_40M		66
+#define ASPEED_CLK_MAC1RCLK		67
+#define ASPEED_CLK_MAC2RCLK		68
+#define ASPEED_CLK_MAC3RCLK		69
+#define ASPEED_CLK_MAC4RCLK		70
 
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
-- 
2.20.1
