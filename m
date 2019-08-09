From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] regulator: qcom-rpmh: Add support for SM8150
Date: Fri, 9 Aug 2019 10:14:35 +0530
Message-ID: <20190809044435.GE12733@vkoul-mobl.Dlink>
References: <20190808093343.5600-1-vkoul@kernel.org>
 <20190808093343.5600-2-vkoul@kernel.org>
 <20190809033255.GL26807@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190809033255.GL26807@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08-08-19, 20:32, Bjorn Andersson wrote:
> On Thu 08 Aug 02:33 PDT 2019, Vinod Koul wrote:
> > diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> [..]
> > +static const struct rpmh_vreg_hw_data pmic5_bob = {
> > +	.regulator_type = VRM,
> > +	.ops = &rpmh_regulator_vrm_bypass_ops,
> > +	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
> > +	.n_voltages = 135,
> 
> There are 136 voltages in [0,135]

Oops, will send an update

> 
> > +	.pmic_mode_map = pmic_mode_map_pmic4_bob,
> > +	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
> > +};
> > +
> [..]
> > @@ -755,6 +890,18 @@ static const struct of_device_id rpmh_regulator_match_table[] = {
> >  		.compatible = "qcom,pm8005-rpmh-regulators",
> >  		.data = pm8005_vreg_data,
> >  	},
> > +	{
> > +		.compatible = "qcom,pm8150-rpmh-regulators",
> > +		.data = pm8150_vreg_data,
> > +	},
> > +	{
> > +		.compatible = "qcom,pm8150l-rpmh-regulators",
> > +		.data = pm8150l_vreg_data,
> > +	},
> > +	{
> > +		.compatible = "qcom,pm8009-rpmh-regulators",
> > +		.data = pm8009_vreg_data,
> > +	},
> 
> Sort order...

Yes will sort all entries.

> >  	{}
> >  };
> >  MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
> 
> Apart from these nits this looks good.

Thanks :)

-- 
~Vinod
