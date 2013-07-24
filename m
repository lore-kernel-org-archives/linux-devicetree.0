From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH v4] regulator: pfuze100: add pfuze100 regulator driver
Date: Wed, 24 Jul 2013 11:51:45 +0200
Message-ID: <20130724095145.GE4332@pengutronix.de>
References: <1374398247-11384-1-git-send-email-b38343@freescale.com>
 <20130724083041.GC4332@pengutronix.de>
 <20130724094228.GY9858@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130724094228.GY9858@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Robin Gong <b38343@freescale.com>, shawn.guo@linaro.org, grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, lgirdwood@gmail.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2013 at 10:42:28AM +0100, Mark Brown wrote:
> On Wed, Jul 24, 2013 at 10:30:41AM +0200, Steffen Trumtrar wrote:
> > On Sun, Jul 21, 2013 at 05:17:27PM +0800, Robin Gong wrote:
> 
> > 
> >  static struct regulator_ops pfuze100_fixed_regulator_ops = {
> > 	.list_voltage = regulator_list_voltage_linear,
> > +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> >  };
> 
> This doesn't make much sense, you're adding a set voltage operation to a
> fixed voltage regulator...

Hm, okay, sounds reasonable. But if I don't, VREFDDR isn't registered because
_regulator_do_set_voltage returns with -EINVAL.
So, I probably just fixed a symptom and not the cause.

Thanks,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
