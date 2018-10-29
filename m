From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 5/8] ARM: l2x0: add marvell,ecc-enable property for aurora
Date: Mon, 29 Oct 2018 20:25:32 +1300
Message-ID: <20181029072535.31667-6-chris.packham@alliedtelesis.co.nz>
References: <20181029072535.31667-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181029072535.31667-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk
Cc: u.kleine-koenig@pengutronix.de, jlu@pengutronix.de, bp@alien8.de, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The aurora cache on the Marvell Armada-XP SoC supports ECC protection
for the L2 data arrays. Add a "marvell,ecc-enable" device tree property
which can be used to enable this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
[jlu@pengutronix.de: use aurora specific define AURORA_ACR_ECC_EN]
Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
=20Documentation/devicetree/bindings/arm/l2c2x0.txt | 2 ++
=20arch/arm/mm/cache-l2x0.c                         | 7 +++++++
=202 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.txt b/Documenta=
tion/devicetree/bindings/arm/l2c2x0.txt
index fbe6cb21f4cf..15a84f0ba9f1 100644
--- a/Documentation/devicetree/bindings/arm/l2c2x0.txt
+++ b/Documentation/devicetree/bindings/arm/l2c2x0.txt
@@ -76,6 +76,8 @@ Optional properties:
=20  specified to indicate that such transforms are precluded.
=20- arm,parity-enable : enable parity checking on the L2 cache (L220 or =
PL310).
=20- arm,parity-disable : disable parity checking on the L2 cache (L220 o=
r PL310).
+- marvell,ecc-enable : enable ECC protection on the L2 cache
+- marvell,ecc-disable : disable ECC protection on the L2 cache
=20- arm,outer-sync-disable : disable the outer sync operation on the L2 =
cache.
=20  Some core tiles, especially ARM PB11MPCore have a faulty L220 cache =
that
=20  will randomly hang unless outer sync operations are disabled.
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index b70bee74750d..644f786e4fa9 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1505,6 +1505,13 @@ static void __init aurora_of_parse(const struct de=
vice_node *np,
=20		mask |=3D AURORA_ACR_FORCE_WRITE_POLICY_MASK;
=20	}
=20
+	if (of_property_read_bool(np, "marvell,ecc-enable")) {
+		mask |=3D AURORA_ACR_ECC_EN;
+		val |=3D AURORA_ACR_ECC_EN;
+	} else if (of_property_read_bool(np, "marvell,ecc-disable")) {
+		mask |=3D AURORA_ACR_ECC_EN;
+	}
+
=20	if (of_property_read_bool(np, "arm,parity-enable")) {
=20		mask |=3D AURORA_ACR_PARITY_EN;
=20		val |=3D AURORA_ACR_PARITY_EN;
--=20
2.19.1
