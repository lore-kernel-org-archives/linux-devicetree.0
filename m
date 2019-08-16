From: Joel Stanley <joel@jms.id.au>
Subject: [PATCH 1/2] dt-bindings: watchdog: Add ast2600 compatible
Date: Sat, 17 Aug 2019 01:33:46 +0930
Message-ID: <20190816160347.23393-2-joel@jms.id.au>
References: <20190816160347.23393-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190816160347.23393-1-joel@jms.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Ryan Chen <ryan_chen@aspeedtech.com>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This adds a compatible for the ast2600, a new ASPEED SoC.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index c5077a1f5cb3..d78d4a8fb868 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -4,6 +4,7 @@ Required properties:
  - compatible: must be one of:
 	- "aspeed,ast2400-wdt"
 	- "aspeed,ast2500-wdt"
+	- "aspeed,ast2600-wdt"
 
  - reg: physical base address of the controller and length of memory mapped
    region
-- 
2.23.0.rc1
