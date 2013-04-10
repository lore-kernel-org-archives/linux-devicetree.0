From: Michal Bachraty <michal.bachraty@streamunlimited.com>
Subject: Re: [PATCH v7] clk: add si5351 i2c common clock driver
Date: Wed, 10 Apr 2013 16:48:25 +0200
Message-ID: <14854575.YAd2OMKOy9@ganymedes>
References: <1365439617-18816-1-git-send-email-sebastian.hesselbarth@gmail.com> <1365586810-6752-1-git-send-email-sebastian.hesselbarth@gmail.com> <51653C3E.2020702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51653C3E.2020702@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Daniel Mack <zonque@gmail.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Dom Cobley <popcornmix@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Rabeeh Khoury <rabeeh@solid-run.com>, Jean-Francois Moine <moinejf@free.fr>, Lars-Peter Clausen <lars@metafoo.de>, Guenter Roeck <linux@roeck-us.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Sebastian,
This driver doesn't work for me. In my case, u-boot initializes si-5351 and 
power down unused clocks while booting kernel.  there is need for power up 
clocks as was in previous versions of your driver.  
See patch, whre the problem is fixed:

@@ -992,6 +992,10 @@ static long si5351_clkout_round_rate(struct clk_hw *hw, 
unsigned long rate,
 		} while (1);
 	}
 	rate = *parent_rate >> rdiv;
+	
+	/* powerup clkout */
+	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
+			SI5351_CLK_POWERDOWN, 0);
 
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",

With this lines, driver works well.

Also, 

> > +==Example==
> > +
> > +/* 25MHz reference crystal */
> > +ref25: ref25M {
> > +	compatible = "fixed-clock";
> > +	#clock-cells = <0>;
> > +	clock-frequency = <25000000>;
> > +};
> > +
> > +i2c-master-node {
> > +
> > +	/* Si5351a msop10 i2c clock generator */
> > +	si5351a: clock-generator@60 {
> > +		compatible = "silabs,si5351a-msop";
> > +		reg = <0x60>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		#clock-cells = <1>;
> > +
> > +		/* connect xtal input to 25MHz reference */
> > +		clocks = <&ref25>;
> > +
> > +		/* connect xtal input as source of pll0 and pll1 */
> > +		silabs,pll-source = <0 0>, <1 0>;
> > +
> > +		/*
> > +		 * overwrite clkout0 configuration with:
> > +		 * - 8mA output drive strength
> > +		 * - pll0 as clock source of multisynth0
> > +		 * - multisynth0 as clock source of output divider
> > +		 * - multisynth0 can change pll0
> > +		 * - set initial clock frequency of 74.25MHz
> > +		 */
> > +		clkout0 {
> > +			reg = <0>;
> > +			silabs,drive-strength = <8>;
> > +			silabs,multisynth-source = <0>;
> > +			silabs,clock-source = <0>;
> > +			silabs,pll-master;
> > +			clock-frequency = <74250000>;
> > +		};
> > +
> > +		/*
> > +		 * overwrite clkout1 configuration with:
> > +		 * - 4mA output drive strength
> > +		 * - pll1 as clock source of multisynth1
> > +		 * - multisynth1 as clock source of output divider
> > +		 * - multisynth1 can change pll1
> > +		 */
> > +		clkout1 {
> > +			reg = <1>;
> > +			silabs,drive-strength = <4>;
> > +			silabs,multisynth-source = <1>;
> > +			silabs,clock-source = <0>;
> > +			pll-master;
> > +		};
> > +
 Is definition of pll-master in clkout1 correct? should not be silabs,pll-
master ?

Best regards,
Michal
