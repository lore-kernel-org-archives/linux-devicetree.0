Return-Path: <SRS0=vA0O=VV=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/4] dt-bindings: i2c: rcar: Rename bindings documentation file
Date: Wed, 24 Jul 2019 14:15:57 +0200
Message-Id: <20190724121559.19079-3-horms+renesas@verge.net.au>
In-Reply-To: <20190724121559.19079-1-horms+renesas@verge.net.au>
References: <20190724121559.19079-1-horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Rename the bindings documentation file for R-Car I2C controller
from i2c-rcar.txt to renesas,rcar.txt.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/i2c/{i2c-rcar.txt => renesas,i2c.txt} | 0
 MAINTAINERS                                                             | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/i2c/{i2c-rcar.txt => renesas,i2c.txt} (100%)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
similarity index 100%
rename from Documentation/devicetree/bindings/i2c/i2c-rcar.txt
rename to Documentation/devicetree/bindings/i2c/renesas,i2c.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index 4c8262837da9..b8c1181baea9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13650,7 +13650,7 @@ F:	drivers/iio/adc/rcar-gyroadc.c
 RENESAS R-CAR I2C DRIVERS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/i2c/i2c-rcar.txt
+F:	Documentation/devicetree/bindings/i2c/renesas,i2c.txt
 F:	Documentation/devicetree/bindings/i2c/renesas,iic.txt
 F:	drivers/i2c/busses/i2c-rcar.c
 F:	drivers/i2c/busses/i2c-sh_mobile.c
-- 
2.11.0
