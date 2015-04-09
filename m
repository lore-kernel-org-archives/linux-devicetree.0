From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH] of: Add vendor prefix for Ceva
Date: Thu,  9 Apr 2015 08:25:25 +0200
Message-ID: <c375aea11f3d36a6711639bd5628b8f1447c7441.1428560720.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu
Cc: Suneel <suneelg@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thierry Reding <treding@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, Arnaud Ebalard <arno@natisbad.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Hayato Suzuki <hytszk@gmail.com>, Antony Pavlov <antonynpavlov@gmail.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

http://www.ceva-dsp.com/Company-Overview

---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index fae26d014aaf..b1db8076e683 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -36,6 +36,7 @@ calxeda	Calxeda
 capella	Capella Microsystems, Inc
 cavium	Cavium, Inc.
 cdns	Cadence Design Systems Inc.
+ceva	Ceva, Inc.
 chipidea	Chipidea, Inc
 chipspark	ChipSPARK
 chrp	Common Hardware Reference Platform
-- 
2.3.5
