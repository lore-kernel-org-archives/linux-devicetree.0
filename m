From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] ARM: dts: bcm283x: Reserve first page for firmware
Date: Tue, 9 May 2017 09:52:53 -0700
Message-ID: <bdc05058-f65b-da08-0cf5-51aa1f97852e@gmail.com>
References: <b6aef857-1454-7931-2c60-6d7b55b7a0a8@raspberrypi.org>
 <8737cenfhc.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8737cenfhc.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/09/2017 09:48 AM, Eric Anholt wrote:
> Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org> writes:
> 
>> The Raspberry Pi startup stub files for multi-core BCM27XX processors
>> make the secondary CPUs spin until the corresponding mailbox is
>> written. These stubs are loaded at physical address 0x00000xxx (as seen
>> by the ARMs), but this page will be reused by the kernel unless it is
>> explicitly reserved, causing the waiting cores to execute random code.
>>
>> Use the /memreserve/ Device Tree directive to mark the first page as
>> off-limits to the kernel.
>>
>> See: https://github.com/raspberrypi/linux/issues/1989
>>
>> Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
> 
> This looks great.  We're currently in the merge window, so I can't
> generate a new bcm2835-dt-next yet, but I'll pick this patch up when I
> do.
> 
> Thanks for submitting upstream!

Considering that this is a fix, we could actually squeeze it in the
devicetree/fixes branch and we could submit those as soon as v4.12-rc1
is tagged, your call.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
