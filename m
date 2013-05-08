From: Christian Ruppert <christian.ruppert@abilis.com>
Subject: Re: [PATCH 1/2] pinmux: Add TB10x pinmux driver
Date: Wed, 8 May 2013 18:41:25 +0200
Message-ID: <20130508164123.GA10248@ab42.lan>
References: <1365608728-30494-1-git-send-email-christian.ruppert@abilis.com>
 <516EEAA0.10906@wwwdotorg.org>
 <20130418090310.GA17636@ab42.lan>
 <CACRpkdZd0_W432od5565phhUcJMRWiV9vXX4QVF4osKkxstC0Q@mail.gmail.com>
 <20130429161725.GB30136@ab42.lan>
 <5182B557.4040804@wwwdotorg.org>
 <CACRpkdaxO0q_P2wJFy3zv4F-QM9dZk54qW8ft350XqcBt1Gr1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaxO0q_P2wJFy3zv4F-QM9dZk54qW8ft350XqcBt1Gr1w@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Patrice CHOTARD <patrice.chotard@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Sascha Leuenberger <sascha.leuenberger@abilis.com>, Pierrick Hascoet <pierrick.hascoet@abilis.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 03, 2013 at 08:03:27PM +0200, Linus Walleij wrote:
> On Thu, May 2, 2013 at 8:49 PM, Stephen Warren <swarren@wwwdotorg.org=
> wrote:
> > On 04/29/2013 10:17 AM, Christian Ruppert wrote:
> >>>
> >>> So if this is what you want to achieve, just use the same number
> >>> as in your datasheet in the pin number -> problem solved.
> >>
> >> The problem is that we must support several products which are bas=
ically
> >> different packaging options of the same chip (or simplified versio=
ns
> >> thereof). Not all of those products will have the same number of p=
ins
> >> and as a consequence, data sheet pin numbering will also be differ=
ent.
> >> The port names are going to remain the same for all products, howe=
ver.
> >> Some of the ports are just not going to be physically available in=
 some
> >> or the products. Sorry if that wasn't clear from my previous mail.
> >
> > It sounds like you can use the exact same numbering scheme for all =
the
> > different packaging options; it's just that some of the pin numbers
> > simply won't exist on some of the packaging options, so while defin=
ed by
> > the DT binding, it simply won't make sense to use them?
> >
> > Certainly, Tegra20 has two packaging options, and the pinctrl drive=
r for
> > it has zero knowledge of this. Perhaps we're just lucky though. I g=
uess
> > the Tegra TRM doesn't define any "Pin number" (just "pin name") for=
 the
> > pins, so there's no possibility of the same "number" meaning differ=
ent
> > things in the two packages, so perhaps we're just getting lucky her=
e.
>=20
> I am certain it must be possible to come up with something reasonable
> here, especially since this is using the device tree.
>=20
> In U300 we had something like 4 different packaging types, all with
> different names on the pins, however I could avoid the entire
> issue by using pad numbers instead, i.e. the numbers of the pads/fing=
ers
> on the silicon die inside the chip.
> (Documentation/pinctrl.txt contains hints on this.)
>=20
> It seems like your situation is similar.
>=20
> And since you work for Abilis I assume you can access such low-level
> documentation and come up with a numbering scheme based on
> something that does not vary with packaging.

Yes but unluckily the decision which numbers to expose to customers is
not an engineering decision, thus the difficulty with everything but
physical pin numbers.

> And if you can't, and since you're using device tree, come up with
> a per-packainging pin numbering, put it into a special .dtsi file tha=
t
> you layer over the core SoC .dtsi file just to get these numbers,
> and then use the apropriate packaging .dtsi in yout eventual
> machine .dts file.

What do you think about the following modification to the pinctrl/GPIO
frameworks instead (not yet a formal patch, more a request for comment
to illustrate what I mean. If you agree, I will clean it up and submit =
a
proper patch after discussion).

It adds a dt_gpiorange_xlate function to the pinctrl callbacks which
defaults to the conventional behaviour using kernel logical pin numbers=
=2E
However, pin controllers which provide more complex mechanisms can
define #gpio-range-cells and provide this callback in order to keep
Linux pin numbering inside the kernel.

