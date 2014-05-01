From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: syscon or memory mappings (was: Re: [RFC/PATCH 0/8] pinctrl-rockchip: Change wrong initial assumptions)
Date: Thu, 01 May 2014 15:21:34 +0200
Message-ID: <5737609.o5tyv6lkQG@diego>
References: <1414506.B4e2jZujVm@diego> <699502106.fEF2JGVO0i@typ>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1994178.doqRl9C0WK"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <699502106.fEF2JGVO0i@typ>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Max Schwarz <max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart1994178.doqRl9C0WK
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Max,

Am Donnerstag, 1. Mai 2014, 12:43:13 schrieb Max Schwarz:
> On Wednesday 30 April 2014 at 00:07:12, Heiko St=FCbner wrote:
> > While this wasn't a problem until now, the upcoming rk3288 introduc=
es
> > additional changes to both the grf and pmu areas. On it even part o=
f
> > the pinmux registers move into the pmu space.
>=20
> Could you give us more information on that? I tried to find details o=
n the
> RK3288 but came up with nothing. How are the pinmux registers divided=
?

Some days ago, Rockchip released kernel sources for the rk3288 [0]. The=
y took=20
a lot of our current mainline code as base for their kernel. AS you can=
 see in=20
the register map below, the pinmux registers for the gpio0 bank are res=
iding=20
in the pmu space, while gpio1-8 are residing in the regular "general re=
gister=20
files"


> Would adding a third reg element for the pinmux register to the gpio
> subnodes suffice to fix your problem?

Rockchip designers do not seem to fear reordering both the GRF and PMU=20=

register spaces. So my biggest fear is what they'll come up with the ne=
xt SoC=20
;-). Thus I'd like to reduce soc-specific parts instead of adding more.=



To elaborate a bit:

On rk3188 it is
GRF: 0x00 - 0x5c: pin suspend control
GRF: 0x60 - 0x9c: pinmux control (0x60 and 0x64 gpio-only)
GRF: 0xa0 - 0xac: soc-control/status
GRF: 0xb0 - 0xc8: dma-control
GRF: 0xcc - 0xe0: "cpu core configuration"
GRF: 0xec - 0xf0: ddr-controller config
GRF: 0xf4 - 0x104: pin drive-strength (what we currently do not support=
)
GRF: 0x108: soc_status1
GRF: 0x10c - 0x140: USB phy control
GRF: 0x144 - 0x160: "OS register"
GRF: 0x160 - 0x19c: pin pull settings
PMU: 0x00 - 0x38: power-domains and a lot of unknown stuff
PMU: 0x3c: something called GPIO0_CON, what Rockchip does not use at al=
l
PMU: 0x40 - 0x60: "SYS_REGx"
PMU: 0x64 - 0x68: part of GPIO0 pull config

so we would/will in the end need 4 mappings for the rk3188-pinctrl
GRF: 0x00 - 0x9c, GRF: 0xf4 - 0x104, GRF: 0x160 - 0x19c, PMU: 0x64 - 0x=
68


On rk3288 it is

GRF: 0x00 - 0x84: gpio1-gpio8 iomux settings
GRF: 0x104 - 0x138: unknown GPIOxx_SR registers
GRF: 0x140 - 0x1b4: gpio1-gpio8 pull settings
GRF: 0x1c0 - 0x234: gpio1-gpio8 driver strength settings
GRF: 0x240: unknown/unused GPIO_SMT
GRF: 0x244 - 0x2d4: soc control/status registers
GRF: 0x2e0 - ...: a lot of stuff like dma, usb-phy etc.
PMU: 0x00 - 0x5c: powerdomains and a lot of other stuff
PMU: 0x60: GPIO_SR
PMU: 0x64 - 0x6c: gpio0 pull settings
PMU: 0x70 - 0x78: gpio0 drive-strength settings
PMU: 0x7c: GPIO_OP
PMU: 0x80: GPIO0_SEL18
PMU: 0x84 - 0x8c: gpio0 pinmux settings
PMU: 0x90 - 0xa0: more misc registers (powermode, sys_regX)

