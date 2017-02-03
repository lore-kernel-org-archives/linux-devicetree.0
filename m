From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Subject: [PATCH v2 1/6] of: documentation: add bindings documentation for
 TS-4600
Date: Fri,  3 Feb 2017 14:47:24 -0500
Message-ID: <20170203194729.20995-2-sebastien.bourdelin@savoirfairelinux.com>
References: <20170203194729.20995-1-sebastien.bourdelin@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170203194729.20995-1-sebastien.bourdelin@savoirfairelinux.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, kernel@savoirfairelinux.com, robh@kernel.org, linux@roeck-us.net, linus.walleij@linaro.org
Cc: mark.rutland@arm.com, f.fainelli@gmail.com, arnd@arndb.de, mark@embeddedarm.com, suzuki.poulose@arm.com, damien.riegel@savoirfairelinux.com, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, will.deacon@arm.com, linux@armlinux.org.uk, kris@embeddedarm.com, jonathanh@nvidia.com, olof@lixom.net, wim@iguana.be, yamada.masahiro@socionext.com, lucile.quirion@savoirfairelinux.com, kernel@pengutronix.de, fabio.estevam@nxp.com, horms+renesas@verge.net.au, treding@nvidia.com, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

This adds the documentation for the TS-4600 by Technologic Systems.

Acked-by: Rob Herring <robh@kernel.org>
---
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
2.11.0
