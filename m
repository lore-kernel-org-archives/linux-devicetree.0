From: Jan Tuerk <jan.tuerk@emtrion.com>
Subject: [PATCH v7 2/4] dt-bindings: arm: Document emtrion emCON-MX6 bindings
Date: Wed, 29 Aug 2018 12:07:58 +0200
Message-ID: <20180829100811.55836-2-jan.tuerk@emtrion.com>
References: <20180824132617.43975-1-jan.tuerk@emtrion.com>
 <20180829100811.55836-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180829100811.55836-1-jan.tuerk@emtrion.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Russell King <linux@armlinux.org.uk>, "GitAuthor: Jan Tuerk" <jan.tuerk@emtrion.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Document the compatible strings for emtrion emCON-MX6 SoM's.

Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
---
 Documentation/devicetree/bindings/arm/emtrion.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/emtrion.txt

Unchanged since v6 (rebased)

diff --git a/Documentation/devicetree/bindings/arm/emtrion.txt b/Documentation/devicetree/bindings/arm/emtrion.txt
new file mode 100644
index 000000000000..83329aefc483
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/emtrion.txt
@@ -0,0 +1,12 @@
+Emtrion Devicetree Bindings
+===========================
+
+emCON Series:
+-------------
+
+Required root node properties
+	- compatible:
+	- "emtrion,emcon-mx6", "fsl,imx6q"; 		: emCON-MX6D or emCON-MX6Q SoM
+	- "emtrion,emcon-mx6-avari", "fsl,imx6q";	: emCON-MX6D or emCON-MX6Q SoM on Avari Base
+	- "emtrion,emcon-mx6", "fsl,imx6dl"; 		: emCON-MX6S or emCON-MX6DL SoM
+	- "emtrion,emcon-mx6-avari", "fsl,imx6dl";	: emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
emtrion GmbH
Alter Schlachthof 45
76131 Karlsruhe
GERMANY
https://www.emtrion.de

Amtsgericht Mannheim
HRB 110 300
Geschäftsführer: Dieter Baur, Ramona Maurer