so we would essentially need only two mappings here
GRF: 0x00 - 0x240 and PMU: 0x60 - 0x8c


So we'd need additional if(is_rk3188()) conditionals to distinguish bet=
ween=20
these implementations [and possible future ones] to select the correct =
base=20
address, and we don't know what the next SoC will bring and how the stu=
ff will=20
be ordered there.


Also leaving the driver behind, devicetree is meant to describe the har=
dware,=20
not the implementation. And hw-wise both PMU and GRF are actual hardwar=
e=20
blocks even with individual clock gates.

Citing the syscon-devicetree bindings:

=09System controller node represents a register region containing a set=

=09of miscellaneous registers. The registers are not cohesive enough to=

=09represent as any specific type of device.

So to me both GRF and PMU regions scream "syscon".


> > For this my current gut-feeling is, that providing both the grf and=
 pmu
> > as syscons to the pinctrl driver might be more future proof for the=
 next
> > socs. But as I'm not sure on this, I'd like of course comments :-)
>=20
> I don't see the problem with the current solution. In my mind it's cl=
eaner
> to specify register mappings explicitly in the dt rather than map one=
 large
> block and let the drivers figure out themselves where their registers=
 are.

I've attached my current WIP patch to implement rk3288 support (unteste=
d, as I=20
don't have any hardware), based on this series. As you can see in it, t=
he=20
rk3288 has even more peculiarities with gpio-only and 4bit wide iomuxes=
.

As the patch stands now, rk3288 doesn't even need special handling for =
its=20
iomux registers, as it can be simply described now in the pin-bank decl=
aration=20
at the bottom - and even the rk3188-bank0 wouldn't be necessary anymore=
.


> There are some question marks for me on the syscon solution. Regmap u=
ses
> locking internally, which means separate drivers can't access separat=
e
> registers simultaneously. We have an SMP machine here, so that's not =
far-
> fetched. And that locking is completely unnecessary, as we *know* in =
most
> cases that the accessed areas do not overlap.

For locking vs. speed, I do not see this as a big problem. All register=
s in=20
there mainly contain general settings that are not changed often during=
 the=20
operation of the device. So there is no high frequency access to them i=
n any=20
case.


> > The other option would be to leave the grf as it is and create sepa=
rate
> > syscons for real small individual parts like the soc-conf and usb-p=
hys.
> > But apart from creating these real small syscons that would
> > also make it necessary to introduce another register map for the
> > drive-strength settings of the pin-controller, which are sitting in=
 the
> > middle of everything at least on rk3066 and rk3188.
>=20
> Wy do we need a syscon for usb-phys? Is it shared by multiple drivers=
?
> My instinctive approach would be two usb-phys devices mapping the GRF=
_UOC0/1
> spaces directly via reg properties. Or did I miss something?

Of course if we're going to map each part of the GRF individually there=
 is no=20
need for a syscon.


> The only register space I see that is used from many drivers is the
> GRF_SOC_* space. So in my mind that should be the only syscon device.=

>=20
> > @Max: sorry to come up with this now, but I feel this should be res=
olved
> > (in whatever direction) before we introduce any grf syscon. Because=
 due
> > to dt being an API we will be tied for a long time to it.
>=20
> Yes, I agree. If we want to change something, we should change it now=
. All
> in all I would vote for the current solution. But it seems you have m=
ore
> information than me, so my vote is somewhat uneducated ;-)

I'm also hoping for more input so I've changed the title a bit, to mayb=
e=20
attract more people :-) .


Heiko


[0] https://github.com/rkchrome/kernel
--nextPart1994178.doqRl9C0WK
Content-Disposition: attachment; filename="0001-pinctrl-rockchip-WIP-introduce-flexible-iomux-handli.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-pinctrl-rockchip-WIP-introduce-flexible-iomux-handli.patch"

