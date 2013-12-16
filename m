From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCHv3,RESEND] rtc: Add support for Intersil ISL12057 I2C RTC
 chip
Date: Mon, 16 Dec 2013 13:02:57 -0800
Message-ID: <20131216210257.GA7981@roeck-us.net>
References: <637f26e051b700ca510a0af695dfd84cf2bfd35d.1387222475.git.arno@natisbad.org>
 <20131216201424.GA6639@roeck-us.net>
 <20131216201743.GT3185@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20131216201743.GT3185@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Arnaud Ebalard <arno@natisbad.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 16, 2013 at 08:17:43PM +0000, Mark Brown wrote:
> On Mon, Dec 16, 2013 at 12:14:24PM -0800, Guenter Roeck wrote:
> > On Mon, Dec 16, 2013 at 08:49:36PM +0100, Arnaud Ebalard wrote:
> 
> > > +#ifdef CONFIG_OF
> > > +static struct of_device_id isl12057_dt_match[] = {
> > > +	{ .compatible = "isl,isl12057" },
> > > +	{ },
> > > +};
> > > +#endif
> 
> > Is this needed ? For i2c devices, struct i2c_device_id should be sufficient.
> 
> It is required, it's bad practice to omit the vendor specifier.
> Different vendors can and do use the same prefix in their device names
> leading to collisions - for example both Wondermedia and Wolfson use wm.
> Linux happens to accept unprefixed names but that doesn't mean it's a
> good idea.

Ok, I'll keep that in mind.

Thanks,
Guenter
