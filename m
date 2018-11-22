From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/6] phy: enumerate SATA PHY mode
Date: Thu, 22 Nov 2018 22:04:15 +0100
Message-ID: <20181122210420.14861-2-miquel.raynal@bootlin.com>
References: <20181122210420.14861-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181122210420.14861-1-miquel.raynal@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add SATA mode to the PHY framework in preparation of upcoming PHYs
that will handle it. For instance, SATA mode will be used by the
Armada3700 COMPHY driver, which supports configuring SERDES lanes to
be used by various controllers: Ethernet, USB3, SATA and PCIe.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 03b319f89a34..553d8520e37f 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -42,6 +42,7 @@ enum phy_mode {
 	PHY_MODE_UFS_HS_A,
 	PHY_MODE_UFS_HS_B,
 	PHY_MODE_PCIE,
+	PHY_MODE_SATA,
 };
 
 /**
-- 
2.19.1
