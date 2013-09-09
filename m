From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH 1/2] DT: add a vendor prefix for Dialog Semiconductor
Date: Mon,  9 Sep 2013 17:51:59 +0200
Message-ID: <1378741920-11085-2-git-send-email-g.liakhovetski@gmx.de>
References: <1378741920-11085-1-git-send-email-g.liakhovetski@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1378741920-11085-1-git-send-email-g.liakhovetski@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Add a commonly used "diasemi" prefix for Dialog Semiconductor PLC.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski+renesas@gmail.com>
---
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 2956800..f8d5a75 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -22,6 +22,7 @@ cortina	Cortina Systems, Inc.
 dallas	Maxim Integrated Products (formerly Dallas Semiconductor)
 davicom	DAVICOM Semiconductor, Inc.
 denx	Denx Software Engineering
+diasemi	Dialog Semiconductor
 emmicro	EM Microelectronic
 epson	Seiko Epson Corp.
 est	ESTeem Wireless Modems
-- 
1.7.2.5
