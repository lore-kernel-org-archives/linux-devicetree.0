From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: bcm2835: Add VC4 to the device tree.
Date: Tue, 8 Mar 2016 11:12:13 -0700
Message-ID: <56DF15FD.3090807@wwwdotorg.org>
References: <1457123528-13482-1-git-send-email-eric@anholt.net>
 <1457123528-13482-4-git-send-email-eric@anholt.net>
 <56DE6A80.1060707@wwwdotorg.org> <87bn6ozw0c.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87bn6ozw0c.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/08/2016 11:04 AM, Eric Anholt wrote:
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>
>> On 03/04/2016 01:32 PM, Eric Anholt wrote:
>>> VC4 is the GPU (display and 3D) present on the 283x.
>>
>>> diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts
>>
>>> +&hdmi {
>>> +	hpd-gpios = <&gpio 46 GPIO_ACTIVE_LOW>;
>>> +};
>>
>> Isn't that the same everywhere? If so, adding it to bcm2835-rpi.dtsi
>> seems like a better idea; it'd avoid duplicating it everywhere.
>
> It's not the same everywhere (_HIGH vs _LOW), which is why it's in the
> individual files.

Oh right, it looks OK then. The series,
Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

One could reduce the duplication by moving the common block into the 
common .dtsi file, but using a board-defined #define for the polarity:

bcm2835-rpi-a-plus.dts:

#define RPI_HDMI_HPD_POLARITY
#include "bcm2835-rpi.dtsi"

bcm2835-rpi.dtsi:

&hdmi {
	hpd-gpios = <&gpio 46 RPI_HDMI_HPD_POLARITY>;
};

... although this case is so tiny I'm not sure there's any benefit 
trying to unify it like that right now.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
