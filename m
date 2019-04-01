From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 11/15] phy: mvebu-cp110-comphy: Update comment about powering
 off all lanes at boot
Date: Mon,  1 Apr 2019 18:51:27 +0200
Message-ID: <20190401165131.23370-12-miquel.raynal@bootlin.com>
References: <20190401165131.23370-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190401165131.23370-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Now that all COMPHY modes are supported by the driver, update the
comment stating that mvebu_comphy_power_off() should be called for
each lane. This is still wrong because for compatibility reasons, it
might break users running an old firmware (the driver only uses SMC
calls for SATA, USB and PCIe configuration, there is no code in Linux
to fallback on in these cases.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/phy/marvell/phy-mvebu-cp110-comphy.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
index d66412b38ff7..6f6c26c1c622 100644
--- a/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
+++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy.c
@@ -841,9 +841,11 @@ static int mvebu_comphy_probe(struct platform_device *pdev)
 		phy_set_drvdata(phy, lane);
 
 		/*
-		 * Once all modes are supported in this driver we should call
+		 * All modes are supported in this driver so we could call
 		 * mvebu_comphy_power_off(phy) here to avoid relying on the
-		 * bootloader/firmware configuration.
+		 * bootloader/firmware configuration, but for compatibility
+		 * reasons we cannot de-configure the COMPHY without being sure
+		 * that the firmware is up-to-date and fully-featured.
 		 */
 	}
 
-- 
2.19.1
