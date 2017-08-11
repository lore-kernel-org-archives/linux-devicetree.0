From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/9] regulator: mt6380: Add support for MT6380
Date: Fri, 11 Aug 2017 11:12:23 +0800
Message-ID: <1502421143.19230.24.camel@mtkswgap22>
References: <cover.1500368529.git.sean.wang@mediatek.com>
         <0cd2be9a7058bb51fbbc7cc96101cba44fc081f6.1500368529.git.sean.wang@mediatek.com>
         <1502270559.6566.14.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502270559.6566.14.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-08-09 at 17:22 +0800, Yingjoe Chen wrote:
> On Tue, 2017-07-18 at 17:49 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > The MT6380 is a regulator found those boards with MediaTek MT7622 SoC
> > It is connected as a slave to the SoC using MediaTek PMIC wrapper which
> > is the common interface connecting with Mediatek made various PMICs.
> > 
> > Signed-off-by: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/regulator/Kconfig                  |   9 +
> >  drivers/regulator/Makefile                 |   1 +
> >  drivers/regulator/mt6380-regulator.c       | 359 +++++++++++++++++++++++++++++
> >  include/linux/regulator/mt6380-regulator.h |  32 +++
> >  4 files changed, 401 insertions(+)
> >  create mode 100644 drivers/regulator/mt6380-regulator.c
> >  create mode 100644 include/linux/regulator/mt6380-regulator.h
> > 
> > diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> > index 48db87d..c46ef9c 100644
> > --- a/drivers/regulator/Kconfig
> > +++ b/drivers/regulator/Kconfig
> > @@ -541,6 +541,15 @@ config REGULATOR_MT6323
> >  	  This driver supports the control of different power rails of device
> >  	  through regulator interface.
> >  
> > +config REGULATOR_MT6380
> > +	tristate "MediaTek MT6380 PMIC"
> > +	depends on MTK_PMIC_WRAP
> > +	help
> > +	  Say y here to select this option to enable the power regulator of
> > +	  MediaTek MT6380 PMIC.
> > +	  This driver supports the control of different power rails of device
> > +	  through regulator interface.
> > +
> >  config REGULATOR_MT6397
> >  	tristate "MediaTek MT6397 PMIC"
> >  	depends on MFD_MT6397
> > diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> > index dc3503f..5148583 100644
> > --- a/drivers/regulator/Makefile
> > +++ b/drivers/regulator/Makefile
> > @@ -70,6 +70,7 @@ obj-$(CONFIG_REGULATOR_MC13892) += mc13892-regulator.o
> >  obj-$(CONFIG_REGULATOR_MC13XXX_CORE) +=  mc13xxx-regulator-core.o
> >  obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
> >  obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
> > +obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
> >  obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
> >  obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
> >  obj-$(CONFIG_REGULATOR_QCOM_SMD_RPM) += qcom_smd-regulator.o
> > diff --git a/drivers/regulator/mt6380-regulator.c b/drivers/regulator/mt6380-regulator.c
> > new file mode 100644
> > index 0000000..5fca36f
> > --- /dev/null
> > +++ b/drivers/regulator/mt6380-regulator.c
> 
> <...>
> 
> > +static struct regulator_ops mt6380_volt_range_ops = {
> > +	.list_voltage = regulator_list_voltage_linear_range,
> > +	.map_voltage = regulator_map_voltage_linear_range,
> > +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> > +	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> > +	.set_voltage_time_sel = regulator_set_voltage_time_sel,
> > +	.enable = regulator_enable_regmap,
> > +	.disable = regulator_disable_regmap,
> > +	.is_enabled = regulator_is_enabled_regmap,
> > +	.set_mode = mt6380_regulator_set_mode,
> > +	.get_mode = mt6380_regulator_get_mode,
> > +};
> > +
> > +static struct regulator_ops mt6380_volt_table_ops = {
> > +	.list_voltage = regulator_list_voltage_table,
> > +	.map_voltage = regulator_map_voltage_iterate,
> > +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> > +	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> > +	.set_voltage_time_sel = regulator_set_voltage_time_sel,
> > +	.enable = regulator_enable_regmap,
> > +	.disable = regulator_disable_regmap,
> > +	.is_enabled = regulator_is_enabled_regmap,
> > +	.set_mode = mt6380_regulator_set_mode,
> > +	.get_mode = mt6380_regulator_get_mode,
> > +};
> > +
> > +static struct regulator_ops mt6380_volt_fixed_ops = {
> 
> this should be const.
> 
> Joe.C

Hi, Joe.C

nice catch. also will be included in the next version

	Sean



> 
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
