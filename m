From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v6 5/9] dt-bindings: ARM: document marvell,ecc-enable binding
Date: Fri,  9 Nov 2018 20:03:45 +1300
Message-ID: <20181109070349.20464-6-chris.packham@alliedtelesis.co.nz>
References: <20181109070349.20464-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181109070349.20464-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, bp@alien8.de, arnd@arndb.de, jlu@pengutronix.de, gregory.clement@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add documentation for the marvell,ecc-enable and marvell,ecc-disable
properties which can be used to enable/disable ECC on the Marvell aurora
cache.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
=20   Changes in v6:
=20   - new (split binding doc from implementation).

=20Documentation/devicetree/bindings/arm/l2c2x0.txt | 2 ++
=201 file changed, 2 insertions(+)

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
--=20
2.19.1
