From: Arnaud Ebalard <arno@natisbad.org>
Subject: [PATCHv0 5/5] dt-bindings: fix isl vs isil prefix issue for Intersil
Date: Sun, 14 Dec 2014 02:43:15 +0100
Message-ID: <b2c34bea6fc7bd42d636c9cadfe1b7e5ec523aeb.1418519430.git.arno@natisbad.org>
References: <cover.1418519430.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cover.1418519430.git.arno@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Darshana Padmadas <darshanapadmadas@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


When Intersil ISL12057 driver was introduced by commit 70e123373c05
("rtc: Add support for Intersil ISL12057 I2C RTC chip"), the vendor
prefix 'isl' was used instead of the expected 'isil' (Intersil
NASDAQ symbol) and documented in vendor-prefixes.txt.

Recently, a patch from Philip Zabel (7a6540ca856a, "ARM: mvebu:
Change vendor prefix for Intersil Corporation to isil") fixed that
prefix in ReadyNAS devices .dts files (AFAICT, the only users of
the driver).

Then, commits 7c75c1d5e72b ("dt-bindings: Document deprecated device
vendor name to fix related warning") and b2ea3f82e798 (dt-bindings:
Document correct and deprecated vendor-prefix with device isl29028)
decided to go the other way and deprecate isil in vendor-prefixes.txt
and in isl29028.c staging driver.

While trying and merge a fix I wrote for ISL12057 drivers to finish
Philip's work, it conflicted with the two recently introduced commits,
and revealed the issue: at the moment, there are various compatible
strings in drivers and .dts files for Intersil products which use
either isl or isil:

$ grep -R "isil," .
=2E/Documentation/devicetree/bindings/i2c/trivial-devices.txt:isil,isl2=
9028           (deprecated, use isl)
=2E/drivers/staging/iio/light/isl29028.c:   { .compatible =3D "isil,isl=
29028", },/* deprecated, don't use */
=2E/drivers/staging/iio/light/isl29018.c:   { .compatible =3D "isil,isl=
29018", },
=2E/drivers/staging/iio/light/isl29018.c:   { .compatible =3D "isil,isl=
29023", },
=2E/drivers/staging/iio/light/isl29018.c:   { .compatible =3D "isil,isl=
29035", },
=2E/arch/powerpc/boot/dts/p1022rdk.dts:        compatible =3D "isil,zl6=
100";
=2E/arch/powerpc/boot/dts/p1022rdk.dts:        compatible =3D "isil,zl6=
100";
=2E/arch/powerpc/boot/dts/p1022rdk.dts:        compatible =3D "isil,zl6=
100";
=2E/arch/powerpc/boot/dts/p1022rdk.dts:        compatible =3D "isil,zl6=
100";
=2E/arch/arm/boot/dts/exynos5800-peach-pi.dts: compatible =3D "isil,isl=
29018";
=2E/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi: compatible =3D "isil,isl=
1208";
=2E/arch/arm/boot/dts/tegra20-ventana.dts:     compatible =3D "isil,isl=
29018";
=2E/arch/arm/boot/dts/tegra20-seaboard.dts:    compatible =3D "isil,isl=
29018";
=2E/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts: compatible =3D "isi=
l,isl12057";
=2E/arch/arm/boot/dts/armada-370-netgear-rn104.dts: compatible =3D "isi=
l,isl12057";
=2E/arch/arm/boot/dts/exynos5420-peach-pit.dts:     compatible =3D "isi=
l,isl29018";
=2E/arch/arm/boot/dts/armada-370-netgear-rn102.dts: compatible =3D "isi=
l,isl12057";

$ grep -R "isl," .
=2E/Documentation/devicetree/bindings/regulator/isl9305.txt:- compatibl=
e: "isl,isl9305" or "isl,isl9305h"
=2E/Documentation/devicetree/bindings/regulator/isl9305.txt:           =
   compatible =3D "isl,isl9305";
=2E/Documentation/devicetree/bindings/i2c/trivial-devices.txt:isl,isl12=
057      Intersil ISL12057 I2C RTC Chip
=2E/Documentation/devicetree/bindings/i2c/trivial-devices.txt:isl,isl29=
028      Intersil ISL29028 Ambient Light ....
=2E/drivers/regulator/isl9305.c:          { .compatible =3D "isl,isl930=
5" },
=2E/drivers/regulator/isl9305.c:          { .compatible =3D "isl,isl930=
5h" },
=2E/drivers/staging/iio/light/isl29028.c: { .compatible =3D "isl,isl290=
28", },
=2E/drivers/rtc/rtc-isl12057.c:           { .compatible =3D "isl,isl120=
57" },
=2E/drivers/rtc/rtc-isl12022.c:           { .compatible =3D "isl,isl120=
22" },
=2E/arch/arm/boot/dts/tegra30-cardhu.dtsi:   compatible =3D "isl,isl290=
28";
=2E/arch/arm/boot/dts/zynq-parallella.dts:   compatible =3D "isl,isl930=
5";

AFAICT, it seems it makes sense to *definitively* settle for isil as th=
e
vendor prefix for Intersil, as Philip did in 7a6540ca856a: it's the NAS=
DAQ
symbol and this choice requires less changes than opting for isl.

So, this patch changes compatible strings in .dts files to use isil whe=
re
isl was found before, and modify drivers w/ compatible strings using is=
l
to add one using isil. In those cases, a comment is made that the old
compatible string is kept for backward compatibility (w/ out-fo-tree us=
ers
of those drivers). Additionally, it leaves only isil as prefix in
vendor-prefixes.txt. Those changes should prevent any new inclusion of
isl compatible strings for Intersil devices due to copy-and-paste.

Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
---
 Documentation/devicetree/bindings/i2c/trivial-devices.txt | 5 ++---
 Documentation/devicetree/bindings/regulator/isl9305.txt   | 4 ++--
 Documentation/devicetree/bindings/vendor-prefixes.txt     | 3 +--
 arch/arm/boot/dts/tegra30-cardhu.dtsi                     | 2 +-
 arch/arm/boot/dts/zynq-parallella.dts                     | 2 +-
 drivers/regulator/isl9305.c                               | 6 ++++--
 drivers/rtc/rtc-isl12022.c                                | 3 ++-
 drivers/rtc/rtc-isl12057.c                                | 3 ++-
 drivers/staging/iio/light/isl29028.c                      | 4 ++--
 9 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt =
b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index 605dcca5dbec..213855bb419b 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -55,9 +55,8 @@ fsl,sgtl5000		SGTL5000: Ultra Low-Power Audio Codec
 gmt,g751		G751: Digital Temperature Sensor and Thermal Watchdog with T=
wo-Wire Interface
 infineon,slb9635tt	Infineon SLB9635 (Soft-) I2C TPM (old protocol, max=
 100khz)
 infineon,slb9645tt	Infineon SLB9645 I2C TPM (new protocol, max 400khz)
-isl,isl12057		Intersil ISL12057 I2C RTC Chip
-isil,isl29028           (deprecated, use isl)
-isl,isl29028            Intersil ISL29028 Ambient Light and Proximity =
Sensor
+isil,isl12057		Intersil ISL12057 I2C RTC/Alarm Chip
+isil,isl29028           Intersil ISL29028 Ambient Light and Proximity =
Sensor
 maxim,ds1050		5 Bit Programmable, Pulse-Width Modulator
 maxim,max1237		Low-Power, 4-/12-Channel, 2-Wire Serial, 12-Bit ADCs
 maxim,max6625		9-Bit/12-Bit Temperature Sensors with I=C2=B2C-Compatib=
le Serial Interface
diff --git a/Documentation/devicetree/bindings/regulator/isl9305.txt b/=
Documentation/devicetree/bindings/regulator/isl9305.txt
index a626fc1bbf0d..d6e7c9ec9413 100644
--- a/Documentation/devicetree/bindings/regulator/isl9305.txt
+++ b/Documentation/devicetree/bindings/regulator/isl9305.txt
@@ -2,7 +2,7 @@ Intersil ISL9305/ISL9305H voltage regulator
=20
 Required properties:
=20
-- compatible: "isl,isl9305" or "isl,isl9305h"
+- compatible: "isil,isl9305" or "isil,isl9305h"
 - reg: I2C slave address, usually 0x68.
 - regulators: A node that houses a sub-node for each regulator within =
the
   device. Each sub-node is identified using the node's name, with vali=
d
@@ -19,7 +19,7 @@ Optional properties:
 Example
=20
 	pmic: isl9305@68 {
-		compatible =3D "isl,isl9305";
+		compatible =3D "isil,isl9305";
 		reg =3D <0x68>;
=20
 		VINDCD1-supply =3D <&system_power>;
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Do=
cumentation/devicetree/bindings/vendor-prefixes.txt
index cc6151c431c8..ba574e431c5a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -79,8 +79,7 @@ innolux	Innolux Corporation
 intel	Intel Corporation
 intercontrol	Inter Control Group
 isee	ISEE 2007 S.L.
-isil    Intersil (deprecated, use isl)
-isl	Intersil
+isil	Intersil
 karo	Ka-Ro electronics GmbH
 keymile	Keymile GmbH
 lacie	LaCie
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/=
tegra30-cardhu.dtsi
index cbf5a1ae0ca7..a1b682ea01bd 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -189,7 +189,7 @@
=20
 		/* ALS and Proximity sensor */
 		isl29028@44 {
-			compatible =3D "isl,isl29028";
+			compatible =3D "isil,isl29028";
 			reg =3D <0x44>;
 			interrupt-parent =3D <&gpio>;
 			interrupts =3D <TEGRA_GPIO(L, 0) IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/=
zynq-parallella.dts
index ab1dc0a56cdd..174571232ea5 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -58,7 +58,7 @@
 	status =3D "okay";
=20
 	isl9305: isl9305@68 {
-		compatible =3D "isl,isl9305";
+		compatible =3D "isil,isl9305";
 		reg =3D <0x68>;
=20
 		regulators {
diff --git a/drivers/regulator/isl9305.c b/drivers/regulator/isl9305.c
index 92fefd98da58..6e3a15fe00f1 100644
--- a/drivers/regulator/isl9305.c
+++ b/drivers/regulator/isl9305.c
@@ -177,8 +177,10 @@ static int isl9305_i2c_probe(struct i2c_client *i2=
c,
=20
 #ifdef CONFIG_OF
 static const struct of_device_id isl9305_dt_ids[] =3D {
-	{ .compatible =3D "isl,isl9305" },
-	{ .compatible =3D "isl,isl9305h" },
+	{ .compatible =3D "isl,isl9305" }, /* for backward compat., don't use=
 */
+	{ .compatible =3D "isil,isl9305" },
+	{ .compatible =3D "isl,isl9305h" }, /* for backward compat., don't us=
e */
+	{ .compatible =3D "isil,isl9305h" },
 	{},
 };
 #endif
diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index ee3ba7e6b45e..f9b082784b90 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -275,7 +275,8 @@ static int isl12022_probe(struct i2c_client *client=
,
=20
 #ifdef CONFIG_OF
 static const struct of_device_id isl12022_dt_match[] =3D {
-	{ .compatible =3D "isl,isl12022" },
+	{ .compatible =3D "isl,isl12022" }, /* for backward compat., don't us=
e */
+	{ .compatible =3D "isil,isl12022" },
 	{ },
 };
 #endif
diff --git a/drivers/rtc/rtc-isl12057.c b/drivers/rtc/rtc-isl12057.c
index 98adc2c1bdb0..949121ed0255 100644
--- a/drivers/rtc/rtc-isl12057.c
+++ b/drivers/rtc/rtc-isl12057.c
@@ -644,7 +644,8 @@ static SIMPLE_DEV_PM_OPS(isl12057_rtc_pm_ops, isl12=
057_rtc_suspend,
=20
 #ifdef CONFIG_OF
 static const struct of_device_id isl12057_dt_match[] =3D {
-	{ .compatible =3D "isl,isl12057" },
+	{ .compatible =3D "isl,isl12057" }, /* for backward compat., don't us=
e */
+	{ .compatible =3D "isil,isl12057" },
 	{ },
 };
 #endif
diff --git a/drivers/staging/iio/light/isl29028.c b/drivers/staging/iio=
/light/isl29028.c
index e969107ddb47..6440e3b293ca 100644
--- a/drivers/staging/iio/light/isl29028.c
+++ b/drivers/staging/iio/light/isl29028.c
@@ -537,8 +537,8 @@ static const struct i2c_device_id isl29028_id[] =3D=
 {
 MODULE_DEVICE_TABLE(i2c, isl29028_id);
=20
 static const struct of_device_id isl29028_of_match[] =3D {
-	{ .compatible =3D "isl,isl29028", },
-	{ .compatible =3D "isil,isl29028", },/* deprecated, don't use */
+	{ .compatible =3D "isl,isl29028", }, /* for backward compat., don't u=
se */
+	{ .compatible =3D "isil,isl29028", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, isl29028_of_match);
--=20
2.1.1

