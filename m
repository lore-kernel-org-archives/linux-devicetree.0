From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 1/6] dt-bindings: display: armada: Rename the binding doc file
Date: Sun, 20 Jan 2019 18:25:29 +0100
Message-ID: <20190120172534.24617-2-lkundrak@v3.sk>
References: <20190120172534.24617-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190120172534.24617-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

It's going to document more than just marvell,dove-lcd: more components
of the display subsystems with more compatible strings.

It seems to make sense to organize this the way it is done in
Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../armada/{marvell,dove-lcd.txt =3D> marvell-armada-drm.txt}       | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/display/armada/{marvell,dove-lc=
d.txt =3D> marvell-armada-drm.txt} (100%)

diff --git a/Documentation/devicetree/bindings/display/armada/marvell,dov=
e-lcd.txt b/Documentation/devicetree/bindings/display/armada/marvell-arma=
da-drm.txt
similarity index 100%
rename from Documentation/devicetree/bindings/display/armada/marvell,dove=
-lcd.txt
rename to Documentation/devicetree/bindings/display/armada/marvell-armada=
-drm.txt
--=20
2.20.1
