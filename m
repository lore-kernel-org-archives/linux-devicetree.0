From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: bcm283x: Add a new EMMC pin group from the
 downstream tree.
Date: Fri, 9 Sep 2016 08:58:05 +0200
Message-ID: <e61a4efa-3685-6694-5fda-3272f6605665@i2se.com>
References: <1473244289-20728-1-git-send-email-kraxel@redhat.com>
 <1473244289-20728-5-git-send-email-kraxel@redhat.com>
 <87650770.23554.026b1e4b-e35d-48e6-9394-7eeea0ff9add.open-xchange@email.1und1.de>
 <1473320687.6698.25.camel@redhat.com>
 <373fe61a-61d4-164e-0760-d68a0c4925dd@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <373fe61a-61d4-164e-0760-d68a0c4925dd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <scott.branden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Scott,

Am 08.09.2016 um 21:50 schrieb Scott Branden:
> Hi Gerd/Eric
>
> On 16-09-08 12:44 AM, Gerd Hoffmann wrote:
>> On Mi, 2016-09-07 at 20:13 +0200, Stefan Wahren wrote:
>>>> Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> hat am 7. September 2016 um 12:31
>>>> geschrieben:
>>>>
>>>>
>>>> From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>>>>
>>>> This will be used for having EMMC (sdhci-bcm2835.c) drive the
>>>> wireless.
>>>
>>> sdhci-bcm2835.c has been replaced by sdhci-iproc.c
>>
>> Ah, right, I'll update the commit msg for v2.
>>
> Should we entirely remove sdhci-bcm2835.c to reduce confusion going
> forward?

did i missed something?

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=46cd175c9788e39a1c57698ab58f34844d216428

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=7eb16493ecaa41ceeb448717ee2c59690cd9047f


>
>>> How about adding pull defines to include/dt-bindings/pinctrl/bcm2835.h?
>>
>> Already there (or do you mean something other than '#define
>> BCM2835_FSEL_*' ?)
>>
>> cheers,
>>   Gerd
>>
>
> Thanks,
>  Scott

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
