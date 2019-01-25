From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 07/10] MAINTAINERS: phy: fill Armada 3700 PHY drivers entry
Date: Fri, 25 Jan 2019 11:39:21 +0100
Message-ID: <20190125103925.15753-8-miquel.raynal@bootlin.com>
References: <20190125103925.15753-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190125103925.15753-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, linux-usb@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Update the Armada 3700 PHY drivers entry with the recently added UTMI
PHY driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index abfd80f21b24..2a08a097e107 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9080,11 +9080,13 @@ F:	drivers/gpu/drm/armada/
 F:	include/uapi/drm/armada_drm.h
 F:	Documentation/devicetree/bindings/display/armada/
 
-MARVELL ARMADA 3700 COMPHY DRIVER
+MARVELL ARMADA 3700 PHY DRIVERS
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 S:	Maintained
 F:	drivers/phy/marvell/phy-mvebu-a3700-comphy.c
+F:	drivers/phy/marvell/phy-mvebu-a3700-utmi.c
 F:	Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt
+F:	Documentation/devicetree/bindings/phy/phy-mvebu-utmi.txt
 
 MARVELL CRYPTO DRIVER
 M:	Boris Brezillon <bbrezillon@kernel.org>
-- 
2.19.1
