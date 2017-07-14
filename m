From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Subject: [PATCH v4 1/8] of: documentation: add bindings documentation for TS-4600
Date: Fri, 14 Jul 2017 16:08:46 -0400
Message-ID: <20170714200853.10362-2-sebastien.bourdelin@savoirfairelinux.com>
References: <20170714200853.10362-1-sebastien.bourdelin@savoirfairelinux.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170714200853.10362-1-sebastien.bourdelin@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel@savoirfairelinux.com, robh@kernel.org, linux@roeck-us.net, linus.walleij@linaro.org, shawnguo@kernel.org
Cc: fabio.estevam@nxp.com, mark@embeddedarm.com, kris@embeddedarm.com, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
List-Id: devicetree@vger.kernel.org

This adds the documentation for the TS-4600 by Technologic Systems.

Acked-by: Rob Herring <robh@kernel.org>
---
Changes v3 -> v4:
  - rebase on master

Changes v2 -> v3:
  - rebase on master

Changes v1 -> v2:
  - rebase on master
  - add ack by Rob Herring <robh@kernel.org>
Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 Documentation/devicetree/bindings/arm/technologic.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/technologic.txt b/Documentation/devicetree/bindings/arm/technologic.txt
index 33797acad846..e9d6d6575566 100644
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
2.13.0
