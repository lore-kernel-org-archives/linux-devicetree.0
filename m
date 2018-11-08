From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 2/6] regulator: lochnagar: Move driver to binding from DT
Date: Thu, 8 Nov 2018 21:59:41 +0000
Message-ID: <20181108215941.GU16508@imbe.wolfsonmicro.main>
References: <20181108101405.14062-1-ckeepax@opensource.cirrus.com>
 <20181108101405.14062-3-ckeepax@opensource.cirrus.com>
 <20181108121629.GD6675@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181108121629.GD6675@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 08, 2018 at 12:16:29PM +0000, Mark Brown wrote:
> On Thu, Nov 08, 2018 at 10:14:01AM +0000, Charles Keepax wrote:
> 
> > +static const struct of_device_id lochnagar_of_match[] = {
> > +	{ .compatible = "cirrus,lochnagar-regulator" },
> > +	{},
> > +};
> 
> This is obviously just dumping the Linux driver model into the DT, the
> regulators are clearly different.  If you want to explicitly list the
> regulators in DT it'd be better to reflect the hardware and enumerate
> the regulators individually - you can use one driver for all the MICVDDs
> and a separate one for VDDCORE for example.

Agreed, would be relatively doable for regulators, might be a bit
verbose for the clock, but I really don't see how to handle
pinctrl.

I guess I will wait and see what the other maintainers think but
personally I would really be inclined to keep the binding the
same as the last version if we can.

Thanks,
Charles
