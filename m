From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] of: Add vendor prefix for Arasan
Date: Thu, 12 Feb 2015 09:38:40 +0100
Message-ID: <488161d515944ef059b620ea72bca1166b8da2c5.1423730315.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: devicetree@vger.kernel.org, Hayato Suzuki <hytszk@gmail.com>, Thierry Reding <treding@nvidia.com>, Shawn Guo <shawn.guo@linaro.org>, Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Florian Vaussard <florian.vaussard@epfl.ch>
List-Id: devicetree@vger.kernel.org

PATA(pata_arasan_cf.c) and SDHCI(sdhci-of-arasan.c) drivers
are already using this prefix.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

https://arasan.com/contact/
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index b1df0ad1306c..7da04260a680 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -18,6 +18,7 @@ amlogic	Amlogic, Inc.
 ams	AMS AG
 amstaos	AMS-Taos Inc.
 apm	Applied Micro Circuits Corporation (APM)
+arasan	Arasan Chip Systems
 arm	ARM Ltd.
 armadeus	ARMadeus Systems SARL
 atmel	Atmel Corporation
-- 
1.8.2.3
