From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/7] drivers: regulator: qcom_spmi: Refactor
 get_mode/set_mode
Date: Thu, 13 Jun 2019 08:24:30 -0700
Message-ID: <20190613152430.GC6792@builder>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142239.8779-1-jeffrey.l.hugo@gmail.com>
 <20190613151209.GB6792@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613151209.GB6792@builder>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 13 Jun 08:12 PDT 2019, Bjorn Andersson wrote:

> On Thu 13 Jun 07:22 PDT 2019, Jeffrey Hugo wrote:
> 
> > spmi_regulator_common_get_mode and spmi_regulator_common_set_mode use
> > multi-level ifs which mirror a switch statement.  Refactor to use a switch
> > statement to make the code flow more clear.
> > 
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/regulator/qcom_spmi-regulator.c | 28 ++++++++++++++++---------
> >  1 file changed, 18 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
> > index fd55438c25d6..1c18fe5969b5 100644
> > --- a/drivers/regulator/qcom_spmi-regulator.c
> > +++ b/drivers/regulator/qcom_spmi-regulator.c
> > @@ -911,13 +911,14 @@ static unsigned int spmi_regulator_common_get_mode(struct regulator_dev *rdev)
> >  
> >  	spmi_vreg_read(vreg, SPMI_COMMON_REG_MODE, &reg, 1);
> >  
> > -	if (reg & SPMI_COMMON_MODE_HPM_MASK)

Sorry, didn't see the & here. Don't you need to mask out the mode bits
before turning this into a switch?

> > +	switch (reg) {
> > +	case SPMI_COMMON_MODE_HPM_MASK:
> >  		return REGULATOR_MODE_NORMAL;
> > -
> > -	if (reg & SPMI_COMMON_MODE_AUTO_MASK)
> > +	case SPMI_COMMON_MODE_AUTO_MASK:
> >  		return REGULATOR_MODE_FAST;
> > -
> > -	return REGULATOR_MODE_IDLE;
> > +	default:
> > +		return REGULATOR_MODE_IDLE;
> > +	}
> >  }
> >  
> >  static int
> > @@ -925,12 +926,19 @@ spmi_regulator_common_set_mode(struct regulator_dev *rdev, unsigned int mode)
> >  {
> >  	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
> >  	u8 mask = SPMI_COMMON_MODE_HPM_MASK | SPMI_COMMON_MODE_AUTO_MASK;
> > -	u8 val = 0;
> > +	u8 val;
> >  
> > -	if (mode == REGULATOR_MODE_NORMAL)
> > +	switch (mode) {
> > +	case REGULATOR_MODE_NORMAL:
> >  		val = SPMI_COMMON_MODE_HPM_MASK;
> > -	else if (mode == REGULATOR_MODE_FAST)
> > +		break;
> > +	case REGULATOR_MODE_FAST:
> >  		val = SPMI_COMMON_MODE_AUTO_MASK;
> > +		break;
> > +	default:
> > +		val = 0;
> > +		break;
> > +	}
> 
> For this part:
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >  
> >  	return spmi_vreg_update_bits(vreg, SPMI_COMMON_REG_MODE, val, mask);
> >  }
> > @@ -1834,9 +1842,9 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
> >  			}
> >  		}
> >  
> > -		if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430) {
> 
> Squash this into patch 1.
> 
> Regards,
> Bjorn
> 
> > +		if (vreg->set_points->count == 1) {
> >  			/* since there is only one range */
> > -			range = spmi_regulator_find_range(vreg);
> > +			range = vreg->set_points->range;
> >  			vreg->desc.uV_step = range->step_uV;
> >  		}
> >  
> > -- 
> > 2.17.1
> > 