One could either use the phandles to pin controller sub nodes as done i=
n
the original gpio-tb10x patch or e.g. define numbered pin groups inside
the pin controller. This is the mechanism used in many other device tre=
e
bindings (interrupt controllers, GPIOs etc) to separate kernel internal
numbering schemes from the device tree.

It would also allow removing the module cross-calling between the tb10x
GPIO and pinctrl drivers by migrating most of the code from
tb10x_prepare_gpio_range to that callback and removing
tb10x_setup_gpio_range alltogether.

Greetings,
  Christian

---
 drivers/gpio/gpiolib-of.c       |   61 +++++++++++++++++++++++++++++++=
++------
 drivers/pinctrl/devicetree.c    |   31 ++++++++++++++++++++
 include/linux/of_gpio.h         |    1 +
 include/linux/pinctrl/pinctrl.h |   18 +++++++++++
 4 files changed, 102 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 5150df6..10df33b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -183,10 +183,57 @@ err0:
 EXPORT_SYMBOL(of_mm_gpiochip_add);
=20
 #ifdef CONFIG_PINCTRL
+static inline int of_gpiochip_parse_xlate(struct device_node *np, int =
index,
+					u32 *pin_offset, u32 *npins,
+					struct pinctrl_dev **pctldevret)
+{
+	int ret;
+	struct of_phandle_args pinspec;
+	struct pinctrl_dev *pctldev;
+
+	ret =3D of_parse_phandle_with_args(np, "gpio-ranges",
+			"#gpio-range-cells", index, &pinspec);
+	if (ret)
+		return ret;
+
+	pctldev =3D of_pinctrl_get(pinspec.np);
+	if (!pctldev)
+		return -EINVAL;
+
+	if (pctldevret)
+		*pctldevret =3D pctldev;
+
+	ret =3D of_pinctrl_gpiorange_xlate(pctldev, pinspec.np,
+					pinspec.args,
+					pinspec.args_count,
+					pin_offset, npins);
+	return ret;
+}
+
+int of_gpiochip_get_npins(struct device_node *np)
+{
+	int pincnt =3D 0;
+	int index;
+
+	if (!np)
+		return -EINVAL;
+
+	for (index =3D 0;; index++) {
+		u32 pin_offset, npins;
+
+		if (of_gpiochip_parse_xlate(np, index,
+						&pin_offset, &npins, NULL))
+			break;
+
+		pincnt +=3D npins;
+	}
+
+	return pincnt;
+}
+
 static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
 {
 	struct device_node *np =3D chip->of_node;
-	struct of_phandle_args pinspec;
 	struct pinctrl_dev *pctldev;
 	int index =3D 0, ret;
=20
@@ -194,13 +241,10 @@ static void of_gpiochip_add_pin_range(struct gpio=
_chip *chip)
 		return;
=20
 	for (;; index++) {
-		ret =3D of_parse_phandle_with_args(np, "gpio-ranges",
-				"#gpio-range-cells", index, &pinspec);
-		if (ret)
-			break;
+		u32 pin_offset, npins;
=20
-		pctldev =3D of_pinctrl_get(pinspec.np);
-		if (!pctldev)
+		if (of_gpiochip_parse_xlate(np, index,
+						&pin_offset, &npins, &pctldev))
 			break;
=20
 		/*
@@ -217,8 +261,7 @@ static void of_gpiochip_add_pin_range(struct gpio_c=
hip *chip)
 		ret =3D gpiochip_add_pin_range(chip,
 					     pinctrl_dev_get_devname(pctldev),
 					     0, /* offset in gpiochip */
-					     pinspec.args[0],
-					     pinspec.args[1]);
+					     pin_offset, npins);
=20
 		if (ret)
 			break;
diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.=
c
index fd40a11..4a11c49 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -117,6 +117,37 @@ struct pinctrl_dev *of_pinctrl_get(struct device_n=
ode *np)
 	return pctldev;
 }
