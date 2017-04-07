From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 2/4] gpio: aspeed: dt: Add optional clocks property
Date: Fri,  7 Apr 2017 22:29:00 +0930
Message-ID: <20170407125902.15960-3-andrew@aj.id.au>
References: <20170407125902.15960-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170407125902.15960-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

We need a reference to the HPLL to calculate debounce cycles. If the
clocks property is not supplied in the GPIO node then the consumer
should deny any debounce requests.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index 6f30b9a048da..c756afa88cc6 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -18,6 +18,7 @@ Required properties:
 Optional properties:
 
 - interrupt-parent      : The parent interrupt controller, optional if inherited
+- clocks                : A phandle to the HPLL clock node for debounce timings
 
 The gpio and interrupt properties are further described in their respective
 bindings documentation:
-- 
2.9.3
