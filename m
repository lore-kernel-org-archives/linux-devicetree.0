From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] regulator: mt6351: Add support for MT6351 regulator
Date: Wed, 9 Aug 2017 17:03:04 +0800
Message-ID: <1502269384.6566.12.camel@mtksdaap41>
References: <1502245865-11403-1-git-send-email-mars.cheng@mediatek.com>
 <1502245865-11403-3-git-send-email-mars.cheng@mediatek.com>
 <1502268398.6566.8.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1502268398.6566.8.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Jimmy-YJ.Huang" <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2017-08-09 at 16:46 +0800, Yingjoe Chen wrote:
> Hi,
> 
> On Wed, 2017-08-09 at 10:31 +0800, Mars Cheng wrote:
> > From: "Jimmy-YJ.Huang" <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > The MT6351 is a regulator found on boards based on MediaTek MT6797 and
> > probably other SoCs. It is a so called pmic and connects as a slave to
> > SoC using SPI, wrapped inside the pmic-wrapper.
> > 
> > Signed-off-by: Jimmy-YJ.Huang <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/regulator/Kconfig                  |    9 +
> >  drivers/regulator/Makefile                 |    1 +
> >  drivers/regulator/mt6351-regulator.c       |  458 ++++++++++++++++++++++++++++
> >  include/linux/regulator/mt6351-regulator.h |   66 ++++
> >  4 files changed, 534 insertions(+)
> >  create mode 100644 drivers/regulator/mt6351-regulator.c
> >  create mode 100644 include/linux/regulator/mt6351-regulator.h
> > 
> > diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> > index 99b9362..1d84ddb 100644
> > --- a/drivers/regulator/Kconfig
> > +++ b/drivers/regulator/Kconfig
> > @@ -559,6 +559,15 @@ config REGULATOR_MT6323
> >  	  This driver supports the control of different power rails of device
> >  	  through regulator interface.
> >  
> > +config REGULATOR_MT6351
> > +	tristate "MediaTek MT6351 PMIC"
> > +	depends on MFD_MT6397
> > +	help
> > +	  Say y here to select this option to enable the power regulator of
> > +	  MediaTek MT6351 PMIC.
> > +	  This driver supports the control of different power rails of device
> > +	  through regulator interface.
> > +
> >  config REGULATOR_MT6397
> >  	tristate "MediaTek MT6397 PMIC"
> >  	depends on MFD_MT6397
> > diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> > index 95b1e86..fe301cf 100644
> > --- a/drivers/regulator/Makefile
> > +++ b/drivers/regulator/Makefile
> > @@ -72,6 +72,7 @@ obj-$(CONFIG_REGULATOR_MC13892) += mc13892-regulator.o
> >  obj-$(CONFIG_REGULATOR_MC13XXX_CORE) +=  mc13xxx-regulator-core.o
> >  obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
> >  obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
> > +obj-$(CONFIG_REGULATOR_MT6351)	+= mt6351-regulator.o
> >  obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
> >  obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
> >  obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
> > diff --git a/drivers/regulator/mt6351-regulator.c b/drivers/regulator/mt6351-regulator.c
> > new file mode 100644
> > index 0000000..fda1eea
> > --- /dev/null
> > +++ b/drivers/regulator/mt6351-regulator.c
> <...>
> > +
> > +static struct regulator_ops mt6351_volt_range_ops = {
> > +	.list_voltage = regulator_list_voltage_linear_range,
> > +	.map_voltage = regulator_map_voltage_linear_range,
> > +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> > +	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> > +	.set_voltage_time_sel = regulator_set_voltage_time_sel,
> > +	.enable = regulator_enable_regmap,
> > +	.disable = regulator_disable_regmap,
> > +	.is_enabled = regulator_is_enabled_regmap,
> > +	.get_status = mt6351_get_status,
> > +};
> > +
> > +static struct regulator_ops mt6351_volt_table_ops = {
> > +	.list_voltage = regulator_list_voltage_table,
> > +	.map_voltage = regulator_map_voltage_iterate,
> > +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> > +	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> > +	.set_voltage_time_sel = regulator_set_voltage_time_sel,
> > +	.enable = regulator_enable_regmap,
> > +	.disable = regulator_disable_regmap,
> > +	.is_enabled = regulator_is_enabled_regmap,
> > +	.get_status = mt6351_get_status,
> > +};
> > +
> > +static struct regulator_ops mt6351_volt_fixed_ops = {
> > +	.list_voltage = regulator_list_voltage_linear,
> > +	.enable = regulator_enable_regmap,
> > +	.disable = regulator_disable_regmap,
> > +	.is_enabled = regulator_is_enabled_regmap,
> > +	.get_status = mt6351_get_status,
> > +};
> > +
> > +/* The array is indexed by id(MT6351_ID_XXX) */
> > +static struct mt6351_regulator_info mt6351_regulators[] = {
> 
> 
> const
> 
> All struct regulator_ops and mt6351_regulators should be const.


Hi,

It seems mt6351_regulators will be modified so can't be const.
But regulator_ops should be.

Joe.C
