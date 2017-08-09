From: Mars Cheng <mars.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] regulator: mt6351: Add support for MT6351 regulator
Date: Wed, 9 Aug 2017 17:14:34 +0800
Message-ID: <1502270074.31210.2.camel@mtkswgap22>
References: <1502245865-11403-1-git-send-email-mars.cheng@mediatek.com>
 <1502245865-11403-3-git-send-email-mars.cheng@mediatek.com>
 <1502268398.6566.8.camel@mtksdaap41> <1502269384.6566.12.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1502269384.6566.12.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Jimmy-YJ.Huang" <jimmy-yj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, CC Hwang <cc.hwang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi

On Wed, 2017-08-09 at 17:03 +0800, Yingjoe Chen wrote:
> On Wed, 2017-08-09 at 16:46 +0800, Yingjoe Chen wrote:
...
> > > +static struct regulator_ops mt6351_volt_table_ops = {
> > > +	.list_voltage = regulator_list_voltage_table,
> > > +	.map_voltage = regulator_map_voltage_iterate,
> > > +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> > > +	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> > > +	.set_voltage_time_sel = regulator_set_voltage_time_sel,
> > > +	.enable = regulator_enable_regmap,
> > > +	.disable = regulator_disable_regmap,
> > > +	.is_enabled = regulator_is_enabled_regmap,
> > > +	.get_status = mt6351_get_status,
> > > +};
> > > +
> > > +static struct regulator_ops mt6351_volt_fixed_ops = {
> > > +	.list_voltage = regulator_list_voltage_linear,
> > > +	.enable = regulator_enable_regmap,
> > > +	.disable = regulator_disable_regmap,
> > > +	.is_enabled = regulator_is_enabled_regmap,
> > > +	.get_status = mt6351_get_status,
> > > +};
> > > +
> > > +/* The array is indexed by id(MT6351_ID_XXX) */
> > > +static struct mt6351_regulator_info mt6351_regulators[] = {
> > 
> > 
> > const
> > 
> > All struct regulator_ops and mt6351_regulators should be const.
> 
> 
> Hi,
> 
> It seems mt6351_regulators will be modified so can't be const.
> But regulator_ops should be.
> 

got it, will fix this along with other coding style and sent v2 later.

Thanks for your review.

> Joe.C
> 
> 
