From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH 8/9] regulator: bd71837: BD71837 PMIC regulator driver
Date: Fri, 25 May 2018 14:32:40 +0300
Message-ID: <20180525113240.GE16888@localhost.localdomain>
References: <20180524060036.GI4249@localhost.localdomain>
 <20180524141427.GU4828@sirena.org.uk>
 <042F8805D2046347BB8420BEAE397A4016C06B60@WILL-MAIL002.REu.RohmEu.com>
 <20180525072253.GC16888@localhost.localdomain>
 <20180525101423.GH4828@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180525101423.GH4828@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>, "Haikola, Heikki" <Heikki.Haikola@fi.rohmeurope.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 25, 2018 at 11:14:23AM +0100, Mark Brown wrote:
> On Fri, May 25, 2018 at 10:22:53AM +0300, Matti Vaittinen wrote:
> > On Thu, May 24, 2018 at 05:51:27PM +0000, Vaittinen, Matti wrote:
> 
> > > > devm_regulator_regster()
> 
> > > Makes sense. Thanks
> 
> > I was going to do 
> 
> > -       pmic = kzalloc(sizeof(struct bd71837_pmic), GFP_KERNEL);
> > +       pmic = devm_kzalloc(&pdev->dev, sizeof(struct bd71837_pmic),
> > +                           GFP_KERNEL);
> 
> > and
> 
> > -               rdev = regulator_register(desc, &config);
> > +               rdev = devm_regulator_register(&pdev->dev, desc, &config);
> > 
> > but is there now a race regarding freeing the pmic structure and
> > unregistering the regulator?
> 
> Why?  devm_ stuff gets unwound in the opposite order to the order in
> which it was allocated.
Allright. Then there's no problems. I'll do the change.
