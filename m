From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v9 4/8] dt-bindings: ARM: document marvell,ecc-enable binding
Date: Fri, 12 Jul 2019 15:49:00 +1200
Message-ID: <20190712034904.5747-5-chris.packham@alliedtelesis.co.nz>
References: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712034904.5747-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: bp@alien8.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, patches@armlinux.org.uk, mchehab@kernel.org, james.morse@arm.com, jlu@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

Add documentation for the marvell,ecc-enable properties which can be
used to enable ECC on the Marvell aurora cache.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Notes:
    Changes in v7:
    - remove marvell,ecc-disable
    Changes in v6:
    - new (split binding doc from implementation).

 Documentation/devicetree/bindings/arm/l2c2x0.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.yaml b/Document=
ation/devicetree/bindings/arm/l2c2x0.yaml
index bfc5c185561c..913a8cd8b2c0 100644
--- a/Documentation/devicetree/bindings/arm/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/arm/l2c2x0.yaml
@@ -176,6 +176,10 @@ properties:
     description: disable parity checking on the L2 cache (L220 or PL310)=
.
     type: boolean
=20
+  marvell,ecc-enable:
+    description: enable ECC protection on the L2 cache
+    type: boolean
+
   arm,outer-sync-disable:
     description: disable the outer sync operation on the L2 cache.
       Some core tiles, especially ARM PB11MPCore have a faulty L220 cach=
e that
--=20
2.22.0