>From 413669fdf083e5570fc544c08d998876d77b5b55 Mon Sep 17 00:00:00 2001
From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Date: Thu, 1 May 2014 00:47:01 +0200
Subject: [PATCH] pinctrl: rockchip: WIP introduce flexible iomux handling and
 rk3288 support

todo: split into two patches, one introducing the flexible iomux handling
and another one adding the actual rk3288 support.
---
 drivers/pinctrl/pinctrl-rockchip.c | 230 ++++++++++++++++++++++++++++++++-----
 1 file changed, 202 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 948a19f..15f2d30 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -70,6 +70,29 @@ enum rockchip_pin_bank_type {
 };
 
 /**
+ * Encode variants of iomux registers into a type variable
+ * bit[0] - iomux is gpio-only
+ * bit[3:1] - bit width of pin iomux settings
+ * bit[6:4] - location of this iomux register
+ */
+#define IOMUX_GPIO_ONLY		(1 << 0)
+#define IOMUX_WIDTH_2BIT	0
+#define IOMUX_WIDTH_4BIT	(1 << 1)
+#define IOMUX_SOURCE_GRF	0
+#define IOMUX_SOURCE_PMU	(1 << 4)
+
+/**
+ * @type: iomux variant using IOMUX_* constants
+ * @offset: if initialized to -1 it will be autocalculated, by specifying
+ *	    an initial offset value the relevant source offset can be reset
+ *	    to a new value for autocalculating the following iomux registers.
+ */
+struct rockchip_iomux {
+	int				type;
+	int				offset;
+};
+
+/**
  * @reg_base: register base of the gpio bank
  * @reg_pull: optional separate register for additional pull settings
  * @clk: clock of the gpio bank
@@ -78,6 +101,7 @@ enum rockchip_pin_bank_type {
  * @nr_pins: number of pins in this bank
  * @name: name of the bank
  * @bank_num: number of the bank, to account for holes
+ * @iomux: array describing the 4 iomux sources of the bank
  * @valid: are all necessary informations present
  * @of_node: dt node of this bank
  * @drvdata: common pinctrl basedata
@@ -96,6 +120,7 @@ struct rockchip_pin_bank {
 	char				*name;
 	u8				bank_num;
 	enum rockchip_pin_bank_type	bank_type;
+	struct rockchip_iomux		iomux[4];
 	bool				valid;
 	struct device_node		*of_node;
 	struct rockchip_pinctrl		*drvdata;
@@ -111,6 +136,25 @@ struct rockchip_pin_bank {
 		.bank_num	= id,			\
 		.nr_pins	= pins,			\
 		.name		= label,		\
+		.iomux		= {			\
+			{ .offset = -1 },		\
+			{ .offset = -1 },		\
+			{ .offset = -1 },		\
+			{ .offset = -1 },		\
+		},					\
+	}
+
+#define PIN_BANK_IOMUX_FLAGS(id, pins, label, iom0, iom1, iom2, iom3)	\
+	{								\
+		.bank_num	= id,					\
+		.nr_pins	= pins,					\
+		.name		= label,				\
+		.iomux		= {					\
+			{ .type = iom0, .offset = -1 },			\
+			{ .type = iom1, .offset = -1 },			\
+			{ .type = iom2, .offset = -1 },			\
+			{ .type = iom3, .offset = -1 },			\
+		},							\
 	}
 
 /**
@@ -121,7 +165,8 @@ struct rockchip_pin_ctrl {
 	u32				nr_pins;
 	char				*label;
 	enum rockchip_pinctrl_type	type;
-	int				mux_offset;
+	int				grf_mux_offset;
+	int				pmu_mux_offset;
 	void	(*pull_calc_reg)(struct rockchip_pin_bank *bank,
 				    int pin_num, struct regmap **regmap,
 				    int *reg, u8 *bit);
@@ -343,24 +388,34 @@ static const struct pinctrl_ops rockchip_pctrl_ops = {
 static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
+	int iomux_num = (pin / 8);
+	struct regmap *regmap;
 	unsigned int val;
-	int reg, ret;
+	int reg, ret, mask;
 	u8 bit;
 
-	if (bank->bank_type == RK3188_BANK0 && pin < 16)
+	if (bank->iomux[iomux_num].type & IOMUX_GPIO_ONLY)
 		return RK_FUNC_GPIO;
 
+	regmap = (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
+				? info->regmap_pmu : info->regmap_base;
+
 	/* get basic quadrupel of mux registers and the correct reg inside */
