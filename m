From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH 2/2] dt-bindings: bus: imx-weim: document optional burst clock mode
Date: Fri, 12 Jul 2019 16:43:16 -0400
Message-ID: <20190712204316.16783-2-TheSven73@gmail.com>
References: <20190712204316.16783-1-TheSven73@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712204316.16783-1-TheSven73@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

An optional devicetree property was added to the imx-weim driver,
which if present instructs it to operate in burst clock mode.
Update the dt-bindings to reflect this.

Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 Documentation/devicetree/bindings/bus/imx-weim.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/imx-weim.txt b/Documentation/devicetree/bindings/bus/imx-weim.txt
index dda7d6d66479..1b1d1c5c21ea 100644
--- a/Documentation/devicetree/bindings/bus/imx-weim.txt
+++ b/Documentation/devicetree/bindings/bus/imx-weim.txt
@@ -44,6 +44,10 @@ Optional properties:
 			what bootloader sets up in IOMUXC_GPR1[11:0] will be
 			used.
 
+ - fsl,burst-clk-enable	For "fsl,imx50-weim" and "fsl,imx6q-weim" type of
+			devices, the presence of this property indicates that
+			the weim bus should operate in Burst Clock Mode.
+
 Timing property for child nodes. It is mandatory, not optional.
 
  - fsl,weim-cs-timing:	The timing array, contains timing values for the
-- 
2.17.1
