From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: pinctrl-imx: add imx pinctrl core driver
Date: Sun, 15 Apr 2012 11:49:04 +0800
Message-ID: <CAA+hA=T0FAfuGKcW0vAKO+OWyFdM-6vQqVo53xKf8y28m7gPOQ@mail.gmail.com>
References: <1334333915-1174-1-git-send-email-b29396@freescale.com>
	<20120414134814.GA3852@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120414134814.GA3852@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Dong Aisheng <b29396@freescale.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, shawn.guo@freescale.com, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

Hi Sascha,

Thanks for the review.

On Sat, Apr 14, 2012 at 9:48 PM, Sascha Hauer <s.hauer@pengutronix.de> =
wrote:
> On Sat, Apr 14, 2012 at 12:18:33AM +0800, Dong Aisheng wrote:
>> From: Dong Aisheng <dong.aisheng@linaro.org>
>>
>> The driver has mux and config support while the gpio is still
>> not supported.
>> For select input setting, the driver will handle it internally
>> and do not need user to take care of it.
>>
>> The pinctrl-imx core driver will parse the dts file and dynamically
>> create the pinmux functions and groups.
>>
>> Each IMX SoC pinctrl driver should register pins with a pin register=
 map
>> including mux register and config register and select input map to c=
ore
>> for proper operations.
>>
>> +
>> +iomuxc@020e0000 {
>> + =A0 =A0 compatible =3D "fsl,imx6q-iomuxc";
>> + =A0 =A0 reg =3D <0x020e0000 0x4000>;
>> +
>> + =A0 =A0 /* shared pinctrl settings */
>> + =A0 =A0 usdhc4 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pinctrl_usdhc4_1: usdhc4grp-1 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsl,pins =3D =A0 =A0 =A0"M=
X6Q_PAD_SD4_CMD",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "MX6Q_PAD_SD4_CLK",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "MX6Q_PAD_SD4_DAT0",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "MX6Q_PAD_SD4_DAT1",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "MX6Q_PAD_SD4_DAT2",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "MX6Q_PAD_SD4_DAT3",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "MX6Q_PAD_SD4_DAT4",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "MX6Q_PAD_SD4_DAT5",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "MX6Q_PAD_SD4_DAT6",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 "MX6Q_PAD_SD4_DAT7";
>
> Do we really want to have all combinations of all pins in the devicet=
ree
> as strings? This is going to be huge.
>
Correct.
My plan is:
1) not all combinations, just define frequently used ones since
it's hard to define all combinations groups for per based IMX.
(maybe we can try to add a fix-up function which can do minor changes
based on available ones, then user does not need to write a new group
caused by only a small change.
what do you think?)

2)  When dt supports macro, will try convert string to integer macro.
Then it maybe:
fsl,pins =3D <MX6Q_PAD_SD4_CMD 0
                MX6Q_PAD_SD4_CLK 0
                MX6Q_PAD_SD4_DAT0 1
                .................>,
Why i did not start pin id with a raw integer is because it's less
meaning to user and
not easy to read in dts file.

3) maybe we need a separate imx6q-pinctrl.dtsi when it becomes big
after adding all device support.

>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fsl,mux =3D <0 0 1 1 1 1 1=
 1 1 1>;
