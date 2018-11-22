From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 4/9] ARM: l2x0: support parity-enable/disable on aurora
Date: Thu, 22 Nov 2018 13:11:37 +1300
Message-ID: <20181122001142.19187-5-chris.packham@alliedtelesis.co.nz>
References: <20181122001142.19187-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181122001142.19187-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, bp@alien8.de, arnd@arndb.de, jlu@pengutronix.de, gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The aurora cache on the Marvell Armada-XP SoC supports the same tag
parity features as the other l2x0 cache implementations.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
[jlu@pengutronix.de: use aurora specific define AURORA_ACR_PARITY_EN]
Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
=20arch/arm/mm/cache-l2x0.c | 7 +++++++
=201 file changed, 7 insertions(+)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 7d2d2a3c67d0..b70bee74750d 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1505,6 +1505,13 @@ static void __init aurora_of_parse(const struct de=
vice_node *np,
=20		mask |=3D AURORA_ACR_FORCE_WRITE_POLICY_MASK;
=20	}
=20
+	if (of_property_read_bool(np, "arm,parity-enable")) {
+		mask |=3D AURORA_ACR_PARITY_EN;
+		val |=3D AURORA_ACR_PARITY_EN;
+	} else if (of_property_read_bool(np, "arm,parity-disable")) {
+		mask |=3D AURORA_ACR_PARITY_EN;
+	}
+
=20	*aux_val &=3D ~mask;
=20	*aux_val |=3D val;
=20	*aux_mask &=3D ~mask;
--=20
2.19.1
