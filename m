From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: Add L2 cache topology to ARM Ltd boards/models
Date: Tue, 24 Feb 2015 15:14:14 +0000
Message-ID: <54EC9546.50005@arm.com>
References: <1421841750-26722-1-git-send-email-sudeep.holla@arm.com> <1542574.d99bFx24pn@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1542574.d99bFx24pn@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On 21/01/15 14:43, Arnd Bergmann wrote:
> On Wednesday 21 January 2015 12:02:30 Sudeep Holla wrote:
>>
>> Hi Arnd/Olof,
>>
>> Though this patch and commit 5d425c18653731af6 ("arm64: kernel: add
>> support for cpu cache information") which is in -next(via arm64) are
>> dependent to provide desired functionality, then can go indepedently
>> if you think there could be conflicts if this change is taken via arm64.
>> If not, Catalin can pick up with your acks after the review.
>
> I think it would be better to take this through arm-soc. It's not
> extremely likely to cause conflicts, but as you say there are no
> strict dependencies on which goes in first, so there is no harm
> in merging them separately.
>

I think this patch got missed for -rc1. The arm64 architectural
support patch for cacheinfo got merged via arm64 tree. It would be good
if this is also merged so that cache information can be exposed
to the user-space on ARM Ltd boards.

Regards,
Sudeep

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
