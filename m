From: Arnaud Ebalard <arno@natisbad.org>
Subject: [PATCHv1 4/6] rtc: rtc-isl12057: fix isil vs isl naming for intersil
Date: Sat, 15 Nov 2014 00:07:05 +0100
Message-ID: <3dde5b6adfc9c953e0c943b0b40ccd2177508030.1416006090.git.arno@natisbad.org>
References: <cover.1416006090.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cover.1416006090.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
List-Id: devicetree@vger.kernel.org


When Intersil ISL12057 driver was introduced by commit 70e123373c05
("rtc: Add support for Intersil ISL12057 I2C RTC chip"), the vendor
prefix 'isl' was used instead of the expected 'isil' (Intersil
NASDAQ symbol). Recently, a patch from Philip Zabel (7a6540ca856a,
"ARM: mvebu: Change vendor prefix for Intersil Corporation to isil")
fixed that prefix in ReadyNAS devices .dts files (AFAICT, the only
users).

That patch completes that work to change the remaining values in:

 - Intersil ISL12057 driver (compatible string) and also associated
   Documentation/devicetree/bindings/i2c/trivial-devices.txt file
   to reflect the changes introduced by previous commit from Philip
 - Documentation/devicetree/bindings/vendor-prefixes.txt files to
   avoid future mistakes

Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 2 +-
 Documentation/devicetree/bindings/vendor-prefixes.txt     | 2 +-
 drivers/rtc/rtc-isl12057.c                                | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt =
b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index fbde415078e6..edac97c0f756 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -55,7 +55,7 @@ fsl,sgtl5000		SGTL5000: Ultra Low-Power Audio Codec
 gmt,g751		G751: Digital Temperature Sensor and Thermal Watchdog with T=
wo-Wire Interface
 infineon,slb9635tt	Infineon SLB9635 (Soft-) I2C TPM (old protocol, max=
 100khz)
 infineon,slb9645tt	Infineon SLB9645 I2C TPM (new protocol, max 400khz)
-isl,isl12057		Intersil ISL12057 I2C RTC Chip
+isil,isl12057		Intersil ISL12057 I2C RTC Chip
 maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
 maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
 maxim,max6625		9-Bit/12-Bit Temperature Sensors with I=C2=B2C-Compatib=
le Serial Interface
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index 723999d73744..84193ecdc41c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -77,7 +77,7 @@ innolux	Innolux Corporation
 intel	Intel Corporation
 intercontrol	Inter Control Group
 isee	ISEE 2007 S.L.
-isl	Intersil
+isil	Intersil
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
 lacie	LaCie
diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
index fe562820a54a..31eaa6a9c2b2 100644
--- a/drivers/rtc/rtc-isl12057.c
+++ b/drivers/rtc/rtc-isl12057.c
@@ -310,7 +310,8 @@ static int isl12057_probe(struct i2c_client *client=
,
=20
 #ifdef CONFIG_OF
 static const struct of_device_id isl12057_dt_match[] =3D {
-	{ .compatible =3D "isl,isl12057" },
+	{ .compatible =3D "isl,isl12057" },  /* obsolete */
+	{ .compatible =3D "isil,isl12057" },
 	{ },
 };
 #endif
--=20
2.1.1


