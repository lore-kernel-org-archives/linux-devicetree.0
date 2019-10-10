From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 2/3] dt-bindings: net: ftgmac100: Describe clock properties
Date: Thu, 10 Oct 2019 12:37:55 +1030
Message-ID: <20191010020756.4198-3-andrew@aj.id.au>
References: <20191010020756.4198-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20191010020756.4198-1-andrew@aj.id.au>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, benh@kernel.crashing.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Critically, the AST2600 requires ungating the RMII RCLK if e.g. NCSI is
in use.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Acked-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/net/ftgmac100.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
index 04cc0191b7dd..f878c1103463 100644
--- a/Documentation/devicetree/bindings/net/ftgmac100.txt
+++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
@@ -24,6 +24,13 @@ Optional properties:
 - no-hw-checksum: Used to disable HW checksum support. Here for backward
   compatibility as the driver now should have correct defaults based on
   the SoC.
+- clocks: In accordance with the generic clock bindings. Must describe the MAC
+  IP clock, and optionally an RMII RCLK gate for the AST2500/AST2600. The
+  required MAC clock must be the first cell.
+- clock-names:
+
+      - "MACCLK": The MAC IP clock
+      - "RCLK": Clock gate for the RMII RCLK
 
 Example:
 
-- 
2.20.1
