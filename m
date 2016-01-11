From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: Add DT support for Juno r2 board
Date: Mon, 11 Jan 2016 11:12:22 +0000
Message-ID: <56938E16.5090402@arm.com>
References: <1450872611-15326-1-git-send-email-sudeep.holla@arm.com>
 <20151229183521.GL12450@rob-hp-laptop> <5683BE7A.9020404@arm.com>
 <CAL_Jsq+RZk3LnOhGtiXRFmxmA6bTOEdymtF1yN=6q=iRmUr_9Q@mail.gmail.com>
 <5683F971.9000300@arm.com>
 <20160111110909.GD13633@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160111110909.GD13633-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, arm-hC8oa7XEHlfYtjvyW6yDsg@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 11/01/16 11:09, Liviu Dudau wrote:
> On Wed, Dec 30, 2015 at 03:34:09PM +0000, Sudeep Holla wrote:

[...]

>>>>
>>>> AFAIK it is. Liviu can you confirm ?
>>>
>>> Then perhaps you should move this to a common spot.
>>>
>>
>> True, will wait for Liviu's response.
>
> AFAIK Juno r2 should have identical PCIe controller to r1. I have not been able to
> test it myself but at the same time I have no information on any changes applied to
> the IP.
>
> Sudeep, probably worth moving the pcie-controller@40000000 node in juno-base.dtsi
> and disable it by default, then re-enable in juno-r1.dts and juno-r2.dts.
>

Yes, that's exactly what I though as it's present even on R0 but
disabled due to H/W bug. I will do that and repost after merge window.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
