From: Sagar Dharia <sdharia-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V3 4/6] slim: qcom: Add Qualcomm Slimbus controller driver
Date: Mon, 17 Aug 2015 17:44:20 -0600
Message-ID: <55D271D4.6020903@codeaurora.org>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
 <1438585190-11894-5-git-send-email-sdharia@codeaurora.org>
 <20150814183106.GE10748@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150814183106.GE10748-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, bp-l3A5Bk7waGM@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gong.chen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, andreas.noever-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, oded.gabbay-5C7GfCeVMHo@public.gmane.org, jkosina-AlSwsSmVLrQ@public.gmane.org, sharon.dvir1-MQgwKvJRKlGYZoqfULhbRA@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kheitke-hxvC4TZJLZFWk0Htik3J/w@public.gmane.org, mlocke-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 8/14/2015 12:31 PM, Mark Brown wrote:
> On Mon, Aug 03, 2015 at 12:59:48AM -0600, Sagar Dharia wrote:
>
>> +/**
>> + * Qualcomm slimbus controller may experience interference on the lines
>> + * causing some early messages (e.g. logical-address assignment) to be
>> + * NACKed. Retry after sometime (typically 1 superframe)
>> + */
>> +static void msm_slim_wait_retry(struct msm_slim_ctrl *dev)
>> +{
>> +	int msec_per_frm = 0;
>> +	int sfr_per_sec;
>> +
>> +	/* Wait for 1 superframe, or default time and then retry */
>> +	sfr_per_sec = dev->framer.superfreq /
>> +			(1 << (SLIM_MAX_CLK_GEAR - dev->ctrl.clkgear));
>> +	if (sfr_per_sec)
>> +		msec_per_frm = MSEC_PER_SEC / sfr_per_sec;
>> +	if (msec_per_frm < DEF_RETRY_MS)
>> +		msec_per_frm = DEF_RETRY_MS;
>> +	msleep(msec_per_frm);
>> +}
> This looks like logic which might be usefully pulled out to the
> framework - I bet this isn't an issue unique to your controller, the
> users (well, one user) look like cases where the bus might be
> destabilised by devices powering up and trying to enumerate under less
> than ideal electrical conditions which seems like something that's
> likely to affect other hardware.

I agree, I will move this to the framework.

Thanks
Sagar

>
>> +	rclk = devm_clk_get(&pdev->dev, "core_clk");
>> +	if (IS_ERR(rclk)) {
>> +		/* unlikely that this is probe-defer */
>> +		dev_err(&pdev->dev, "rclk get failed:%ld\n", PTR_ERR(rclk));
>> +		devm_clk_put(&pdev->dev, hclk);
> No need to call devm_clk_put() explicitly in your probe function.


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
