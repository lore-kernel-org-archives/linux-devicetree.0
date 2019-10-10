From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/3] dt-bindings: net: ftgmac100: Document AST2600 compatible
Date: Thu, 10 Oct 2019 12:37:54 +1030
Message-ID: <20191010020756.4198-2-andrew@aj.id.au>
References: <20191010020756.4198-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191010020756.4198-1-andrew@aj.id.au>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

The AST2600 contains an FTGMAC100-compatible MAC, although the MDIO
controller previously embedded in the MAC has been moved out to a
dedicated MDIO block.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/net/ftgmac100.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
index 72e7aaf7242e..04cc0191b7dd 100644
--- a/Documentation/devicetree/bindings/net/ftgmac100.txt
+++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
@@ -9,6 +9,7 @@ Required properties:
 
      - "aspeed,ast2400-mac"
      - "aspeed,ast2500-mac"
+     - "aspeed,ast2600-mac"
 
 - reg: Address and length of the register set for the device
 - interrupts: Should contain ethernet controller interrupt
-- 
2.20.1
