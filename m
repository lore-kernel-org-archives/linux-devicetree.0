From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v2 2/3] dt-bindings: arm: fsl: Add i.MX50 based boards
Date: Sun, 31 Mar 2019 21:16:01 +0200
Message-ID: <20190331191602.3921-3-j.neuschaefer@gmx.net>
References: <20190331191602.3921-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331191602.3921-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, =?UTF-8?q?Vok=C3=A1=C4=8D=20Michal?= <Michal.Vokac@ysoft.com>, Thierry Reding <treding@nvidia.com>, Kevin Hilman <khilman@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.orglinux-
List-Id: devicetree@vger.kernel.org

fsl,imx50-evk has been used in a devicetree for a while. kobo,aura will
be used soon.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2: New patch, as suggested by Shawn Guo
=2D--
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentatio=
n/devicetree/bindings/arm/fsl.yaml
index 7e2cd6ad26bd..618bf58796eb 100644
=2D-- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -51,6 +51,13 @@ properties:
           - const: i2se,duckbill-2
           - const: fsl,imx28

+      - description: i.MX50 based Boards
+        items:
+          - enum:
+              - fsl,imx50-evk
+              - kobo,aura
+          - const: fsl,imx50
+
       - description: i.MX51 Babbage Board
         items:
           - enum:
=2D-
2.20.1
