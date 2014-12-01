From: Flora Fu <flora.fu@mediatek.com>
Subject: Re: [PATCH v2 3/8] regulator: MT6397: Add support for MT6397 regulator
Date: Mon, 1 Dec 2014 10:51:44 +0800
Message-ID: <1417402305.30873.78.camel@mtksdaap41>
References: <1417146874-5232-1-git-send-email-flora.fu@mediatek.com>
 <1417146874-5232-4-git-send-email-flora.fu@mediatek.com>
 <20141128152247.GR7712@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20141128152247.GR7712@sirena.org.uk>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Russell King <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Sandeep Nair <sandeep_n@ti.com>, Grant Likely <grant.likely@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Warren <swarren@nvidia.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, Dongdong Cheng <dongdong.cheng@mediatek.com>, srv_heupstream@mediatek.comPeter De Schrijver <p>
List-Id: devicetree@vger.kernel.org

Hi, Mark

On Fri, 2014-11-28 at 15:22 +0000, Mark Brown wrote:
> On Fri, Nov 28, 2014 at 11:54:29AM +0800, Flora Fu wrote:
> 
> > @@ -96,5 +97,4 @@ obj-$(CONFIG_REGULATOR_WM8350) += wm8350-regulator.o
> >  obj-$(CONFIG_REGULATOR_WM8400) += wm8400-regulator.o
> >  obj-$(CONFIG_REGULATOR_WM8994) += wm8994-regulator.o
> >  
> > -
> >  ccflags-$(CONFIG_REGULATOR_DEBUG) += -DDEBUG
> 
> Random whitespace change here...
> 
> > +	/* For HW design, buck voltage control register has two parts.
> > +	 * part 1: vsel_reg for register mode
> > +	 * part 2: voselon_reg or hw control mode
> > +	 * Both parts should be updated and sync when user set voltage.
> > +	 */
> 
> Why does nothing else in the driver know about this "hw control mode" -
> what does it actually mean, shouldn't it affect some of the other
> operations?

In the regulator, we have two parts of registers to control the output
in voltage selection. The mode setting is done in boot loader stage
before kernel.
The hw control mode is used for external signal to control voltage
selection. When the hw control mode is chosen, "voselon" register is the
action register to do voltage selection if consumer make voltage
selection. Without hw control mode, vsel_reg is the action register.
To fit all mode selection, we update and sync two parts of registers in
regulator framework.

> 
> > +static int mt6397_buck_get_voltage_sel(struct regulator_dev *rdev)
> > +{
> 
> > +static int mt6397_regulator_is_enabled(struct regulator_dev *rdev)
> > +{
> 
> To repeat my comments on the last version: please use the generic regmap
> operations rather than copying them.
> 

The generic helper function does not fit usage of the regulator. 
In general function, it considers that the vsel_reg for selection
voltage is also the register for querying voltage selection. The enable
bit for enable function is the bit for querying the status. 

In the hardware design, the output of voltage selection register is
different from vsel_reg. Is is located in nivosel. The enable bit is
locate in the other bit called "qi_mask".  
Please check comment in MT6397 regulators' information. 
/*
 * MT6397 regulators' information
 *
 * @desc: standard fields of regulator description.
 * @voselon_reg: Register sections for hardware control mode of bucks
 * @nivosel_reg: Register for query output voltage selection of bucks
 * @qi_mask: Mask for query enable signal status of regulators
 */
struct mt6397_regulator_info {
	struct regulator_desc desc;
	u32 voselon_reg;
	u32 nivosel_reg;
	u32 qi_mask;
};

That's whey ops ".get_voltage_sel" and ".is_enabled" is not able to use
generic regamp.


> > +	np = of_node_get(pdev->dev.parent->of_node);
> > +	if (!np)
> > +		return -EINVAL;
> > +
> > +	regulators = of_get_child_by_name(np, "regulators");
> 
> To further repeat my

>  previous review comments:
> 
> | Define regulators_node and of_match in the regulator desc and you can
> | remove both this table and all your DT matching code in the driver, the
> | core will handle it for you.
> 
> Please don't ignore review comments.

Sure, I think I completely misunderstood what you meant. Could you give
more details about the comments?
In this version, the table for DT matching is removed and merged into
regulator info in table mt6397_regulators. To register every regulator
by devm_regulator_register(), the of_node is parsed from
of_regulator_match() by name. Here is to retrieves the device_node
"regulators" for of_regulator_match() to get all regulator_init_data and
corresponding of_node.
Is any other mechanism I can use to achieve these part without
of_regulstor_match()?


Thanks,
Flora