>
> Still we lose the precious information which pin can be put into whic=
h
> mode which means that you have to look at the datasheet each time a p=
in
> is missing.
To avoid this, i also put the pad function macro in driver, user can
look at the pinctrl SoC driver instead of look at the datasheet.
See:
[PATCH 2/3] pinctrl: pinctrl-imx: add imx6q pinctrl drive
+/* imx6q register maps */
+static struct imx_pin_reg imx6q_pin_regs[] =3D {
+       IMX_PIN_REG(MX6Q_PAD_SD2_DAT1, 0x0360, 0x004C, 0, 0x0000, 0),
/* MX6Q_PAD_SD2_DAT1__USDHC2_DAT1 */
+       IMX_PIN_REG(MX6Q_PAD_SD2_DAT1, 0x0360, 0x004C, 1, 0x0834, 0),
/* MX6Q_PAD_SD2_DAT1__ECSPI5_SS0 */
=2E......

>
>> +
>> +static int imx_dt_node_to_map(struct pinctrl_dev *pctldev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct device_node *np,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pinctrl_map **map, =
unsigned *num_maps)
>> +{
>> + =A0 =A0 struct imx_pmx *ipmx =3D pinctrl_dev_get_drvdata(pctldev);
>> + =A0 =A0 struct imx_pinctrl_info *info =3D ipmx->info;
>> + =A0 =A0 const struct imx_config_properties *imx_config;
>> + =A0 =A0 struct pinctrl_map *new_map;
>> + =A0 =A0 struct device_node *parent;
>> + =A0 =A0 u32 val, config, map_num;
>> + =A0 =A0 void *new_config;
>> + =A0 =A0 int i, ret;
>> +
>> + =A0 =A0 /* first check if there's a config map */
>> + =A0 =A0 config =3D 0;
>> + =A0 =A0 for (i =3D 0; i < info->nconf_properties; i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 imx_config =3D &info->conf_properties[i];
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D of_property_read_u32(np, imx_confi=
g->property, &val);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(info->dev, "config=
 property %s: 0x%x\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 imx_config=
->property, val);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (val > imx_config->mask=
)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(i=
nfo->dev, "The config(%s) value 0x%x exceeds the range",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 imx_config->property, val);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 config |=3D val << imx_con=
fig->off;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> + =A0 =A0 map_num =3D config ? 2 : 1;
>> + =A0 =A0 new_map =3D kmalloc(sizeof(struct pinctrl_map) * map_num, =
GFP_KERNEL);
>> + =A0 =A0 if (!new_map)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> +
>> + =A0 =A0 /* generate mux map */
>> + =A0 =A0 parent =3D of_get_parent(np);
>> + =A0 =A0 if (!parent)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 new_map[0].type =3D PIN_MAP_TYPE_MUX_GROUP;
>> + =A0 =A0 new_map[0].data.mux.function =3D parent->name;
>> + =A0 =A0 new_map[0].data.mux.group =3D np->name;
>> +
>> + =A0 =A0 if (config) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_config =3D kmemdup(&config, sizeof(con=
fig), GFP_KERNEL);
>
> Check result?
>
Correct. I missed it.

>> + =A0 =A0 =A0 =A0 =A0 =A0 /* generate config map */
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_map[1].type =3D PIN_MAP_TYPE_CONFIGS_G=
ROUP;
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_map[1].data.configs.group_or_pin =3D n=
p->name;
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_map[1].data.configs.configs =3D (unsig=
ned long *)new_config;
>
> No need to cast void pointers.
>
Thanks, got it.

>> + =A0 =A0 =A0 =A0 =A0 =A0 new_map[1].data.configs.num_configs =3D 1;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 *map =3D new_map;
>> + =A0 =A0 *num_maps =3D map_num;
>> +
>> + =A0 =A0 dev_dbg(pctldev->dev, "map: num %d function %s group %s co=
nfig 0x%x\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 map_num, new_map->data.mux.function,
>> + =A0 =A0 =A0 =A0 =A0 =A0 new_map->data.mux.group, config);
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static void imx_dt_free_map(struct pinctrl_dev *pctldev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct pin=
ctrl_map *map, unsigned num_maps)
>> +{
>> + =A0 =A0 int i;
>> +
>> + =A0 =A0 for (i =3D 0; i < num_maps; i++)
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (map[i].type =3D=3D PIN_MAP_TYPE_CONFIG=
S_GROUP)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(map[i].data.configs.=
configs);
>> +
>> + =A0 =A0 kfree(map);
>> +}
>> +
>> +static struct pinctrl_ops imx_pctrl_ops =3D {
>> + =A0 =A0 .get_groups_count =3D imx_get_groups_count,
>> + =A0 =A0 .get_group_name =3D imx_get_group_name,
>> + =A0 =A0 .get_group_pins =3D imx_get_group_pins,
>> + =A0 =A0 .pin_dbg_show =3D imx_pin_dbg_show,
>> + =A0 =A0 .dt_node_to_map =3D imx_dt_node_to_map,
>> + =A0 =A0 .dt_free_map =3D imx_dt_free_map,
>> +
>> +};
>> +
>> +static int imx_pmx_enable(struct pinctrl_dev *pctldev, unsigned sel=
ector,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned group)
>> +{
>> + =A0 =A0 struct imx_pmx *ipmx =3D pinctrl_dev_get_drvdata(pctldev);
>> + =A0 =A0 struct imx_pinctrl_info *info =3D ipmx->info;
>> + =A0 =A0 const struct imx_pin_reg *pin_reg;
>> + =A0 =A0 const unsigned *pins, *mux;
>> + =A0 =A0 unsigned int num_pins, pin_id;
>> + =A0 =A0 int i;
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* Configure the mux mode for each pin in the group for =
a specific
>> + =A0 =A0 =A0* function.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 pins =3D info->groups[group].pins;
>> + =A0 =A0 num_pins =3D info->groups[group].num_pins;
>> + =A0 =A0 mux =3D info->groups[group].mux_mode;
>> +
>> + =A0 =A0 WARN_ON(!pins || !num_pins || !mux);
>> +
>> + =A0 =A0 dev_dbg(ipmx->dev, "enable function %s group %s\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 info->functions[selector].name, info->grou=
ps[group].name);
>> +
>> + =A0 =A0 for (i =3D 0; i < num_pins; i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pin_id =3D pins[i];
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 pin_reg =3D imx_find_pin_reg(info, pin_id,=
 1, mux[i]);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!pin_reg)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!pin_reg->mux_reg) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(ipmx->dev, "Pin(%s=
) does not support mux function\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->pins=
[pin_id].name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 writel(mux[i], ipmx->base + pin_reg->mux_r=
eg);
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(ipmx->dev, "write: offset 0x%x val=
 0x%x\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pin_reg->mux_reg, mux[i]);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* some pins also need select input settin=
g, set it if found */
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (pin_reg->input_reg) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writel(pin_reg->input_val,=
 ipmx->base + pin_reg->input_reg);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(ipmx->dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "=3D=3D>se=
lect_input: offset 0x%x val 0x%x\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pin_reg->i=
nput_reg, pin_reg->input_val);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static void imx_pmx_disable(struct pinctrl_dev *pctldev, unsigned f=
unc_selector,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned group_sel=
ector)
>> +{
>> + =A0 =A0 /* nothing to do here */
>> +}
>> +
>> +static int imx_pmx_get_funcs_count(struct pinctrl_dev *pctldev)
>> +{
>> + =A0 =A0 struct imx_pmx *ipmx =3D pinctrl_dev_get_drvdata(pctldev);
>> + =A0 =A0 struct imx_pinctrl_info *info =3D ipmx->info;
>> +
>> + =A0 =A0 return info->nfunctions;
>> +}
>> +
>> +static const char *imx_pmx_get_func_name(struct pinctrl_dev *pctlde=
v,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 unsigned selector)
>> +{
>> + =A0 =A0 struct imx_pmx *ipmx =3D pinctrl_dev_get_drvdata(pctldev);
>> + =A0 =A0 struct imx_pinctrl_info *info =3D ipmx->info;
>> +
>> + =A0 =A0 return info->functions[selector].name;
>> +}
>> +
>> +static int imx_pmx_get_groups(struct pinctrl_dev *pctldev, unsigned=
 selector,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const char =
* const **groups,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned * =
const num_groups)
>> +{
>> + =A0 =A0 struct imx_pmx *ipmx =3D pinctrl_dev_get_drvdata(pctldev);
>> + =A0 =A0 struct imx_pinctrl_info *info =3D ipmx->info;
>> +
>> + =A0 =A0 *groups =3D info->functions[selector].groups;
>> + =A0 =A0 *num_groups =3D info->functions[selector].num_groups;
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static struct pinmux_ops imx_pmx_ops =3D {
>> + =A0 =A0 .get_functions_count =3D imx_pmx_get_funcs_count,
>> + =A0 =A0 .get_function_name =3D imx_pmx_get_func_name,
>> + =A0 =A0 .get_function_groups =3D imx_pmx_get_groups,
>> + =A0 =A0 .enable =3D imx_pmx_enable,
>> + =A0 =A0 .disable =3D imx_pmx_disable,
>> +};
>> +
>> +static int imx_pinconf_get(struct pinctrl_dev *pctldev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned pin_id=
, unsigned long *config)
>> +{
>> + =A0 =A0 struct imx_pmx *ipmx =3D pinctrl_dev_get_drvdata(pctldev);
>> + =A0 =A0 struct imx_pinctrl_info *info =3D ipmx->info;
>> + =A0 =A0 const struct imx_pin_reg *pin_reg;
>> +
>> + =A0 =A0 pin_reg =3D imx_find_pin_reg(info, pin_id, 0, 0);
>> + =A0 =A0 if (!pin_reg)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 if (!pin_reg->conf_reg) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(info->dev, "Pin(%s) does not suppo=
rt config function\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->pins[pin_id].name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 *config =3D readl(ipmx->base + pin_reg->conf_reg);
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static int imx_pinconf_set(struct pinctrl_dev *pctldev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned pin_id=
, unsigned long config)
>> +{
>> + =A0 =A0 struct imx_pmx *ipmx =3D pinctrl_dev_get_drvdata(pctldev);
>> + =A0 =A0 struct imx_pinctrl_info *info =3D ipmx->info;
>> + =A0 =A0 const struct imx_pin_reg *pin_reg;
>> +
>> + =A0 =A0 pin_reg =3D imx_find_pin_reg(info, pin_id, 0, 0);
>> + =A0 =A0 if (!pin_reg)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 if (!pin_reg->conf_reg) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(info->dev, "Pin(%s) does not suppo=
rt config function\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->pins[pin_id].name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 writel(config, ipmx->base + pin_reg->conf_reg);
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static int imx_pinconf_group_get(struct pinctrl_dev *pctldev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uns=
igned group, unsigned long *config)
>> +{
>> + =A0 =A0 struct imx_pmx *ipmx =3D pinctrl_dev_get_drvdata(pctldev);
>> + =A0 =A0 struct imx_pinctrl_info *info =3D ipmx->info;
>> +
>> + =A0 =A0 *config =3D info->groups[group].config;
>> + =A0 =A0 dev_dbg(ipmx->dev, "get group %s config 0x%lx\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 info->groups[group].name, *config);
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static int imx_pinconf_group_set(struct pinctrl_dev *pctldev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0uns=
igned group, unsigned long config)
>> +{
>> + =A0 =A0 struct imx_pmx *ipmx =3D pinctrl_dev_get_drvdata(pctldev);
>> + =A0 =A0 struct imx_pinctrl_info *info =3D ipmx->info;
>> + =A0 =A0 const struct imx_pin_reg *pin_reg;
>> + =A0 =A0 const unsigned *pins;
>> + =A0 =A0 unsigned int num_pins, pin_id;
>> + =A0 =A0 int i;
>> +
>> + =A0 =A0 pins =3D info->groups[group].pins;
>> + =A0 =A0 num_pins =3D info->groups[group].num_pins;
>> +
>> + =A0 =A0 WARN_ON(!pins || !num_pins);
>> +
>> + =A0 =A0 dev_dbg(ipmx->dev, "set group %s config 0x%lx\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 info->groups[group].name, config);
>> +
>> + =A0 =A0 for (i =3D 0; i < num_pins; i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pin_id =3D pins[i];
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 pin_reg =3D imx_find_pin_reg(info, pin_id,=
 0, 0);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!pin_reg)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!pin_reg->conf_reg) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(ipmx->dev, "Pin(%s=
) does not support config function\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 info->pins=
[pin_id].name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 writel(config, ipmx->base + pin_reg->conf_=
reg);
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_dbg(ipmx->dev, "write: offset 0x%x val=
 0x%lx\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pin_reg->conf_reg, config)=
;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /* save the current group config value */
>> + =A0 =A0 info->groups[group].config =3D config;
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static void imx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0str=
uct seq_file *s, unsigned pin_id)
>> +{
>> + =A0 =A0 struct imx_pmx *ipmx =3D pinctrl_dev_get_drvdata(pctldev);
>> + =A0 =A0 struct imx_pinctrl_info *info =3D ipmx->info;
>> + =A0 =A0 const struct imx_pin_reg *pin_reg;
>> + =A0 =A0 unsigned long config;
>> +
>> + =A0 =A0 pin_reg =3D imx_find_pin_reg(info, pin_id, 0, 0);
>> + =A0 =A0 if (!pin_reg) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 seq_printf(s, "N/A");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 config =3D readl(ipmx->base + pin_reg->conf_reg);
>> + =A0 =A0 seq_printf(s, "0x%lx", config);
>> +}
>> +
>> +static void imx_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0struct seq_file *s, unsigned group)
>> +{
>> + =A0 =A0 unsigned long config;
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 ret =3D imx_pinconf_group_get(pctldev, group, &config);
>> + =A0 =A0 if (!ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 seq_printf(s, "0x%lx", config);
>> +}
>> +
>> +struct pinconf_ops imx_pinconf_ops =3D {
>> + =A0 =A0 .pin_config_get =3D imx_pinconf_get,
>> + =A0 =A0 .pin_config_set =3D imx_pinconf_set,
>> + =A0 =A0 .pin_config_group_get =3D imx_pinconf_group_get,
>> + =A0 =A0 .pin_config_group_set =3D imx_pinconf_group_set,
>> + =A0 =A0 .pin_config_dbg_show =3D imx_pinconf_dbg_show,
>> + =A0 =A0 .pin_config_group_dbg_show =3D imx_pinconf_group_dbg_show,
>> +};
>> +
>> +static struct pinctrl_desc imx_pmx_desc =3D {
>> + =A0 =A0 .name =3D DRIVER_NAME,
>> + =A0 =A0 .pctlops =3D &imx_pctrl_ops,
>> + =A0 =A0 .pmxops =3D &imx_pmx_ops,
>> + =A0 =A0 .confops =3D &imx_pinconf_ops,
>> + =A0 =A0 .owner =3D THIS_MODULE,
>> +};
>> +
>> +#ifdef CONFIG_OF
>> +static unsigned int imx_pmx_pin_name_to_id(struct imx_pinctrl_info =
*info,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 const char *s)
>> +{
>> + =A0 =A0 unsigned int i;
>> + =A0 =A0 const struct pinctrl_pin_desc *desc;
>> +
>> + =A0 =A0 BUG_ON(!info || !info->pins || !info->npins);
>> +
>> + =A0 =A0 for (i =3D 0; i < info->npins; i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 desc =3D info->pins + i;
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (desc->name && !strcmp(s, desc->name))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return desc->number;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return -EINVAL;
>> +}
>> +
>> +static int __devinit imx_pmx_parse_groups(struct device_node *np,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct imx=
_pin_group *grp,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct imx=
_pinctrl_info *info, u32 index)
>> +{
>> + =A0 =A0 struct property *prop;
>> + =A0 =A0 const char *s;
>> + =A0 =A0 int ret, len;
>> + =A0 =A0 u32 i =3D 0;
>> +
>> + =A0 =A0 dev_dbg(info->dev, "group(%d): %s\n", index, np->name);
>> +
>> + =A0 =A0 /* Initialise group */
>> + =A0 =A0 grp->name =3D np->name;
>> + =A0 =A0 grp->num_pins =3D of_property_count_strings(np, "fsl,pins"=
);
>> + =A0 =A0 if (grp->num_pins < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(info->dev, "failed to get fsl,pins=
\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return grp->num_pins;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 grp->pins =3D devm_kzalloc(info->dev, grp->num_pins * size=
of(unsigned int),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP_KERNEL=
);
>> + =A0 =A0 grp->mux_mode =3D devm_kzalloc(info->dev, grp->num_pins * =
sizeof(unsigned int),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP_KERNEL=
);
>> +
>> + =A0 =A0 of_property_for_each_string(np, "fsl,pins", prop, s) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D imx_pmx_pin_name_to_id(info, s);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(info->dev, "failed=
 to get pin: %s\n", s);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 grp->pins[i++] =3D ret;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (i !=3D grp->num_pins) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(info->dev, "parsed wrong pins numb=
er?\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /* group sanity check */
>> + =A0 =A0 if (of_get_property(np, "fsl,mux", &len) &&
>> + =A0 =A0 =A0 =A0 =A0 =A0 len !=3D grp->num_pins * sizeof(unsigned i=
nt)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(info->dev, "fsl,mux length is not =
equal to fsl,pins\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 ret =3D of_property_read_u32_array(np, "fsl,mux",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 grp->mux_mode, grp->num_pi=
ns);
>> + =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(info->dev, "failed to get fsl,mux\=
n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> + =A0 =A0 }
>> +
>> +#ifdef DEBUG
>> + =A0 =A0 IMX_PMX_DUMP("pins", grp->pins, grp->num_pins);
>> + =A0 =A0 IMX_PMX_DUMP("mux", grp->mux_mode, grp->num_pins);
>> +#endif
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static int __devinit imx_pmx_parse_functions(struct device_node *np=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct imx_pinctrl_info *i=
nfo, u32 index)
>> +{
>> + =A0 =A0 struct device_node *child;
>> + =A0 =A0 struct imx_pmx_func *func;
>> + =A0 =A0 struct imx_pin_group *grp;
>> + =A0 =A0 int ret;
>> + =A0 =A0 static u32 grp_index;
>> + =A0 =A0 u32 i =3D 0;
>> +
>> + =A0 =A0 dev_dbg(info->dev, "parse function(%d): %s\n", index, np->=
name);
>> +
>> + =A0 =A0 func =3D &info->functions[index];
>> +
>> + =A0 =A0 /* Initialise function */
>> + =A0 =A0 func->name =3D np->name;
>> + =A0 =A0 func->num_groups =3D of_get_child_count(np);
>> + =A0 =A0 if (func->num_groups <=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(info->dev, "no groups defined\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> + =A0 =A0 func->groups =3D devm_kzalloc(info->dev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 func->num_groups * sizeof(=
char *), GFP_KERNEL);
>> +
>> + =A0 =A0 for_each_child_of_node(np, child) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 func->groups[i] =3D child->name;
>> + =A0 =A0 =A0 =A0 =A0 =A0 grp =3D &info->groups[grp_index++];
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D imx_pmx_parse_groups(child, grp, i=
nfo, i++);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (i !=3D func->num_groups) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(info->dev, "parsed wrong groups nu=
mber?\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static int __devinit imx_pmx_probe_dt(struct platform_device *pdev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct imx=
_pinctrl_info *info)
>> +{
>> + =A0 =A0 struct device_node *np =3D pdev->dev.of_node;
>> + =A0 =A0 struct device_node *child;
>> + =A0 =A0 int ret;
>> + =A0 =A0 u32 nfuncs =3D 0;
>> + =A0 =A0 u32 i =3D 0;
>> +
>> + =A0 =A0 if (!np)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
>> +
>> + =A0 =A0 nfuncs =3D of_get_child_count(np);
>> + =A0 =A0 if (nfuncs <=3D 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "no functions defined\=
n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 info->nfunctions =3D nfuncs;
>> + =A0 =A0 info->functions =3D devm_kzalloc(&pdev->dev, nfuncs * size=
of(struct imx_pmx_func),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 GFP_KERNEL);
>> + =A0 =A0 if (!info->functions)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> +
>> + =A0 =A0 info->ngroups =3D 0;
>> + =A0 =A0 for_each_child_of_node(np, child)
>> + =A0 =A0 =A0 =A0 =A0 =A0 info->ngroups +=3D of_get_child_count(chil=
d);
>> + =A0 =A0 info->groups =3D devm_kzalloc(&pdev->dev, nfuncs * sizeof(=
struct imx_pin_group),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 GFP_KERNEL);
>> + =A0 =A0 if (!info->groups)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> +
>> + =A0 =A0 for_each_child_of_node(np, child) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 ret =3D imx_pmx_parse_functions(child, inf=
o, i++);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "faile=
d to parse function\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (i !=3D info->nfunctions) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(info->dev, "parsed wrong functions=
 number?\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 return 0;
>> +}
>> +#else
>> +static int __devinit imx_pmx_probe_dt(struct platform_device *pdev,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct imx=
_pinctrl_info *info)
>> +{
>> + =A0 =A0 return -ENODEV;
>> +}
>> +#endif
>> +
>> +static inline void imx_pmx_desc_init(struct pinctrl_desc *pmx_desc,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const stru=
ct imx_pinctrl_info *info)
>> +{
>> + =A0 =A0 pmx_desc->pins =3D info->pins;
>> + =A0 =A0 pmx_desc->npins =3D info->npins;
>> +}
>> +
>> +static const struct of_device_id imx_pmx_dt_ids[] =3D {
>> + =A0 =A0 { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, imx_pmx_dt_ids);
>> +
>> +static int __init imx_pmx_probe(struct platform_device *pdev)
>> +{
>> + =A0 =A0 const struct of_device_id *of_id =3D
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_match_device(imx_pmx_dt=
_ids, &pdev->dev);
>> + =A0 =A0 struct device *dev =3D &pdev->dev;
>> + =A0 =A0 struct imx_pmx *ipmx;
>> + =A0 =A0 struct resource *res;
>> + =A0 =A0 struct imx_pinctrl_info *info;
>> + =A0 =A0 resource_size_t res_size;
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 info =3D of_id->data;
>> + =A0 =A0 if (!info || !info->pins || !info->npins
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 || !info->pin_regs || !info->npin_regs
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 || !info->conf_properties || !info->nc=
onf_properties) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "wrong pinctrl info\n"=
);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> + =A0 =A0 info->dev =3D &pdev->dev;
>> +
>> + =A0 =A0 /* Create state holders etc for this driver */
>> + =A0 =A0 ipmx =3D devm_kzalloc(&pdev->dev, sizeof(*ipmx), GFP_KERNE=
L);
>> + =A0 =A0 if (!ipmx)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>> +
>> + =A0 =A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> + =A0 =A0 if (!res)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -ENOENT;
>> +
>> + =A0 =A0 res_size =3D resource_size(res);
>> + =A0 =A0 if (!devm_request_mem_region(dev, res->start, res_size, re=
s->name))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
>> +
>> + =A0 =A0 ipmx->base =3D devm_ioremap_nocache(dev, res->start, res_s=
ize);
>> + =A0 =A0 if (!ipmx->base)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
>> +
>> + =A0 =A0 imx_pmx_desc_init(&imx_pmx_desc, info);
>> + =A0 =A0 ret =3D imx_pmx_probe_dt(pdev, info);
>> + =A0 =A0 if (ret) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "fail to probe dt prop=
erties\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 return ret;
>> + =A0 =A0 }
>
> So this driver only works with dt? Why can it be compiled without it
> then?
>
Yes,
The driver was first design to support both dt and non-dt (dt first).
Currently it only supports dt.
i can change the dependency in Kconfig  to make sure it can not
compile without dt.

Regards
Dong Aisheng
