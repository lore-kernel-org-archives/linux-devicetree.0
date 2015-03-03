From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH 3/4] regulator: qcom: Refactor of-parsing code
Date: Tue, 3 Mar 2015 08:26:00 -0800
Message-ID: <20150303162600.GF26334@sonymobile.com>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1425356740-26285-4-git-send-email-bjorn.andersson@sonymobile.com>
 <20150303141321.GQ21293@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150303141321.GQ21293@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue 03 Mar 06:13 PST 2015, Mark Brown wrote:

> On Mon, Mar 02, 2015 at 08:25:39PM -0800, Bjorn Andersson wrote:
> 
> > +	if ((vreg->parts->uV.mask || vreg->parts->mV.mask) &&
> > +	    (!initdata->constraints.min_uV || !initdata->constraints.max_uV)) {
> > +		dev_err(&pdev->dev, "no voltage specified for regulator\n");
> > +		return -EINVAL;
> > +	}
> 
> OK, so it looks like we're using it because we can't read the initial
> hardware state - can we introduce a specific interface for that perhaps?
> A call to query the current constraints might do it.  Or possibly just
> change your earlier patch to make sure the constraints are marked const
> would do it, reading them isn't the problem that modifying them is.  I
> might've missed some other usage somewhere though.

No, the reason for init_data is this snippet:

/* Regulators with ia property suppports drms */
if (vreg->parts->ia.mask)
	init_data->constraints.valid_ops_mask |= REGULATOR_CHANGE_DRMS;

This patch just moves the code around to make it possible to implement
patch 4 as cleanly as possible.


The quoted code checks to see that for regulators with voltage-nobs
(could have checked for set_voltage ops) the of-parser did find voltage
limits. So it's a sanity check that discards regulators with missing
dt parameters.

I did drop this in patch 4, as  it's not strictly needed. But the result
is that we will successfully register the regulator and the consumers
will be faced with errors upon trying to set voltage or enable it.

Regards,
Bjorn
