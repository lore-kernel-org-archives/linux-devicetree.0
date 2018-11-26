From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v4 2/2] phy: qualcomm: Add Synopsys High-Speed USB PHY
 driver
Date: Mon, 26 Nov 2018 10:30:23 +0800
Message-ID: <20181126023021.GC20417@dragon>
References: <20181119110812.15825-1-shawn.guo@linaro.org>
 <20181119110812.15825-3-shawn.guo@linaro.org>
 <52433bdc-bc05-2ca0-0822-c9fb702b3231@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52433bdc-bc05-2ca0-0822-c9fb702b3231@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 23, 2018 at 03:25:33PM +0530, Kishon Vijay Abraham I wrote:
> > +static int qcom_snps_hsphy_por_reset(struct hsphy_priv *priv)
> > +{
> > +	int ret;
> > +
> > +	ret = reset_control_assert(priv->por_reset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * The Femto PHY is POR reset in the following scenarios.
> > +	 *
> > +	 * 1. After overriding the parameter registers.
> > +	 * 2. Low power mode exit from PHY retention.
> > +	 *
> > +	 * Ensure that SIDDQ is cleared before bringing the PHY
> > +	 * out of reset.
> > +	 */
> > +	qcom_snps_hsphy_exit_retention(priv);
> > +
> > +	/*
> > +	 * As per databook, 10 usec delay is required between
> > +	 * PHY POR assert and de-assert.
> > +	 */
> > +	usleep_range(10, 20);
> > +	ret = reset_control_deassert(priv->por_reset);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * As per databook, it takes 75 usec for PHY to stabilize
> > +	 * after the reset.
> > +	 */
> > +	usleep_range(80, 100);
> > +
> > +	/* Ensure that RESET operation is completed. */
> > +	mb();
> 
> How will you ensure the reset operation is complete with a memory barrier? mb
> usage here looks incorrect to me.

I agree with you, Kishon.  I think memory barrier only ensures the
register write happens rather than that RESET operation completes.
Since the IO accessors already handle memory barrier, I will just drop
the mb() from here and function qcom_snps_hsphy_init_sequence() as well.

@Sriharsha, let us know if you have a story or reason for these memory
barriers.

Shawn
