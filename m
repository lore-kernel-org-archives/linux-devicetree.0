From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH v3 1/2] dt-bindings: phy: Update SERDES_MAX to be SERDES_MAX
 + 1
Date: Fri, 19 Oct 2018 11:19:13 +0200
Message-ID: <5ae446d31ba33cb005d181b376ee650ab2f783e2.1539940387.git.gustavo@embeddedor.com>
References: <cover.1539940387.git.gustavo@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1539940387.git.gustavo@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>, "David S. Miller" <davem@davemloft.net>, Quentin Schulz <quentin.schulz@bootlin.com>, netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: devicetree@vger.kernel.org

SERDES_MAX is a valid value to index ctrl->phys in
drivers/phy/mscc/phy-ocelot-serdes.c. But, currently,
there is an out-of-bounds bug in the mentioned driver
when reading from ctrl->phys, because the size of
array ctrl->phys is SERDES_MAX.

Partially fix this by updating SERDES_MAX to be SERDES6G_MAX + 1.

Notice that this is the first part of the solution to
the out-of-bounds bug mentioned above. Although this
change is not dependent on any other one.

Suggested-by: Quentin Schulz <quentin.schulz@bootlin.com>
Reviewed-by: Quentin Schulz <quentin.schulz@bootlin.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
Changes in v3:
 - Post the patch to netdev.

Changes in v2:
 - Add Quentin's Reviewed-by to commit log.
 - Add Rob's Acked-by to commit log.

 include/dt-bindings/phy/phy-ocelot-serdes.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/phy/phy-ocelot-serdes.h b/include/dt-bindings/phy/phy-ocelot-serdes.h
index bd28f21..fe70ada 100644
--- a/include/dt-bindings/phy/phy-ocelot-serdes.h
+++ b/include/dt-bindings/phy/phy-ocelot-serdes.h
@@ -7,6 +7,6 @@
 #define SERDES1G_MAX	SERDES1G(5)
 #define SERDES6G(x)	(SERDES1G_MAX + 1 + (x))
 #define SERDES6G_MAX	SERDES6G(2)
-#define SERDES_MAX	SERDES6G_MAX
+#define SERDES_MAX	(SERDES6G_MAX + 1)
 
 #endif
-- 
2.7.4
