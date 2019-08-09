Return-Path: <SRS0=mJni=WF=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 3/4] dt-bindings: i2c: riic: Rename bindings documentation file
Date: Fri,  9 Aug 2019 14:30:03 -0700
Message-Id: <20190809213004.31181-4-horms+renesas@verge.net.au>
In-Reply-To: <20190809213004.31181-1-horms+renesas@verge.net.au>
References: <20190809213004.31181-1-horms+renesas@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Rename the bindings documentation file for RIIC controller
from i2c-riic.txt to renesas,riic.txt.

This is part of an ongoing effort to name bindings documentation files for
Renesas IP blocks consistently, in line with the compat strings they
document.

Cc: Chris Brandt <chris.brandt@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2
* Add review tag
---
 .../devicetree/bindings/i2c/{i2c-riic.txt => renesas,riic.txt}          | 0
 MAINTAINERS                                                             | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/i2c/{i2c-riic.txt => renesas,riic.txt} (100%)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-riic.txt b/Documentation/devicetree/bindings/i2c/renesas,riic.txt
similarity index 100%
rename from Documentation/devicetree/bindings/i2c/i2c-riic.txt
rename to Documentation/devicetree/bindings/i2c/renesas,riic.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index b8c1181baea9..fc3ed4fe0ba5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13658,7 +13658,7 @@ F:	drivers/i2c/busses/i2c-sh_mobile.c
 RENESAS RIIC DRIVER
 M:	Chris Brandt <chris.brandt@renesas.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/i2c/i2c-riic.txt
+F:	Documentation/devicetree/bindings/i2c/renesas,riic.txt
 F:	drivers/i2c/busses/i2c-riic.c
 
 RENESAS USB PHY DRIVER
-- 
2.11.0
