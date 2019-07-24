Return-Path: <SRS0=vA0O=VV=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/4] dt-bindings: i2c: riic: Rename bindings documentation file
Date: Wed, 24 Jul 2019 14:15:59 +0200
Message-Id: <20190724121559.19079-5-horms+renesas@verge.net.au>
In-Reply-To: <20190724121559.19079-1-horms+renesas@verge.net.au>
References: <20190724121559.19079-1-horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Rename the bindings documentation file for Renesas EMEV2 IIC controller
from i2c-emev2.txt to renesas,iic-emev2.txt.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 .../devicetree/bindings/i2c/{i2c-emev2.txt => renesas,iic-emev2.txt}    | 0
 MAINTAINERS                                                             | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/i2c/{i2c-emev2.txt => renesas,iic-emev2.txt} (100%)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-emev2.txt b/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.txt
similarity index 100%
rename from Documentation/devicetree/bindings/i2c/i2c-emev2.txt
rename to Documentation/devicetree/bindings/i2c/renesas,iic-emev2.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index fc3ed4fe0ba5..e751ebb1a0ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13628,7 +13628,7 @@ F:	drivers/clk/renesas/
 RENESAS EMEV2 I2C DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/i2c/i2c-emev2.txt
+F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.txt
 F:	drivers/i2c/busses/i2c-emev2.c
 
 RENESAS ETHERNET DRIVERS
-- 
2.11.0
