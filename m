From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 4/4] phy: qcom-qmp: new qmp phy driver for
 qcom-chipsets
Date: Fri, 6 Jan 2017 13:17:22 -0800
Message-ID: <20170106211722.GT10531@minitux>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
 <1482253431-23160-5-git-send-email-vivek.gautam@codeaurora.org>
 <20170106071834.GP10531@minitux>
 <e83564d4-d731-44dd-40d1-e36fa56f4920@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e83564d4-d731-44dd-40d1-e36fa56f4920@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: robh+dt@kernel.org, kishon@ti.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri 06 Jan 01:47 PST 2017, Vivek Gautam wrote:

> > > +static int qcom_qmp_phy_com_init(struct qcom_qmp_phy *qphy)
> > > +{
> > > +	const struct qmp_phy_cfg *cfg = qphy->cfg;
> > > +	void __iomem *serdes = qphy->serdes;
> > > +	int ret;
> > > +
> > > +	mutex_lock(&qphy->phy_mutex);
> > > +	if (qphy->init_count++) {
> > > +		mutex_unlock(&qphy->phy_mutex);
> > > +		return 0;
> > > +	}
> > As far as I can see phy_init() and phy_exit() already keep reference
> > count on the initialization and you only call this function from
> > phy_ops->init, so you should be able to drop this.
> This is an intermediary function that does the common block initialization.
> PHYs like PCIe have a separate common block (apart from SerDes)
> for all phy channels. We shouldn't program this common block
> multiple times for each channel. That's why this init_count.
> 

You're right!

Unfortunately it took me several minutes to wrap my head around the phy
vs multi-lane and I have a really hard time keeping "qcom_qmp_phy" and
"qmp_phy_desc" apart throughout the driver.

If I understand correctly the qcom_qmp_phy is the context representing a
"QMP block", while this is a PHY block it's not actually the phy in
Linux eyes. The qcom_phy_desc represents a "QMP lane", which in Linux
eyes is the phys, but as we think of QMP as the PHY this confused me.

How about naming them "struct qmp" and "struct qmp_lane" (or possibly
qmp_phy) instead? That way we remove the confusion of QMP PHY vs Linux
PHY and we make the lane part explicit.

Regards,
Bjorn
