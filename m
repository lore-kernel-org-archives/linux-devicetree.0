From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Subject: [PATCH 1/6] of: documentation: add bindings documentation for TS-4600
Date: Wed, 14 Dec 2016 18:12:31 -0500
Message-ID: <20161214231237.17496-2-sebastien.bourdelin@savoirfairelinux.com>
References: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel@savoirfairelinux.com
Cc: mark@embeddedarm.com, kris@embeddedarm.com, horms+renesas@verge.net.au, treding@nvidia.com, jonathanh@nvidia.com, f.fainelli@gmail.com, fabio.estevam@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org, linux@armlinux.org.uk, linux@roeck-us.net, wim@iguana.be, mark.rutland@arm.com, robh+dt@kernel.org, damien.riegel@savoirfairelinux.com, lucile.quirion@savoirfairelinux.com, olof@lixom.net, arnd@arndb.de, suzuki.poulose@arm.com, linus.walleij@linaro.org, will.deacon@arm.com, yamada.masahiro@socionext.com, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
List-Id: devicetree@vger.kernel.org

This adds the documentation for the TS-4600 by Technologic Systems.

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 Documentation/devicetree/bindings/arm/technologic.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/technologic.txt b/Documentation/devicetree/bindings/arm/technologic.txt
index 33797ac..e9d6d65 100644
--- a/Documentation/devicetree/bindings/arm/technologic.txt
+++ b/Documentation/devicetree/bindings/arm/technologic.txt
@@ -1,6 +1,11 @@
 Technologic Systems Platforms Device Tree Bindings
 --------------------------------------------------
 
+TS-4600 is a System-on-Module based on the Freescale i.MX28 System-on-Chip.
+It can be mounted on a carrier board providing additional peripheral connectors.
+Required root node properties:
+	- compatible = "technologic,imx28-ts4600", "fsl,imx28"
+
 TS-4800 board
 Required root node properties:
 	- compatible = "technologic,imx51-ts4800", "fsl,imx51";
-- 
2.10.2
