From: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: NSP: Correct RAM amount for BCM958625HR board
Date: Thu, 14 Jul 2016 14:18:08 -0400
Message-ID: <CAC3K-4ra7wmhqUi_Tc5KrML5uJGLX7-YPF1Upt=7juuTBM6QeA@mail.gmail.com>
References: <1468433929-12232-1-git-send-email-jon.mason@broadcom.com> <5786B159.7060102@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5786B159.7060102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 13, 2016 at 5:23 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 07/13/2016 11:18 AM, Jon Mason wrote:
>> The BCM958625HR board has 2GB of RAM available.  Increase the amount
>> from 512MB to 2GB and add the device type to the memory entry.
>>
>> Signed-off-by: Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/bcm958625hr.dts | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/bcm958625hr.dts b/arch/arm/boot/dts/bcm958625hr.dts
>> index 4239e58..66c658a 100644
>> --- a/arch/arm/boot/dts/bcm958625hr.dts
>> +++ b/arch/arm/boot/dts/bcm958625hr.dts
>> @@ -47,7 +47,8 @@
>>       };
>>
>>       memory {
>> -             reg = <0x60000000 0x20000000>;
>> +             device_type = "memory";
>> +             reg = <0x60000000 0x40000000>;
>
> That's just one 1GB, did you intend to provide 0x8000_0000 instead here?

Good catch!  I'll fix that up in v2 (and add a "Fixes:" referencing
the original patch).

Thanks,
Jon

> --
> Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
