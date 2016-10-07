From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH v4 02/10] MAINTAINERS: Add myself as maintainer of sun8i-emac
Date: Fri,  7 Oct 2016 10:25:49 +0200
Message-ID: <1475828757-926-3-git-send-email-clabbe.montjoie@gmail.com>
References: <1475828757-926-1-git-send-email-clabbe.montjoie@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1475828757-926-1-git-send-email-clabbe.montjoie@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@free-electrons.com, wens@csie.org, linux@armlinux.org.uk, davem@davemloft.net, f.fainelli@gmail.com, andrew@lunn.ch
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch add myself as maintainer of the sun8i-emac driver.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 40f4629..e197d82 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -582,6 +582,12 @@ S:	Maintained
 F:	Documentation/i2c/busses/i2c-ali1563
 F:	drivers/i2c/busses/i2c-ali1563.c
 
+ALLWINNER SUN8I-EMAC ETHERNET DRIVER
+M:	Corentin Labbe <clabbe.montjoie@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/ethernet/allwinner/sun8i-emac.c
+
 ALLWINNER SECURITY SYSTEM
 M:	Corentin Labbe <clabbe.montjoie@gmail.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.7.3
