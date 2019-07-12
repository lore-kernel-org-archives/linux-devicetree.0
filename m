From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v9 5/8] ARM: l2x0: add marvell,ecc-enable property for aurora
Date: Fri, 12 Jul 2019 15:49:01 +1200
Message-ID: <20190712034904.5747-6-chris.packham@alliedtelesis.co.nz>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, patches@armlinux.org.uk, mchehab@kernel.org, james.morse@arm.com, jlu@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The aurora cache on the Marvell Armada-XP SoC supports ECC protection
for the L2 data arrays. Add a "marvell,ecc-enable" device tree property
which can be used to enable this.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
[jlu@pengutronix.de: use aurora specific define AURORA_ACR_ECC_EN]
Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---

Notes:
    Changes in v7:
    - remove marvell,ecc-disable

 arch/arm/mm/cache-l2x0.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 46a616ec6b0c..12c26eb88afb 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -1493,6 +1493,11 @@ static void __init aurora_of_parse(const struct de=
vice_node *np,
 		mask |=3D AURORA_ACR_FORCE_WRITE_POLICY_MASK;
 	}
=20
+	if (of_property_read_bool(np, "marvell,ecc-enable")) {
+		mask |=3D AURORA_ACR_ECC_EN;
+		val |=3D AURORA_ACR_ECC_EN;
+	}
+
 	if (of_property_read_bool(np, "arm,parity-enable")) {
 		mask |=3D AURORA_ACR_PARITY_EN;
 		val |=3D AURORA_ACR_PARITY_EN;
--=20
2.22.0
