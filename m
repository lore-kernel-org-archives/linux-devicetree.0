From: Eric Hyeung Dong Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH V2 3/4] regulator: pv88080: Update Regulator driver for
 MFD support
Date: Tue, 8 Nov 2016 05:59:41 +0000
Message-ID: <8FA4409277D6E54680546B8811D85410029DFAA2EA@NB-EX-MBX01.diasemi.com>
References: <cover.1477530195.git.eric.jeong@diasemi.com>
 <711afefe3e65c166111473024bf9b54f3d4cc8b6.1477530195.git.eric.jeong@diasemi.com>
 <20161027110337.GJ25322@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161027110337.GJ25322-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Hyeung Dong Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: LINUX-KERNEL <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, DEVICETREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LINUX-GPIO <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Support Opensource <Support.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, October 27, 2016 8:04 PM, Mark Brown wrote:

> On Thu, Oct 27, 2016 at 10:03:14AM +0900, Eric Jeong wrote:
> 
> >  config REGULATOR_PV88080
> > -	tristate "Powerventure Semiconductor PV88080 regulator"
> > -	depends on I2C
> > -	select REGMAP_I2C
> > +	bool "Powerventure Semiconductor PV88080 regulator"
> > +	depends on MFD_PV88080
> 
> Forcing the driver to be built in looks like a regression, why would we want to
> do that?
> 
> > +	irq = platform_get_irq_byname(pdev, "regulator-irq");
> > +	if (irq < 0) {
> > +		dev_err(&pdev->dev, "Failed to get IRQ.\n");
> > +		return irq;
> >  	}
> 
> What's the _byname() adding here given that the name is so generic?  It feels
> like if the name ever becomes important then this particular name is going to
> be a problem.
> 
> > -module_i2c_driver(pv88080_regulator_driver);
> > +static int __init pv88080_regulator_init(void) {
> > +	return platform_driver_register(&pv88080_regulator_driver);
> > +}
> > +subsys_initcall(pv88080_regulator_init);
> 
> Why are you converting this to subsys_initcall()?  This looks like another
> regression.

Thank you for the comments.
There was an internal request to release driver based on Kernel 3.18 for GPIO and MFD support.
After that, the code has been kept. I will send a patch again after changes.

Regards
Eric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
