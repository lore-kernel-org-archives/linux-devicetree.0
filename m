From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 4/4] regulator: qcom: Rework to single platform device
Date: Wed, 4 Mar 2015 15:51:46 -0800
Message-ID: <20150304235146.GP26334@sonymobile.com>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-5-git-send-email-bjorn.andersson@sonymobile.com>
 <54F75E8F.2070900@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54F75E8F.2070900@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed 04 Mar 11:35 PST 2015, Stephen Boyd wrote:

> On 03/02/15 20:25, Bjorn Andersson wrote:
> > +	match = of_match_device(rpm_of_match, &pdev->dev);
> > +	for (reg = match->data; reg->name; reg++) {
> > +		vreg = devm_kmalloc(&pdev->dev, sizeof(*vreg), GFP_KERNEL);
> > +		if (!vreg) {
> > +			dev_err(&pdev->dev, "failed to allocate vreg\n");
> > +			return -ENOMEM;
> > +		}
> > +		memcpy(vreg, reg->template, sizeof(*vreg));
> > +		mutex_init(&vreg->lock);
> > +
> > +		vreg->dev = &pdev->dev;
> > +		vreg->resource = reg->resource;
> > +
> > +		vreg->desc.id = -1;
> > +		vreg->desc.owner = THIS_MODULE;
> > +		vreg->desc.type = REGULATOR_VOLTAGE;
> > +		vreg->desc.name = reg->name;
> > +		vreg->desc.supply_name = reg->supply;
> > +		vreg->desc.of_match = reg->name;
> > +		vreg->desc.of_parse_cb = rpm_reg_of_parse;
> > +
> > +		vreg->rpm = dev_get_drvdata(pdev->dev.parent);
> > +		if (!vreg->rpm) {
> > +			dev_err(&pdev->dev, "unable to retrieve handle to rpm\n");
> > +			return -ENODEV;
> > +		}
> >  
> > -	rdev = devm_regulator_register(&pdev->dev, &vreg->desc, &config);
> > -	if (IS_ERR(rdev)) {
> > -		dev_err(&pdev->dev, "can't register regulator\n");
> > -		return PTR_ERR(rdev);
> > +		config.dev = &pdev->dev;
> > +		config.driver_data = vreg;
> > +		rdev = devm_regulator_register(&pdev->dev, &vreg->desc, &config);
> > +		if (IS_ERR(rdev)) {
> > +			dev_err(&pdev->dev, "can't register regulator\n");
> > +			return PTR_ERR(rdev);
> > +		}
> >  	}
> >  
> >  	return 0;
> 
> There's another problem with this of_parse_cb design. The regulator
> framework requires supplies to be registered before consumers of the
> supplies are registered.

You're right, didn't think of that.

The way I've ordered pm8921 it happens to work, but neither 8058 nor
8901 will pass probe by filling in the dependencies according to what we
have in the caf branch.

> So when we register L23 we need to make sure
> it's supply is already registered (S8 for example). If we used
> of_regulator_match() we could sort the array by hand so that we always
> register the supplies first.

Right, but that would mean that any block of regulators with internal
dependencies would miss out on the "standard" code paths through
regulator_register() and have to implement this on their own.

Just looking at the Qualcomm case, we would have to implement this
sorting mechanism in the rpm-regulator, pm8xxx-regulator, smd-regulator
and qpnp-regulator drivers.


I took a stab at implementing EPROBE_DEFER within qcom_rpm-regulator,
but as it's a mixture of internal and external dependencies (e.g.
<&pm8921_s4> vs <&pm8921_mpp 7>) this became quite messy. I started
looking at using the dt dependencies sort and iterate over the entries
in a way that adheres to their dependencies, but that's also a lot of
code.

But...

> Or we could modify the regulator framework
> to have a concept of "orphaned" supplies like the clock framework has so
> that when a regulator is registered it waits until its supply is registered.
> 

...as we're grouping all regulators into one device per PMIC we create
artificial dependencies that the hardware guys does not have. Further
more the fact that we can have some parts of the pmic exposed through
the rpm driver and others through the direct driver we have yet another
level of possible just adds to this.

It's perfectly fine to route the dependencies between two of our PMICs
in a way that on a device level we have a circular dependency.

So I think you're right, we should be able to alter the supply lookup
code to defer the EPROBE_DEFER until we actually need the supply to be
there; e.g. attempt to map supplies when an external consumer request
the regulator.
Some care needs to be taken with regards to e.g. always-on regulators.

Regards,
Bjorn
