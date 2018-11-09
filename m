From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] phy: qualcomm: Add Synopsys High-Speed USB PHY driver
Date: Fri, 9 Nov 2018 16:38:09 +0530
Message-ID: <20181109110809.GT12092@vkoul-mobl>
References: <20181108070449.23572-1-shawn.guo@linaro.org>
 <20181108070449.23572-3-shawn.guo@linaro.org>
 <20181109052217.GL12092@vkoul-mobl>
 <20181109065226.GB20049@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181109065226.GB20049@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09-11-18, 14:52, Shawn Guo wrote:
> On Fri, Nov 09, 2018 at 10:52:17AM +0530, Vinod Koul wrote:
> > On 08-11-18, 15:04, Shawn Guo wrote:
> > > +static int qcom_snps_hsphy_config_regulators(struct hsphy_priv *priv, int high)
> > > +{
> > > +	int min, ret, i;
> > > +
> > > +	min = high ? 1 : 0; /* low or none? */
> > > +
> > > +	for (i = 0; i < VREG_NUM; i++) {
> > > +		ret = regulator_set_voltage(priv->vregs[i].consumer,
> > > +					    priv->voltages[i][min],
> > > +					    priv->voltages[i][VOL_MAX]);
> > > +		if (ret)
> > > +			return ret;
> > 
> > should we not roll back the set voltages on error?
> 
> Yes.  I will get that handled in v2.  Thanks.
> 
> > 
> > > +static int qcom_snps_hsphy_por_reset(struct hsphy_priv *priv)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = reset_control_assert(priv->por_reset);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * The Femto PHY is POR reset in the following scenarios.
> > 
> > POR?
> 
> Hmm, I do not understand this comment.  The POR is commonly used as the
> abbrev of power-on-reset.  What do you meat exactly?

I wasnt aware that POR refers to power-on-reset :) I dont know if it is
a very generic term :D
-- 
~Vinod
