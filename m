From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v3 14/16] ARM: marvell/dt: enable crypto on armada-xp-gp
Date: Fri, 22 May 2015 15:34:00 +0200
Message-ID: <1432301642-11470-15-git-send-email-boris.brezillon@free-electrons.com>
References: <1432301642-11470-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-crypto-owner@vger.kernel.org>
In-Reply-To: <1432301642-11470-1-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-crypto-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Arnaud Ebalard <arno@natisbad.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Tawfik Bayouk <tawfik@marvell.com>, Lior Amsalem <alior@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Eran Ben-Avi <benavi@marvell.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enable the crypto IP on armada-xp-gp.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 arch/arm/boot/dts/armada-xp-gp.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
index 565227e..8a739f4 100644
--- a/arch/arm/boot/dts/armada-xp-gp.dts
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -94,7 +94,9 @@
 	soc {
 		ranges = <MBUS_ID(0xf0, 0x01) 0 0 0xf1000000 0x100000
 			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000
-			  MBUS_ID(0x01, 0x2f) 0 0 0xf0000000 0x1000000>;
+			  MBUS_ID(0x01, 0x2f) 0 0 0xf0000000 0x1000000
+			  MBUS_ID(0x09, 0x09) 0 0 0xf1100000 0x10000
+			  MBUS_ID(0x09, 0x05) 0 0 0xf1110000 0x10000>;
 
 		devbus-bootcs {
 			status = "okay";
-- 
1.9.1
