From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/8] MAINTAINERS: Add glob for Aspeed devicetree bindings
Date: Fri, 19 Aug 2016 22:14:07 +0930
Message-ID: <20160819124414.24242-2-andrew@aj.id.au>
References: <20160819124414.24242-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160819124414.24242-1-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a306795a7450..b9d5a9d4eee6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1027,6 +1027,7 @@ S:	Maintained
 F:	arch/arm/mach-aspeed/
 F:	arch/arm/boot/dts/aspeed-*
 F:	drivers/*/*aspeed*
+F:	Documentation/devicetree/bindings/*/*aspeed*
 
 ARM/ATMEL AT91RM9200, AT91SAM9 AND SAMA5 SOC SUPPORT
 M:	Nicolas Ferre <nicolas.ferre@atmel.com>
-- 
2.9.3
