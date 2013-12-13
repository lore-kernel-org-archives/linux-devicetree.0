From: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Subject: RE: [PATCH 1/3] regulator: act8865: add PMIC(Power Management IC)
 driver
Date: Fri, 13 Dec 2013 07:10:36 +0000
Message-ID: <B256D81BAE5131468A838E5D7A24364172EDB624@penmbx01>
References: <1386811131-2720-1-git-send-email-wenyou.yang@atmel.com>
 <1386811131-2720-2-git-send-email-wenyou.yang@atmel.com>
 <20131212165149.GO11044@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20131212165149.GO11044@sirena.org.uk>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "vpalatin@chromium.org" <vpalatin@chromium.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Ferre,
 Nicolas" <Nicolas.FERRE@atmel.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Thanks your for feedback.

> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Friday, December 13, 2013 12:52 AM
> To: Yang, Wenyou
> Cc: lgirdwood@gmail.com; grant.likely@linaro.org;
> rob.herring@calxeda.com; vpalatin@chromium.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> plagnioj@jcrosoft.com; Ferre, Nicolas
> Subject: Re: [PATCH 1/3] regulator: act8865: add PMIC(Power Management
> IC) driver
> 
> On Thu, Dec 12, 2013 at 09:18:49AM +0800, Wenyou Yang wrote:
> 
> The main thing with this driver seems to be that it needs a bit of
> modernisation to use current kernel features and APIs - there's nothing
> terribly wrong from a quick glance through but it needs an update.
> Details below.
> 
> > --- a/drivers/regulator/Kconfig
> > +++ b/drivers/regulator/Kconfig
> > @@ -577,5 +577,12 @@ config REGULATOR_WM8994
> >  	  This driver provides support for the voltage regulators on the
> >  	  WM8994 CODEC.
> >
> > +config REGULATOR_ACT8865
> > +	tristate "Active-semi act8865 voltage regulator"
> > +	depends on I2C
> > +	help
> > +	  This driver controls a active-semi act8865 voltage output
> > +	  regulator via I2C bus.
> > +
> 
> Please keep this and the Makefile sorted.
Only this one confuses me,
How can I sort it? By i2c interface, by regulator type: voltage or current?
Where is act8865 should be?

> 
> > +static int act8865_read_reg(struct act8865_data *act8865, u8 reg) {
> > +	int ret = i2c_smbus_read_byte_data(act8865->client, reg);
> > +	if (ret > 0)
> > +		ret &= 0xff;
> > +
> > +	return ret;
> > +}
> 
> Use regmap for register I/O and use the helpers provided by the core.
> 
> > +static int act8865_set_voltage_sel(struct regulator_dev *rdev, u32
> > +selector) {
> > +	struct act8865_data *act8865 = rdev_get_drvdata(rdev);
> > +	int id = rdev_get_id(rdev);
> > +	u32	reg = act8865_vset_reg_addr(act8865, id);
> 
> Throughout the file the indentation is a really strange mix of the first
> two lines (which are the normal kernel style) and the bottom line (which
> isn't).
> 
> > +	pr_info("%s: suspend voltage %dmV\n", rdev->desc->name, uV / 1000);
> 
> Remove noisy logging like this.
> 
> > +		rdev[i] = regulator_register(&act8865_reg[id], &config);
> 
> devm_regulator_register().
> 
> > +static int __init act8865_pmu_init(void) {
> > +	return i2c_add_driver(&act8865_pmu_driver);
> > +}
> > +subsys_initcall(act8865_pmu_init);
> 
> module_i2c_driver().

Others is OK for me, I will modify, and send out new version.

Thanks again.

Best Regards,
Wenyou Yang
