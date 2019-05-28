Return-Path: <SRS0=ExU1=T4=linaro.org=masahisa.kojima@kernel.org>
From: Masahisa Kojima <masahisa.kojima@linaro.org>
Subject: [PATCH v6 1/3] MAINTAINERS: Add entry for Synquacer SPI driver
Date: Tue, 28 May 2019 18:27:11 +0900
Message-Id: <20190528092713.10516-2-masahisa.kojima@linaro.org>
In-Reply-To: <20190528092713.10516-1-masahisa.kojima@linaro.org>
References: <20190528092713.10516-1-masahisa.kojima@linaro.org>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org
Cc: broonie@kernel.org, geert@linux-m68k.org, tpiepho@impinj.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, ard.biesheuvel@linaro.org, jaswinder.singh@linaro.org, masami.hiramatsu@linaro.org, okamoto.satoru@socionext.com, osaki.yoshitoyo@socionext.com, Masahisa Kojima <masahisa.kojima@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add entry for the Synquacer spi driver and DT bindings.

Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c55b0fedbe2..a4970349ef4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14597,6 +14597,14 @@ S:	Maintained
 F:	drivers/net/ethernet/socionext/netsec.c
 F:	Documentation/devicetree/bindings/net/socionext-netsec.txt
 
+SOCIONEXT (SNI) Synquacer SPI DRIVER
+M:	Masahisa Kojima <masahisa.kojima@linaro.org>
+M:	Jassi Brar <jaswinder.singh@linaro.org>
+L:	linux-spi@vger.kernel.org
+S:	Maintained
+F:	drivers/spi/spi-synquacer.c
+F:	Documentation/devicetree/bindings/spi/spi-synquacer.txt
+
 SOLIDRUN CLEARFOG SUPPORT
 M:	Russell King <linux@armlinux.org.uk>
 S:	Maintained
-- 
2.14.2
