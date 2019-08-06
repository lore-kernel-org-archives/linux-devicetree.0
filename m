From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 04/20] MAINTAINERS: Add new Marvell CN9130-based files to track
Date: Tue,  6 Aug 2019 16:54:44 +0200
Message-ID: <20190806145500.24109-5-miquel.raynal@bootlin.com>
References: <20190806145500.24109-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190806145500.24109-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Marvell has a new branch of products called CN9130 based on AP807 and
CP115 which are derivatives of the currently supported AP806 and
CP110. Update the MAINTAINERS entry to reflect this change in the
naming.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 783569e3c4b4..0d35614fc5e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1865,7 +1865,7 @@ F:	arch/arm/boot/dts/dove*
 F:	arch/arm/boot/dts/orion5x*
 T:	git git://git.infradead.org/linux-mvebu.git
 
-ARM/Marvell Kirkwood and Armada 370, 375, 38x, 39x, XP, 3700, 7K/8K SOC support
+ARM/Marvell Kirkwood and Armada 370, 375, 38x, 39x, XP, 3700, 7K/8K, CN9130 SOC support
 M:	Jason Cooper <jason@lakedaemon.net>
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Gregory Clement <gregory.clement@bootlin.com>
@@ -1877,6 +1877,7 @@ F:	arch/arm/boot/dts/kirkwood*
 F:	arch/arm/configs/mvebu_*_defconfig
 F:	arch/arm/mach-mvebu/
 F:	arch/arm64/boot/dts/marvell/armada*
+F:	arch/arm64/boot/dts/marvell/cn913*
 F:	drivers/cpufreq/armada-37xx-cpufreq.c
 F:	drivers/cpufreq/armada-8k-cpufreq.c
 F:	drivers/cpufreq/mvebu-cpufreq.c
-- 
2.20.1
