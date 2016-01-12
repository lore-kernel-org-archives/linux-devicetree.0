From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH 14/14] ARM: dts: imx6: make audmux optional for i.MX6UL sound driver
Date: Tue, 12 Jan 2016 18:21:31 +0100
Message-ID: <1452619291-13625-15-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-2-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-3-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-4-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-5-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-6-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-7-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-8-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-9-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-10-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-11-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-12-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-13-git-send-email-LW@KARO-electronics.de>
 <1452619291-13625-14-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452619291-13625-14-git-send-email-LW@KARO-electronics.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

i.MX6UL does not have the audio multiplexer (AUDMUX) like the other
i.MX6 SoCs, but apart from that can use the same audio driver. Make
audmux optional for the imx-sgtl5000 driver, so it can be used on
i.MX6UL too. Furthermore i.MX6UL requires use of the SAI interface
rather than SSI. Change the DTS documentation accordingly.

The patch with the corresponding changes to the imx-sgtl5000 driver
will be sent separately.

Signed-off-by: Lothar Wa=C3=9Fmann <LW@KARO-electronics.de>
---
 .../bindings/sound/imx-audio-sgtl5000.txt          | 26 ++++++++++++++=
+++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000=
=2Etxt b/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt
index 2f89db8..fd46671 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt
+++ b/Documentation/devicetree/bindings/sound/imx-audio-sgtl5000.txt
@@ -6,7 +6,7 @@ Required properties:
=20
   - model		: The user-visible name of this sound complex
=20
-  - ssi-controller	: The phandle of the i.MX SSI controller
+  - ssi-controller	: The phandle of the i.MX SSI (or SAI) controller
=20
   - audio-codec		: The phandle of the SGTL5000 audio codec
=20
@@ -39,6 +39,16 @@ Required properties:
 Note: The AUDMUX port numbering should start at 1, which is consistent=
 with
 hardware manual.
=20
+Optional properties:
+  - fsl,no-audmux	: boolean
+    			  Required for i.MX6UL (and maybe other SoCs)
+    			  which don't have an AUDMUX, but still
+			  feature the same audio subsystem otherwise.
+
+Note: Setting this property will make mux-int-port and mux-ext-port
+obsolete.
+
+
 Example:
=20
 sound {
@@ -54,3 +64,17 @@ sound {
 	mux-int-port =3D <1>;
 	mux-ext-port =3D <3>;
 };
+
+or (e.g. for i.MX6UL):
+sound {
+	compatible =3D "karo,imx6ul-tx6ul-sgtl5000",
+		     "fsl,imx-audio-sgtl5000";
+	model =3D "imx6ul-tx6ul-sgtl5000";
+	ssi-controller =3D <&sai2>;
+	audio-codec =3D <&sgtl5000>;
+	audio-routing =3D
+		"MIC_IN", "Mic Jack",
+		"Mic Jack", "Mic Bias",
+		"Headphone Jack", "HP_OUT";
+	fsl,no-audmux;
+};
--=20
2.1.4
