From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: Re: [PATCH v2] regulator: axp20x: support AXP803/AXP813 variants
Date: Tue, 16 Aug 2016 19:30:17 +0800
Message-ID: <248521471347017@web1g.yandex.ru>
References: <E1bZY0w-0004lM-0a@bombadil.infradead.org>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBTHSZO6QKGQEZMEKWNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <E1bZY0w-0004lM-0a-PfSpb0PWhxZc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



16.08.2016, 14:44, "Jean-Francois Moine" <moinejf-GANU6spQydw@public.gmane.org>:
> The X-Powers AXP803 and AXP813 PMICs are close to the AXP809 with some
> more outputs.
AXP803 and AXP813 is quite different.
AXP803 have 6 DCDCs and 16 LDOs&Switch.
AXP813 have 7 DCDCs and 15 LDOs&Switch.
and AXP813 have an audio codec.

AXP803 cannot be handled without extra code.

(I'm trying to get RSB working in my semi-mainline A64 kernel)
>
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> ---
> The AXP813 has been tested in a Banana PI M3 board (needed for WiFi/BT).
> v2:
> - fix lack of support of dcdc frequency
> - notice that the AXP803 is also handled
> - send the patch to the DT maintainers
> ---
> =C2=A0Documentation/devicetree/bindings/mfd/axp20x.txt | 32 ++++++++-
> =C2=A0drivers/mfd/axp20x-rsb.c | 1 +
> =C2=A0drivers/mfd/axp20x.c | 3 +
> =C2=A0drivers/regulator/axp20x-regulator.c | 83 +++++++++++++++++++++++-
> =C2=A0include/linux/mfd/axp20x.h | 38 +++++++++++
> =C2=A05 files changed, 154 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documenta=
tion/devicetree/bindings/mfd/axp20x.txt
> index 585a955..856a9ff 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -7,10 +7,12 @@ axp209 (X-Powers)
> =C2=A0axp221 (X-Powers)
> =C2=A0axp223 (X-Powers)
> =C2=A0axp809 (X-Powers)
> +axp813 (X-Powers)
>
> =C2=A0Required properties:
> =C2=A0- compatible: "x-powers,axp152", "x-powers,axp202", "x-powers,axp20=
9",
> - "x-powers,axp221", "x-powers,axp223", "x-powers,axp809"
> + "x-powers,axp221", "x-powers,axp223", "x-powers,axp809",
> + "x-powers,axp813"
> =C2=A0- reg: The I2C slave address or RSB hardware address for the AXP ch=
ip
> =C2=A0- interrupt-parent: The parent interrupt controller
> =C2=A0- interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ =
pin
> @@ -110,6 +112,34 @@ LDO_IO1 : LDO : ips-supply : GPIO 1
> =C2=A0RTC_LDO : LDO : ips-supply : always on
> =C2=A0SW : On/Off Switch : swin-supply
>
> +AXP803/AXP813 regulators, type, and corresponding input supply names:
> +
> +Regulator Type Supply Name Notes
> +--------- ---- ----------- -----
> +DCDC1 : DC-DC buck : vin1-supply
> +DCDC2 : DC-DC buck : vin2-supply
> +DCDC3 : DC-DC buck : vin3-supply
> +DCDC4 : DC-DC buck : vin4-supply
> +DCDC5 : DC-DC buck : vin5-supply
> +DCDC6 : DC-DC buck : vin6-supply
> +DCDC7 : DC-DC buck : vin7-supply : AXP813 only
> +RTC_LDO : LDO : ips-supply : always on
> +ALDO1 : LDO : aldoin-supply : shared supply
> +ALDO2 : LDO : aldoin-supply : shared supply
> +ALDO3 : LDO : aldoin-supply : shared supply
> +DLDO1 : LDO : dldoin-supply : shared supply
> +DLDO2 : LDO : dldoin-supply : shared supply
> +DLDO3 : LDO : dldoin-supply : shared supply
> +DLDO4 : LDO : dldoin-supply : shared supply
> +ELDO1 : LDO : eldoin-supply : shared supply
> +ELDO2 : LDO : eldoin-supply : shared supply
> +ELDO3 : LDO : eldoin-supply : shared supply
> +FLDO1 : LDO : fldoin-supply : shared supply
> +FLDO2 : LDO : fldoin-supply : shared supply
> +LDO_IO0 : LDO : ips-supply : GPIO 0
> +LDO_IO1 : LDO : ips-supply : GPIO 1
> +DC1SW : On/Off Switch : : DCDC1 secondary output
> +
> =C2=A0Example:
>
> =C2=A0axp209: pmic@34 {
> diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
> index a407527..e34643b 100644
> --- a/drivers/mfd/axp20x-rsb.c
> +++ b/drivers/mfd/axp20x-rsb.c
> @@ -62,6 +62,7 @@ static int axp20x_rsb_remove(struct sunxi_rsb_device *r=
dev)
> =C2=A0static const struct of_device_id axp20x_rsb_of_match[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "=
x-powers,axp223", .data =3D (void *)AXP223_ID },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "=
x-powers,axp809", .data =3D (void *)AXP809_ID },
> + { .compatible =3D "x-powers,axp813", .data =3D (void *)AXP813_ID },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ },
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, axp20x_rsb_of_match);
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index fd80b09..e62d56f 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -39,6 +39,7 @@ static const char * const axp20x_model_names[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"AXP223",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"AXP288",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"AXP809",
> + "AXP813",
> =C2=A0};
>
> =C2=A0static const struct regmap_range axp152_writeable_ranges[] =3D {
> @@ -494,6 +495,7 @@ static const struct regmap_irq_chip axp288_regmap_irq=
_chip =3D {
>
> =C2=A0};
>
> +/* common 803/809/813 */
> =C2=A0static const struct regmap_irq_chip axp809_regmap_irq_chip =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.name =3D "axp809",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.status_base =3D AX=
P20X_IRQ1_STATE,
> @@ -733,6 +735,7 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0axp20x->regmap_irq_chip =3D &axp288_regmap_ir=
q_chip;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case AXP809_ID:
> + case AXP813_ID:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0axp20x->nr_cells =3D ARRAY_SIZE(axp809_cells)=
;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0axp20x->cells =3D axp809_cells;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0axp20x->regmap_cfg =3D &axp22x_regmap_config;
> diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp=
20x-regulator.c
> index 6d9ac76..3fbe2c1 100644
> --- a/drivers/regulator/axp20x-regulator.c
> +++ b/drivers/regulator/axp20x-regulator.c
> @@ -299,6 +299,78 @@ static const struct regulator_desc axp809_regulators=
[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AXP_DESC_SW(AXP809,=
 SW, "sw", "swin", AXP22X_PWR_OUT_CTRL2, BIT(6)),
> =C2=A0};
>
> +static const struct regulator_linear_range axp813_dcdc2_4_ranges[] =3D {
> + REGULATOR_LINEAR_RANGE(500000, 0, 70, 10000),
> + REGULATOR_LINEAR_RANGE(1220000, 71, 75, 20000),
> +};
> +
> +static const struct regulator_linear_range axp813_dcdc5_ranges[] =3D {
> + REGULATOR_LINEAR_RANGE(800000, 0, 32, 10000),
> + REGULATOR_LINEAR_RANGE(1140000, 33, 68, 20000),
> +};
> +
> +static const struct regulator_linear_range axp813_dcdc6_7_ranges[] =3D {
> + REGULATOR_LINEAR_RANGE(600000, 0, 50, 10000),
> + REGULATOR_LINEAR_RANGE(1120000, 51, 71, 20000),
> +};
> +
> +static const struct regulator_desc axp813_regulators[] =3D {
> + AXP_DESC(AXP813, DLDO1, "dldo1", "dldoin", 700, 3300, 100,
> + AXP22X_DLDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(3)),
> + AXP_DESC(AXP813, DLDO2, "dldo2", "dldoin", 700, 4200, 100,
> + AXP22X_DLDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(4)),
> + AXP_DESC(AXP813, DLDO3, "dldo3", "dldoin", 700, 3300, 100,
> + AXP22X_DLDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(5)),
> + AXP_DESC(AXP813, DLDO4, "dldo4", "dldoin", 700, 3300, 100,
> + AXP22X_DLDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(6)),
> + AXP_DESC(AXP813, ELDO1, "eldo1", "eldoin", 700, 1900, 50,
> + AXP22X_ELDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(0)),
> + AXP_DESC(AXP813, ELDO2, "eldo2", "eldoin", 700, 1900, 50,
> + AXP22X_ELDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(1)),
> + AXP_DESC(AXP813, ELDO3, "eldo3", "eldoin", 700, 1900, 50,
> + AXP22X_ELDO3_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(2)),
> + AXP_DESC(AXP813, FLDO1, "fldo1", "fldoin", 700, 1450, 50,
> + AXP813_FLDO1_V_OUT, 0x0f, AXP22X_PWR_OUT_CTRL3, BIT(2)),
> + AXP_DESC(AXP813, FLDO2, "fldo2", "fldoin", 700, 1450, 50,
> + AXP813_FLDO2_V_OUT, 0x0f, AXP22X_PWR_OUT_CTRL3, BIT(3)),
> + AXP_DESC(AXP813, DCDC1, "dcdc1", "vin1", 1600, 3400, 100,
> + AXP813_DCDC1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL1, BIT(0)),
> + AXP_DESC_RANGES(AXP813, DCDC2, "dcdc2", "vin2", axp813_dcdc2_4_ranges,
> + 76, AXP813_DCDC2_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> + BIT(1)),
> + AXP_DESC_RANGES(AXP813, DCDC3, "dcdc3", "vin3", axp813_dcdc2_4_ranges,
> + 76, AXP813_DCDC3_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> + BIT(2)),
> + AXP_DESC_RANGES(AXP813, DCDC4, "dcdc4", "vin4", axp813_dcdc2_4_ranges,
> + 76, AXP813_DCDC4_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> + BIT(3)),
> + AXP_DESC_RANGES(AXP813, DCDC5, "dcdc5", "vin5", axp813_dcdc5_ranges,
> + 69, AXP813_DCDC5_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> + BIT(4)),
> + AXP_DESC_RANGES(AXP813, DCDC6, "dcdc6", "vin6", axp813_dcdc6_7_ranges,
> + 72, AXP813_DCDC6_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> + BIT(5)),
> + AXP_DESC_RANGES(AXP813, DCDC7, "dcdc7", "vin7", axp813_dcdc6_7_ranges,
> + 72, AXP813_DCDC7_V_OUT, 0x7f, AXP22X_PWR_OUT_CTRL1,
> + BIT(6)),
> + AXP_DESC_FIXED(AXP813, RTC_LDO, "rtc_ldo", "ips", 3000),
> + AXP_DESC(AXP813, ALDO1, "aldo1", "aldoin", 700, 3300, 100,
> + AXP22X_ALDO1_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL3, BIT(5)),
> + AXP_DESC(AXP813, ALDO2, "aldo2", "aldoin", 700, 3300, 100,
> + AXP22X_ALDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL3, BIT(6)),
> + AXP_DESC(AXP813, ALDO3, "aldo3", "aldoin", 700, 3300, 100,
> + AXP22X_ALDO3_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL3, BIT(7)),
> + AXP_DESC_IO(AXP813, LDO_IO0, "ldo_io0", "ips", 700, 3300, 100,
> + AXP22X_LDO_IO0_V_OUT, 0x1f, AXP20X_GPIO0_CTRL, 0x07,
> + AXP22X_IO_ENABLED, AXP22X_IO_DISABLED),
> + AXP_DESC_IO(AXP813, LDO_IO1, "ldo_io1", "ips", 700, 3300, 100,
> + AXP22X_LDO_IO1_V_OUT, 0x1f, AXP20X_GPIO1_CTRL, 0x07,
> + AXP22X_IO_ENABLED, AXP22X_IO_DISABLED),
> + /* secondary switchable output of DCDC1 */
> + AXP_DESC_SW(AXP813, DC1SW, "dc1sw", NULL, AXP22X_PWR_OUT_CTRL2,
> + BIT(7)),
> +};
> +
> =C2=A0static int axp20x_set_dcdc_freq(struct platform_device *pdev, u32 d=
cdcfreq)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct axp20x_dev *=
axp20x =3D dev_get_drvdata(pdev->dev.parent);
> @@ -315,6 +387,7 @@ static int axp20x_set_dcdc_freq(struct platform_devic=
e *pdev, u32 dcdcfreq)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case AXP221_ID:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case AXP223_ID:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case AXP809_ID:
> + case AXP813_ID:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0min =3D 1800;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0max =3D 4050;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0def =3D 3000;
> @@ -444,6 +517,10 @@ static int axp20x_regulator_probe(struct platform_de=
vice *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regulators =3D axp809_regulators;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nregulators =3D AXP809_REG_ID_MAX;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0break;
> + case AXP813_ID:
> + regulators =3D axp813_regulators;
> + nregulators =3D AXP813_REG_ID_MAX;
> + break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_err(&pdev->dev, "Unsupported AXP variant:=
 %ld\n",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0axp20x->variant);
> @@ -467,7 +544,8 @@ static int axp20x_regulator_probe(struct platform_dev=
ice *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* name.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((regulators =3D=3D axp22x_regulators && i=
 =3D=3D AXP22X_DC1SW) ||
> - (regulators =3D=3D axp809_regulators && i =3D=3D AXP809_DC1SW)) {
> + (regulators =3D=3D axp809_regulators && i =3D=3D AXP809_DC1SW) ||
> + (regulators =3D=3D axp813_regulators && i =3D=3D AXP813_DC1SW)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0new_desc =3D devm_kzalloc(&pdev->dev, sizeof(*desc),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0GFP=
_KERNEL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0*new_desc =3D regulators[i];
> @@ -505,7 +583,8 @@ static int axp20x_regulator_probe(struct platform_dev=
ice *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Save AXP22X DCDC1 / DCDC5 regulator n=
ames for later.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((regulators =3D=3D axp22x_regulators && i=
 =3D=3D AXP22X_DCDC1) ||
> - (regulators =3D=3D axp809_regulators && i =3D=3D AXP809_DCDC1))
> + (regulators =3D=3D axp809_regulators && i =3D=3D AXP809_DCDC1) ||
> + (regulators =3D=3D axp813_regulators && i =3D=3D AXP813_DCDC1))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0of_property_read_string(rdev->dev.of_node,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"re=
gulator-name",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&dc=
dc1_name);
> diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
> index 0be4982..637fb7c 100644
> --- a/include/linux/mfd/axp20x.h
> +++ b/include/linux/mfd/axp20x.h
> @@ -21,6 +21,7 @@ enum {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AXP223_ID,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AXP288_ID,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AXP809_ID,
> + AXP813_ID,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NR_AXP20X_VARIANTS,
> =C2=A0};
>
> @@ -91,6 +92,16 @@ enum {
> =C2=A0#define AXP22X_ALDO3_V_OUT 0x2a
> =C2=A0#define AXP22X_CHRG_CTRL3 0x35
>
> +#define AXP813_FLDO1_V_OUT 0x1c
> +#define AXP813_FLDO2_V_OUT 0x1d
> +#define AXP813_DCDC1_V_OUT 0x20
> +#define AXP813_DCDC2_V_OUT 0x21
> +#define AXP813_DCDC3_V_OUT 0x22
> +#define AXP813_DCDC4_V_OUT 0x23
> +#define AXP813_DCDC5_V_OUT 0x24
> +#define AXP813_DCDC6_V_OUT 0x25
> +#define AXP813_DCDC7_V_OUT 0x26
> +
> =C2=A0/* Interrupt */
> =C2=A0#define AXP152_IRQ1_EN 0x40
> =C2=A0#define AXP152_IRQ2_EN 0x41
> @@ -288,6 +299,33 @@ enum {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AXP809_REG_ID_MAX,
> =C2=A0};
>
> +enum {
> + AXP813_DCDC1 =3D 0,
> + AXP813_DCDC2,
> + AXP813_DCDC3,
> + AXP813_DCDC4,
> + AXP813_DCDC5,
> + AXP813_DCDC6,
> + AXP813_DCDC7,
> + AXP813_RTC_LDO,
> + AXP813_ALDO1,
> + AXP813_ALDO2,
> + AXP813_ALDO3,
> + AXP813_DLDO1,
> + AXP813_DLDO2,
> + AXP813_DLDO3,
> + AXP813_DLDO4,
> + AXP813_ELDO1,
> + AXP813_ELDO2,
> + AXP813_ELDO3,
> + AXP813_FLDO1,
> + AXP813_FLDO2,
> + AXP813_LDO_IO0,
> + AXP813_LDO_IO1,
> + AXP813_DC1SW,
> + AXP813_REG_ID_MAX,
> +};
> +
> =C2=A0/* IRQs */
> =C2=A0enum {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AXP152_IRQ_LDO0IN_C=
ONNECT =3D 1,
> --
> 2.9.3
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