-	reg = info->ctrl->mux_offset;
-	reg += bank->bank_num * 0x10;
-	reg += (pin / 8) * 4;
-	bit = (pin % 8) * 2;
+	mask = (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) ? 0xf : 0x3;
+	reg = bank->iomux[iomux_num].offset;
+	if (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) {
+		if ((pin % 8) >= 4)
+			reg += 0x4;
+		bit = (pin % 4) * 4;
+	} else {
+		bit = (pin % 8) * 2;
+	}
 
-	ret = regmap_read(info->regmap_base, reg, &val);
+	ret = regmap_read(regmap, reg, &val);
 	if (ret)
 		return ret;
 
-	return ((val >> bit) & 3);
+	return ((val >> bit) & mask);
 }
 
 /*
@@ -379,16 +434,14 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
-	int reg, ret;
+	int iomux_num = (pin / 8);
+	struct regmap *regmap;
+	int reg, ret, mask;
 	unsigned long flags;
 	u8 bit;
 	u32 data;
 
-	/*
-	 * The first 16 pins of rk3188_bank0 are always gpios and do not have
-	 * a mux register at all.
-	 */
-	if (bank->bank_type == RK3188_BANK0 && pin < 16) {
+	if (bank->iomux[iomux_num].type & IOMUX_GPIO_ONLY) {
 		if (mux != RK_FUNC_GPIO) {
 			dev_err(info->dev,
 				"pin %d only supports a gpio mux\n", pin);
@@ -401,17 +454,25 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	dev_dbg(info->dev, "setting mux of GPIO%d-%d to %d\n",
 						bank->bank_num, pin, mux);
 
+	regmap = (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
+				? info->regmap_pmu : info->regmap_base;
+
 	/* get basic quadrupel of mux registers and the correct reg inside */
-	reg = info->ctrl->mux_offset;
-	reg += bank->bank_num * 0x10;
-	reg += (pin / 8) * 4;
-	bit = (pin % 8) * 2;
+	mask = (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) ? 0xf : 0x3;
+	reg = bank->iomux[iomux_num].offset;
+	if (bank->iomux[iomux_num].type & IOMUX_WIDTH_4BIT) {
+		if ((pin % 8) >= 4)
+			reg += 0x4;
+		bit = (pin % 4) * 4;
+	} else {
+		bit = (pin % 8) * 2;
+	}
 
 	spin_lock_irqsave(&bank->slock, flags);
 
-	data = (3 << (bit + 16));
-	data |= (mux & 3) << bit;
-	ret = regmap_write(info->regmap_base, reg, data);
+	data = (mask << (bit + 16));
+	data |= (mux & mask) << bit;
+	ret = regmap_write(regmap, reg, data);
 
 	spin_unlock_irqrestore(&bank->slock, flags);
 
@@ -475,6 +536,38 @@ static void rk3188_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 	}
 }
 
+//FIXME: what is the real first pull registers
+//FIXME: GPIO0A_PULL would be at 0x130 of the GRF, if it weren't in the pmu
+//GPIO0A_PULL - GPIO0C_PULL are in the pmu instead
+#define RK3288_PULL_OFFSET		0x140
+static void rk3288_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+				    int pin_num, struct regmap **regmap,
+				    int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	/* The first 24 pins of the first bank are located elsewhere */
+	if (bank->bank_num == 0 && pin_num < 24) {
+		*regmap = info->regmap_pmu;
+		*reg = RK3188_PULL_PMU_OFFSET;
+
+		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
+		*bit = pin_num % RK3188_PULL_PINS_PER_REG;
+		*bit *= RK3188_PULL_BITS_PER_PIN;
+	} else {
+		*regmap = info->regmap_base;
+		*reg = RK3288_PULL_OFFSET;
+
+		/* correct the offset, as it is the 4th pull register */
+		*reg -= 0x10;
+		*reg += bank->bank_num * RK3188_PULL_BANK_STRIDE;
+		*reg += ((pin_num / RK3188_PULL_PINS_PER_REG) * 4);
+
+		*bit = (pin_num % RK3188_PULL_PINS_PER_REG);
+		*bit *= RK3188_PULL_BITS_PER_PIN;
+	}
+}
+
 static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
@@ -1510,7 +1603,7 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 	struct device_node *np;
 	struct rockchip_pin_ctrl *ctrl;
 	struct rockchip_pin_bank *bank;
-	int i;
+	int grf_offs, pmu_offs, i, j;
 
 	match = of_match_node(rockchip_pinctrl_dt_match, node);
 	ctrl = (struct rockchip_pin_ctrl *)match->data;
@@ -1532,12 +1625,45 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 		}
 	}
 