=20
+static int default_dt_gpiorange_xlate(struct pinctrl_dev *pctldev,
+				   struct device_node *np,
+				   u32 *rangespec, int rangespecsize,
+				   u32 *pin_offset, u32 *npins)
+{
+	if (rangespecsize !=3D 2)
+		return -EINVAL;
+
+	*pin_offset =3D rangespec[0];
+	*npins =3D rangespec[1];
+	return 0;
+}
+
+int of_pinctrl_gpiorange_xlate(struct pinctrl_dev *pctldev,
+				struct device_node *np,
+				u32 *rangespec, int rangespecsize,
+				u32 *pin_offset, u32 *npins)
+{
+	struct pinctrl_ops *ops =3D pctldev->desc->pctlops;
+	int ret;
+
+	if (ops->dt_gpiorange_xlate)
+		ret =3D ops->dt_gpiorange_xlate(pctldev, np, rangespec,
+					rangespecsize, pin_offset, npins);
+	else
+		ret =3D default_dt_gpiorange_xlate(pctldev, np, rangespec,
+					rangespecsize, pin_offset, npins);
+
+	return ret;
+}
+
 static int dt_to_map_one_config(struct pinctrl *p, const char *statena=
me,
 				struct device_node *np_config)
 {
diff --git a/include/linux/of_gpio.h b/include/linux/of_gpio.h
index a83dc6f..486999a 100644
--- a/include/linux/of_gpio.h
+++ b/include/linux/of_gpio.h
@@ -53,6 +53,7 @@ extern int of_get_named_gpio_flags(struct device_node=
 *np,
 extern int of_mm_gpiochip_add(struct device_node *np,
 			      struct of_mm_gpio_chip *mm_gc);
=20
+extern int of_gpiochip_get_npins(struct device_node *np);
 extern void of_gpiochip_add(struct gpio_chip *gc);
 extern void of_gpiochip_remove(struct gpio_chip *gc);
 extern int of_gpio_simple_xlate(struct gpio_chip *gc,
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pi=
nctrl.h
index 778804d..78beeb8 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -81,6 +81,8 @@ struct pinctrl_gpio_range {
  *	allocated members of the mapping table entries themselves. This
  *	function is optional, and may be omitted for pinctrl drivers that d=
o
  *	not support device tree.
+ * @dt_gpiorange_xlate: translate device tree gpio-ranges specificatio=
n to
+ *	pin_offset and npins arguments for gpiochip_add_pin_range.
  */
 struct pinctrl_ops {
 	int (*get_groups_count) (struct pinctrl_dev *pctldev);
@@ -97,6 +99,10 @@ struct pinctrl_ops {
 			       struct pinctrl_map **map, unsigned *num_maps);
 	void (*dt_free_map) (struct pinctrl_dev *pctldev,
 			     struct pinctrl_map *map, unsigned num_maps);
+	int (*dt_gpiorange_xlate) (struct pinctrl_dev *pctldev,
+				   struct device_node *np,
+				   u32 *rangespec, int rangespecsize,
+				   u32 *pin_offset, u32 *npins);
 };
=20
 /**
@@ -145,12 +151,24 @@ pinctrl_find_gpio_range_from_pin(struct pinctrl_d=
ev *pctldev,
=20
 #ifdef CONFIG_OF
 extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
+extern int of_pinctrl_gpiorange_xlate(struct pinctrl_dev *pctldev,
+				      struct device_node *np,
+				      u32 *rangespec, int rangespecsize,
+				      u32 *pin_offset, u32 *npins);
 #else
 static inline
 struct pinctrl_dev *of_pinctrl_get(struct device_node *np)
 {
 	return NULL;
 }
+static inline
+int of_pinctrl_gpiorange_xlate(struct pinctrl_dev *pctldev,
+				struct device_node *np,
+				u32 *rangespec, int rangespecsize,
+				u32 *pin_offset, u32 *npins)
+{
+	return 0;
+}
 #endif /* CONFIG_OF */
=20
 extern const char *pinctrl_dev_get_name(struct pinctrl_dev *pctldev);
--=20


--=20
  Christian Ruppert              ,          <christian.ruppert@abilis.c=
om>
                                /|
  Tel: +41/(0)22 816 19-42     //|                 3, Chemin du Pr=E9-F=
leuri
                             _// | bilis Systems   CH-1228 Plan-les-Oua=
tes
