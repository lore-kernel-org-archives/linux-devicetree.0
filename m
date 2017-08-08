From: Andrew Jeffery <andrew@aj.id.au>
Subject: [RESEND PATCH 1/2] dt-bindings: gpio: aspeed: Remove reference to clock name
Date: Tue,  8 Aug 2017 15:46:33 +0930
Message-ID: <20170808061634.11857-2-andrew@aj.id.au>
References: <20170808061634.11857-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170808061634.11857-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, ryan_chen@aspeedtech.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

HPLL was in fact not the clock we need. Remove prescription of which
clock to avoid further error. Please refer to your datasheet and double
check like I should have.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index c756afa88cc6..fc6378c778c5 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -18,7 +18,7 @@ Required properties:
 Optional properties:
 
 - interrupt-parent      : The parent interrupt controller, optional if inherited
-- clocks                : A phandle to the HPLL clock node for debounce timings
+- clocks                : A phandle to the clock to use for debounce timings
 
 The gpio and interrupt properties are further described in their respective
 bindings documentation:
-- 
2.11.0
