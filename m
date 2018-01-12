From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 5/8] ARM: l2x0: add marvell,ecc-enable property for aurora
Date: Fri, 12 Jan 2018 14:27:52 +1300
Message-ID: <20180112012755.20495-6-chris.packham@alliedtelesis.co.nz>
References: <20180112012755.20495-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180112012755.20495-1-chris.packham@alliedtelesis.co.nz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@armlinux.org.uk, bp@alien8.de, jlu@pengutronix.de
Cc: thomas.petazzoni@free-electrons.com, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>, kernel@pengutronix.de, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The aurora cache on the Marvell Armada-XP SoC supports ECC protection
for the L2 data arrays. Add a "marvell,ecc-enable" device tree property
which can be used to enable this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
[jlu@pengutronix.de: use aurora specific define AURORA_ACR_ECC_EN]
Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/l2c2x0.txt | 2 ++
 arch/arm/mm/cache-l2x0.c                         | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.txt b/Documentation/devicetree/bindings/arm/l2c2x0.txt
index fbe6cb21f4cf..15a84f0ba9f1 100644
--- a/Documentation/devicetree/bindings/arm/l2c2x0.txt
+++ b/Documentation/devicetree/bindings/arm/l2c2x0.txt
@@ -76,6 +76,8 @@ Optional properties:
   specified to indicate that such transforms are precluded.
 - arm,parity-enable : enable parity checking on the L2 cache (L220 or PL310).
 - arm,parity-disable : disable parity checking on the L2 cache (L220 or PL310).
+- marvell,ecc-enable : enable ECC protection on the L2 cache
+- marvell,ecc-disable : disable ECC protection on the L2 cache
 - arm,outer-sync-disable : disable the outer sync operation on the L2 cache.
   Some core tiles, especially ARM PB11MPCore have a faulty L220 cache that
   will randomly hang unless outer sync operations are disabled.
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index b70bee74750d..644f786e4fa9 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1505,6 +1505,13 @@ static void __init aurora_of_parse(const struct device_node *np,
 		mask |= AURORA_ACR_FORCE_WRITE_POLICY_MASK;
 	}
 
+	if (of_property_read_bool(np, "marvell,ecc-enable")) {
+		mask |= AURORA_ACR_ECC_EN;
+		val |= AURORA_ACR_ECC_EN;
+	} else if (of_property_read_bool(np, "marvell,ecc-disable")) {
+		mask |= AURORA_ACR_ECC_EN;
+	}
+
 	if (of_property_read_bool(np, "arm,parity-enable")) {
 		mask |= AURORA_ACR_PARITY_EN;
 		val |= AURORA_ACR_PARITY_EN;
-- 
2.15.1