+	grf_offs = ctrl->grf_mux_offset;
+	pmu_offs = ctrl->pmu_mux_offset;
 	bank = ctrl->pin_banks;
 	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
 		spin_lock_init(&bank->slock);
 		bank->drvdata = d;
 		bank->pin_base = ctrl->nr_pins;
 		ctrl->nr_pins += bank->nr_pins;
+
+		/* calculate iomux offsets */
+		for (j = 0; j < 4; j++) {
+			struct rockchip_iomux *iom = &bank->iomux[j];
+			int inc;
+
+			/* preset offset value, set new start value */
+			if (iom->offset >= 0) {
+				if (iom->type & IOMUX_SOURCE_PMU)
+					pmu_offs = iom->offset;
+				else
+					grf_offs = iom->offset;
+			} else { /* set current offset */
+				iom->offset = (iom->type & IOMUX_SOURCE_PMU) ?
+							pmu_offs : grf_offs;
+			}
+
+			dev_info(d->dev, "bank %d, iomux %d has offset 0x%x\n",
+				 i, j, iom->offset);
+
+			/*
+			 * Increase offset according to iomux width.
+			 * 4bit iomux'es are spread over two registers.
+			 */
+			inc = (iom->type & IOMUX_WIDTH_4BIT) ? 8 : 4;
+			if (iom->type & IOMUX_SOURCE_PMU)
+				pmu_offs += inc;
+			else
+				grf_offs += inc;
+		}
+
 	}
 
 	return ctrl;
@@ -1641,7 +1767,7 @@ static struct rockchip_pin_ctrl rk2928_pin_ctrl = {
 		.nr_banks		= ARRAY_SIZE(rk2928_pin_banks),
 		.label			= "RK2928-GPIO",
 		.type			= RK2928,
-		.mux_offset		= 0xa8,
+		.grf_mux_offset		= 0xa8,
 		.pull_calc_reg		= rk2928_calc_pull_reg_and_bit,
 };
 
@@ -1659,7 +1785,7 @@ static struct rockchip_pin_ctrl rk3066a_pin_ctrl = {
 		.nr_banks		= ARRAY_SIZE(rk3066a_pin_banks),
 		.label			= "RK3066a-GPIO",
 		.type			= RK2928,
-		.mux_offset		= 0xa8,
+		.grf_mux_offset		= 0xa8,
 		.pull_calc_reg		= rk2928_calc_pull_reg_and_bit,
 };
 
