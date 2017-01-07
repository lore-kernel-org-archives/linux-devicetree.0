From: vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Subject: Re: [PATCH v3 4/4] phy: qcom-qmp: new qmp phy driver for
 qcom-chipsets
Date: Sun, 08 Jan 2017 00:11:14 +0530
Message-ID: <2e93e810adbc252cd630d89bb753ec81@codeaurora.org>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
 <1482253431-23160-5-git-send-email-vivek.gautam@codeaurora.org>
 <20170106071834.GP10531@minitux>
 <e83564d4-d731-44dd-40d1-e36fa56f4920@codeaurora.org>
 <20170106211722.GT10531@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170106211722.GT10531@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-01-07 02:47, Bjorn Andersson wrote:
> On Fri 06 Jan 01:47 PST 2017, Vivek Gautam wrote:
> 
>> > > +static int qcom_qmp_phy_com_init(struct qcom_qmp_phy *qphy)
>> > > +{
>> > > +	const struct qmp_phy_cfg *cfg = qphy->cfg;
>> > > +	void __iomem *serdes = qphy->serdes;
>> > > +	int ret;
>> > > +
>> > > +	mutex_lock(&qphy->phy_mutex);
>> > > +	if (qphy->init_count++) {
>> > > +		mutex_unlock(&qphy->phy_mutex);
>> > > +		return 0;
>> > > +	}
>> > As far as I can see phy_init() and phy_exit() already keep reference
>> > count on the initialization and you only call this function from
>> > phy_ops->init, so you should be able to drop this.
>> This is an intermediary function that does the common block 
>> initialization.
>> PHYs like PCIe have a separate common block (apart from SerDes)
>> for all phy channels. We shouldn't program this common block
>> multiple times for each channel. That's why this init_count.
>> 
> 
> You're right!
> 
> Unfortunately it took me several minutes to wrap my head around the phy
> vs multi-lane and I have a really hard time keeping "qcom_qmp_phy" and
> "qmp_phy_desc" apart throughout the driver.
> 
> If I understand correctly the qcom_qmp_phy is the context representing 
> a
> "QMP block", while this is a PHY block it's not actually the phy in
> Linux eyes. The qcom_phy_desc represents a "QMP lane", which in Linux
> eyes is the phys, but as we think of QMP as the PHY this confused me.

That's correct. The qcom_qmp_phy structure represents the QMP phy block
as a whole and not the individual phy lane instances. These phy lanes
are represented by qcom_phy_desc, and are the actual PHYs in Linux eyes.

> 
> How about naming them "struct qmp" and "struct qmp_lane" (or possibly
> qmp_phy) instead? That way we remove the confusion of QMP PHY vs Linux
> PHY and we make the lane part explicit.

Sure, this sounds good to me - "struct qmp" and "struct qmp_phy" (will
call the respective variables as qblk for qmp block (struct qmp) and
qphy for struct qmp_phy).
Thanks for pointing out. Will change them.

Regards
Vivek

> 
> Regards,
> Bjorn
> 
> --
> To unsubscribe from this list: send the line "unsubscribe 
> linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
