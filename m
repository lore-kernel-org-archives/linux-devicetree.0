From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: [PATCH v2 4/4] dt-bindings/watchdog: Add access_cs0 option for alt-boot
Date: Mon, 26 Aug 2019 13:46:36 +0300
Message-ID: <20190826104636.19324-5-i.mikhaylov@yadro.com>
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190826104636.19324-1-i.mikhaylov@yadro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>
List-Id: devicetree@vger.kernel.org

The option for the ast2400/2500 to get access to CS0 at runtime.

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index c5077a1f5cb3..023a9b578df6 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -34,6 +34,13 @@ Optional properties:
                 engine is responsible for this.
 
  - aspeed,alt-boot:    If property is present then boot from alternate block.
+                       At alternate side 'access_cs0' sysfs file provides:
+                       ast2400: a way to get access to the primary SPI flash
+                                chip at CS0 after booting from the alternate
+                                chip at CS1.
+                       ast2500: a way to restore the normal address mapping from
+                                (CS0->CS1, CS1->CS0) to (CS0->CS0, CS1->CS1).
+
  - aspeed,external-signal: If property is present then signal is sent to
 			external reset counter (only WDT1 and WDT2). If not
 			specified no external signal is sent.
-- 
2.20.1