@@ -1675,11 +1801,11 @@ static struct rockchip_pin_ctrl rk3066b_pin_ctrl = {
 		.nr_banks	= ARRAY_SIZE(rk3066b_pin_banks),
 		.label		= "RK3066b-GPIO",
 		.type		= RK3066B,
-		.mux_offset	= 0x60,
+		.grf_mux_offset	= 0x60,
 };
 
 static struct rockchip_pin_bank rk3188_pin_banks[] = {
-	PIN_BANK(0, 32, "gpio0"),
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_GPIO_ONLY, 0, 0, 0),
 	PIN_BANK(1, 32, "gpio1"),
 	PIN_BANK(2, 32, "gpio2"),
 	PIN_BANK(3, 32, "gpio3"),
@@ -1690,10 +1816,56 @@ static struct rockchip_pin_ctrl rk3188_pin_ctrl = {
 		.nr_banks		= ARRAY_SIZE(rk3188_pin_banks),
 		.label			= "RK3188-GPIO",
 		.type			= RK3188,
-		.mux_offset		= 0x60,
+		.grf_mux_offset		= 0x60,
 		.pull_calc_reg		= rk3188_calc_pull_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rk3288_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
+					     IOMUX_SOURCE_PMU,
+					     IOMUX_SOURCE_PMU,
+					     IOMUX_SOURCE_PMU | IOMUX_GPIO_ONLY
+			    ),
+	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", IOMUX_GPIO_ONLY,
+					     IOMUX_GPIO_ONLY,
+					     IOMUX_GPIO_ONLY,
+					     0
+			    ),
+	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0, 0, 0, IOMUX_GPIO_ONLY),
+	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3", 0, 0, 0, IOMUX_WIDTH_4BIT),
+	PIN_BANK_IOMUX_FLAGS(4, 32, "gpio4", IOMUX_WIDTH_4BIT,
+					     IOMUX_WIDTH_4BIT,
+					     0,
+					     0
+			    ),
+	PIN_BANK_IOMUX_FLAGS(5, 32, "gpio5", IOMUX_GPIO_ONLY,
+					     0,
+					     0,
+					     IOMUX_GPIO_ONLY
+			    ),
+	PIN_BANK_IOMUX_FLAGS(6, 32, "gpio6", 0, 0, 0, IOMUX_GPIO_ONLY),
+	PIN_BANK_IOMUX_FLAGS(7, 32, "gpio7", 0,
+					     0,
+					     IOMUX_WIDTH_4BIT,
+					     IOMUX_GPIO_ONLY
+			    ),
+	PIN_BANK_IOMUX_FLAGS(8, 32, "gpio8", 0,
+					     0,
+					     IOMUX_GPIO_ONLY,
+					     IOMUX_GPIO_ONLY
+			    ),
+};
+
+static struct rockchip_pin_ctrl rk3288_pin_ctrl = {
+		.pin_banks		= rk3288_pin_banks,
+		.nr_banks		= ARRAY_SIZE(rk3288_pin_banks),
+		.label			= "RK3288-GPIO",
+		.type			= RK3188,
+		.grf_mux_offset		= 0x0,
+		.pmu_mux_offset		= 0x84,
+		.pull_calc_reg		= rk3288_calc_pull_reg_and_bit,
+};
+
 static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 	{ .compatible = "rockchip,rk2928-pinctrl",
 		.data = (void *)&rk2928_pin_ctrl },
@@ -1703,6 +1875,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = (void *)&rk3066b_pin_ctrl },
 	{ .compatible = "rockchip,rk3188-pinctrl",
 		.data = (void *)&rk3188_pin_ctrl },
+	{ .compatible = "rockchip,rk3288-pinctrl",
+		.data = (void *)&rk3288_pin_ctrl },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rockchip_pinctrl_dt_match);
-- 
1.9.0


--nextPart1994178.doqRl9C0WK--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
