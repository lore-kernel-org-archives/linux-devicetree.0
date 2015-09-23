Return-Path: <hns@goldelico.com>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: [PATCH] gpio:pca953x: add mechanism to simulate open drain outputs
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <cover.1443031678.git.hns@goldelico.com>
Date: Wed, 23 Sep 2015 20:13:56 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B9C7F91-0025-4C1D-95AD-FD5A4B0B4176@goldelico.com>
References: <cover.1443031678.git.hns@goldelico.com>
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, eric miao <eric.miao@marvell.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Marek Belisko <marek@goldelico.com>, Grazvydas Ignotas <notaz@openpandora.org>
List-ID: <devicetree@vger.kernel.org>

1. add a DT property to specify the list of GPIO pins that are to become
   "open drain"
2. if a pin is configured as "open drain", set value by either =
outputting a
   "0" (low level) or switching to input (high impedance)

Tested on OMAP5 uEVM with TCA6424 and some LEDs connected to 5V.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
.../devicetree/bindings/gpio/gpio-pca953x.txt      |  6 +++++
drivers/gpio/gpio-pca953x.c                        | 30 =
++++++++++++++++++++++
2 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt =
b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index b9a42f2..699b895 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -26,6 +26,11 @@ Required properties:
	ti,tca6424
	exar,xra1202

+Optional property:
+ - open-drain-pins: list of pin numbers (starting at 0)
+	which will be simulating open-drain outputs
+	(by swithing between input and output(0)).
+
Example:


@@ -36,4 +41,5 @@ Example:
		pinctrl-0 =3D <&pinctrl_pca9505>;
		interrupt-parent =3D <&gpio3>;
		interrupts =3D <23 IRQ_TYPE_LEVEL_LOW>;
+		open-drain-pins =3D <1 3 4>;
	};
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 50caeb1..34fb9d3 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -81,6 +81,7 @@ struct pca953x_chip {
	unsigned gpio_start;
	u8 reg_output[MAX_BANK];
	u8 reg_direction[MAX_BANK];
+	u8 reg_open_drain[MAX_BANK];
	struct mutex i2c_lock;

#ifdef CONFIG_GPIO_PCA953X_IRQ
@@ -237,6 +238,11 @@ static int pca953x_gpio_direction_output(struct =
gpio_chip *gc,
	u8 reg_val;
	int ret, offset =3D 0;

+	if (val && (chip->reg_open_drain[off / BANK_SZ] &
+						(1u << (off % =
BANK_SZ))))
+		/* make high impedance */
+		return pca953x_gpio_direction_input(gc, off);
+
	mutex_lock(&chip->i2c_lock);
	/* set output level */
	if (val)
@@ -315,6 +321,12 @@ static void pca953x_gpio_set_value(struct gpio_chip =
*gc, unsigned off, int val)
	u8 reg_val;
	int ret, offset =3D 0;

+	if ((chip->reg_open_drain[off / BANK_SZ] & (1u << (off % =
BANK_SZ)))) {
+		/* switch between input (1=3DHigh-Z) and output (0=3DLow) =
*/
+		pca953x_gpio_direction_output(gc, off, val);
+		return;
+	}
+
	mutex_lock(&chip->i2c_lock);
	if (val)
		reg_val =3D chip->reg_output[off / BANK_SZ]
@@ -660,6 +672,8 @@ static int pca953x_probe(struct i2c_client *client,
	if (chip =3D=3D NULL)
		return -ENOMEM;

+	memset(chip->reg_open_drain, 0, NBANK(chip));
+
	pdata =3D dev_get_platdata(&client->dev);
	if (pdata) {
		irq_base =3D pdata->irq_base;
@@ -667,8 +681,24 @@ static int pca953x_probe(struct i2c_client *client,
		invert =3D pdata->invert;
		chip->names =3D pdata->names;
	} else {
+		int size, i;
+
+		size =3D =
of_property_count_elems_of_size(client->dev.of_node,
+						"open-drain-pins", =
sizeof(u32));
		chip->gpio_start =3D -1;
		irq_base =3D 0;
+
+		/* negative sizes (errno) are simply ignored */
+
+		for (i =3D 0; i < size; i++) {
+			u32 off;
+			int r =3D =
of_property_read_u32_index(client->dev.of_node,
+						"open-drain-pins", i, =
&off);
+			if (r =3D=3D 0 && off < (MAX_BANK * BANK_SZ)) {
+				chip->reg_open_drain[off / BANK_SZ] |=3D
+						(1u << (off % BANK_SZ));
+			}
+		}
	}

	chip->client =3D client;
--=20
2.5.1
