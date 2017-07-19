From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 3/7] phy: qcom-qmp: Fix phy pipe clock name
Date: Wed, 19 Jul 2017 08:38:03 +0530
Message-ID: <CAFp+6iEeu6rubQ+uDauCMbZa6LJoWaNJV04xb5AWL715U-e2Yw@mail.gmail.com>
References: <1500293043-1887-1-git-send-email-varada@codeaurora.org>
 <1500293043-1887-4-git-send-email-varada@codeaurora.org> <20170717223047.GA20973@minitux>
 <20170718085440.GD32439@codeaurora.org> <20170718165644.GF20973@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170718165644.GF20973@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Varadarajan Narayanan <varada-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org, kishon <kishon-l0cyMroinI0@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Wei Yongjun <weiyongjun1-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 10:26 PM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue 18 Jul 01:54 PDT 2017, Varadarajan Narayanan wrote:
>> On Mon, Jul 17, 2017 at 03:30:47PM -0700, Bjorn Andersson wrote:
> [..]
>> >
>> > This would be the case for any existing dts files, so you're not allowed
>> > to treat this as an error.
>>
>> Since, there are no dts files that presently enable this driver,
>> wouldn't it be better to flag this as an error now itself instead
>> of having to fall back to old handling (which as mentioned above
>> is incomplete). Please let me know.
>>
>
> You're right, hopefully we can introduce it in the upstream dts for
> v4.14...
>
> So it does make sense to fix this up now, rather than live with the
> fallback forever. Can you ensure we get an "ack" from Vivek on this?

Right, it makes sense to get this name from the dt (since same
will be also available in the clock entry), and not assume the name
based on some logic.
And since we don't have any already existing bindings, it's good that
we fix it now.

>
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
