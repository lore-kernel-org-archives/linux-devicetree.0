From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH 8/9] regulator: bd71837: BD71837 PMIC regulator driver
Date: Fri, 25 May 2018 10:22:53 +0300
Message-ID: <20180525072253.GC16888@localhost.localdomain>
References: <20180524060036.GI4249@localhost.localdomain>
 <20180524141427.GU4828@sirena.org.uk>
 <042F8805D2046347BB8420BEAE397A4016C06B60@WILL-MAIL002.REu.RohmEu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <042F8805D2046347BB8420BEAE397A4016C06B60@WILL-MAIL002.REu.RohmEu.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>, Mark Brown <broonie@kernel.org>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>, "Haikola, Heikki" <Heikki.Haikola@fi.rohmeurope.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 24, 2018 at 05:51:27PM +0000, Vaittinen, Matti wrote:
> 
> From: Mark Brown [broonie@kernel.org]
> > Sent: Thursday, May 24, 2018 5:14 PM
> > On Thu, May 24, 2018 at 09:00:36AM +0300, Matti Vaittinen wrote:
> > > +             rdev = regulator_register(desc, &config);
> > > +             if (IS_ERR(rdev)) {
> >
> > devm_regulator_regster()
> 
> Makes sense. Thanks

I was going to do 

-       pmic = kzalloc(sizeof(struct bd71837_pmic), GFP_KERNEL);
+       pmic = devm_kzalloc(&pdev->dev, sizeof(struct bd71837_pmic),
+                           GFP_KERNEL);

and

-               rdev = regulator_register(desc, &config);
+               rdev = devm_regulator_register(&pdev->dev, desc, &config);

but is there now a race regarding freeing the pmic structure and
unregistering the regulator?

Best Regards
    Matti Vaittinen
