From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [PATCH v2 1/2] soc: qcom: Add device tree binding for SMEM
Date: Thu, 23 Apr 2015 20:28:19 -0700
Message-ID: <CAJAp7Oj8RsQA6ntRQOiHbmcL8PyZEYhvjSYAeXrbFsH0Rc3KQg@mail.gmail.com>
References: <1428795178-24312-1-git-send-email-bjorn.andersson@sonymobile.com>
	<55394F98.3060600@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55394F98.3060600-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeffrey Hugo <jhugo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andry Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 23, 2015 at 1:01 PM, Jeffrey Hugo <jhugo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 4/11/2015 5:32 PM, Bjorn Andersson wrote:
>>
>> Add device tree binding documentation for the Qualcom Shared Memory
>> manager.
>>
[..]
>
> For my information, is there any intention to support the relocatable
> smem_region by looking it up at init time?  It does not seem like it would
> be possible to support that with this binding.
>

I haven't been able to grasp the purpose of making the smem addresses
completely dynamic. As far as I can see there might be use cases where
certain devices needs to move the smem region from the default area.
But even so, it's not dynamically choosen so it's in essence static -
so we can just encode it in the individual dts files.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
