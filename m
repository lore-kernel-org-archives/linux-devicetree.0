From: Dong Aisheng <aisheng.dong-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/4] arm64: add basic DTS for i.MX8MQ
Date: Thu, 25 Jan 2018 20:34:37 +0800
Message-ID: <e6e2fa31e89872fe89924da17759481e@codeaurora.org>
References: <20180117183244.28303-1-l.stach@pengutronix.de>
 <20180117183244.28303-2-l.stach@pengutronix.de>
 <20180123103609.GD27764@dragon> <1516713799.25726.21.camel@pengutronix.de>
 <ebc8b28d5c2948131cc187ac8177395c@codeaurora.org>
 <1516876026.6411.23.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1516876026.6411.23.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, lauren.post-3arQi8VN3Tc@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-imx-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, aisheng.dong-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-01-25 18:27, Lucas Stach wrote:
> Hi Dong,

<snip>

>> And i see the dtsi file does not include Freescale/NXP copyright,
>> is there a reason?
> 
> The dtsi is quite different from the downstream version. But you are
> right, I looked extensively at the downstream version, so I'll add the
> NXP copyright.
> 

Okay, i see.

> BTW: Could you check internally to see if Freescale/NXP would be okay
> with relicensing the DT bits I pulled from downstream as dual GPL-2.0
> and MIT, to align with other DTs in the kernel?
> 

I thought it should be okay. But i pulled Post Lauren in to give you
a confirmed answer.

Lauren,
Can you help with this question?

>> BTW it's quite strange that my gmail did not receive your MX8MQ patch
>> series except clk part.
>> Lucas, Could you help have me CCed next time?
>> I'd like to help review and test the patch series.
>> 
>> For this time, can you help send them all to me as attachment?
> 
> I'm about to send v2 of the series. I'll CC you on the submission.
> 

Great.

>> (You can also send all IMX related patches to linux-imx-3arQi8VN3Tc@public.gmane.org 
>> maillist
>> i created recently for tracking all IMX related upstream activities.
>> Most Freescale/NXP driver owners are in this list that could help on
>> the review. Shawn, do you think if i can put it in MAINTAINER file?)
> 
> That's great news that there is now a common address for this. I think
> it would be a good idea to have it added to MAINTAINERS as a reviewer.
> 

Thanks for supporting.

Regards
Dong Aisheng

> Regards,
> Lucas
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
